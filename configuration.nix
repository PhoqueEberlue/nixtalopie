# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  dwl-custom = pkgs.callPackage ./dwl/default.nix { configH = ./dwl/dwl-config.h; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./machines/hw-config.nix
      ./nixvim
      # ./dwl
      ./fish
      ./user
      ./steam
      ./variables.nix
    ];

  nixpkgs.overlays = [
    (import ./overlays.nix)
  ];

  # disabling flakes for now
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd /etc/nixos/dwl/start-dwl.fish";
        user = "${config.username}";
      };
    };
  }; 

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # Set your time zone.

  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Fonts
  fonts.packages = with pkgs; [
    fira-code
    nerd-fonts.fira-code
  ];
  
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "FiraCode" ];
    };
  }; 
  
  # Can't manage to make it work, maybe fira doesn't work on console?
  # console.packages = with pkgs; [ fira-code ];  
  # console.font = "fira-code";

  # Needed for dwl, maybe move it to the corresponding file?
  hardware.graphics.enable = true;
  services = {
    xserver = {
      # I think this is necessary for xwayland
      enable = true;
      # This disables the default display manager
      displayManager.startx.enable = true;
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak-intl";
    options = "caps:escape";
  };

  console.useXkbConfig = true; 
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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

    # WM related
    dwl-custom
    dwlb 
    wl-clipboard
    wbg
    grim
    slurp
    mesa

    protonup
    libreoffice
    kitty
    fastfetch
    brave
    fuzzel
    brightnessctl

    spotify
    pavucontrol

    element-desktop
    discord

    tree

    # dev
    util-linux
    git
    gcc
    gnumake
    cmake
    pkg-config
    rustc
    cargo
    graphviz

    texlive.combined.scheme-full
    zathura
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
