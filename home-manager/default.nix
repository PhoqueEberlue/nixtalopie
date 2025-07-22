{ system, pkgs, ... }:
{
  services = {
    network-manager-applet.enable = true;
    gnome-keyring.enable = true;
  };

  imports = [
    ./fish
    ./hyprland
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
    pipewire
    wireplumber
    mako
    wev
    woomer
    wbg
    wmenu # for wayland
    dmenu # for xorg
    waybar
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
    tree
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
