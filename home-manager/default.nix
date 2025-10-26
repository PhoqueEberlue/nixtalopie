{ pkgs, ... }:
let
  cdvd = pkgs.callPackage ./cdvd/default.nix { };
in
{
  services = {
    network-manager-applet.enable = true;
  };

  imports = [
    ./fish
    ./wayland
    ../variables.nix # Global variables that can be used through the configuration
  ];

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
    '';
  }; 

  # Enabling Chinese input method
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-chinese-addons
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
    whatsapp-for-linux 
    obs-studio
    kdePackages.kolourpaint
    xdg-desktop-portal
    cdvd

    # dev
    util-linux
    git
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
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
