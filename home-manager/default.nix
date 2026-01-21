{ config, pkgs, ... }:
let
  cdvd = pkgs.callPackage ./cdvd/default.nix { };
in
{
  services = {
    network-manager-applet.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: {
      spotify = super.spotify.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ self.makeWrapper ];
        installPhase = ''
          ${old.installPhase or ""}
          wrapProgram $out/bin/spotify \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
        '';
      });
    })
    (self: super: {
      teams-for-linux = super.teams-for-linux.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ self.makeWrapper ];
        installPhase = ''
          ${old.installPhase or ""}
          wrapProgram $out/bin/teams-for-linux \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
        '';
      });
    })
  ];

  imports = [
    ./fish
    ./wayland
    ../variables.nix # Global variables that can be used through the configuration
  ];

  programs.spotify-player = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12.0;
    };
    themeFile = "kanagawa";
    extraConfig = ''
      scrollback_lines 5000
      clipboard_control write-clipboard read-clipboard write-primary read-primary
    '';
  }; 

  xdg.configFile."helix".source = config.lib.file.mkOutOfStoreSymlink
  "/etc/nixos/home-manager/helix";
  programs.helix = {
    enable = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Enabling Chinese input method
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-chinese-addons
        fcitx5-pinyin-zhwiki
        # TODO: theme not working, probably should be activated somehow
        fcitx5-tokyonight
      ];
      settings.inputMethod = {
        GroupOrder."0" = "Default";
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "pinyin";
        };
        "Groups/0/Items/0".Name = "keyboard-us";
        "Groups/0/Items/1".Name = "pinyin";
      };
    };
  };

  home.packages = with pkgs; [
    # Utils
    lshw
    acpi
    networkmanagerapplet
    openconnect
    btop
    unzip
    zip
    imagemagick
    sxiv
    fastfetch
    pavucontrol
    lm_sensors
    cups
    wakeonlan
    curl
    wget
    xxd
    file
    qmk
    ncdu
    dysk
    riffdiff

    # Wayland related
    wl-clipboard
    grim
    slurp
    brightnessctl
    wdisplays
    wl-mirror
    wev
    woomer
    wbg
    wmenu # for wayland
    hyprpicker
    hyprprop

    # Applications
    firefox
    libreoffice
    spotify
    element-desktop
    discord
    zathura
    gimp
    wasistlos
    obs-studio
    kdePackages.kolourpaint
    xdg-desktop-portal
    teams-for-linux
    cdvd
    pipes-rs
    nbsdgames

    # dev
    util-linux
    gcc
    gnumake
    cmake
    pkg-config
    rustc
    cargo
    cargo-expand
    graphviz
    tree
    inetutils
    libwebp
    zig
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
