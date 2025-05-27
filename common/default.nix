{ config, pkgs, ...}:
let 
  nvim-custom = pkgs.callPackage ./nixvim/default.nix { inherit pkgs; system = config.system; };
in
{
  imports = [
    ./fish
    ./dot-files
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 3;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${config.username}" = {
    isNormalUser = true;
    description = "andrew";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
    packages = with pkgs; [];
  };

  security.sudo.extraRules = [
    {
      users = [ "${config.username}" ];
      commands = [
        # Security goes brrrrrrrrrrrrr
        { command = "ALL" ; options= [ "NOPASSWD" ]; }
      ];
    }
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd /etc/nixos/common/dwl/start-dwl.fish";
        user = "${config.username}";
      };
    };
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # Set your time zone.

  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LANG = "en_US.UTF-8";
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "en_US.UTF-8";
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

  # Needed for dwl
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

  # So useful!! I can use the same layout in TTYs
  console.useXkbConfig = true; 

  # Allow unfree packages, needed for nvidia drivers I think
  nixpkgs.config.allowUnfree = true;

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

    # WM related
    dwl
    dwlb 
    wl-clipboard
    wbg
    grim
    slurp
    fuzzel
    brightnessctl
    wdisplays
    wl-mirror

    # Applications
    brave
    libreoffice
    kitty
    spotify
    element-desktop
    discord
    zathura
    gimp
    whatsapp-for-linux

    # dev
    nvim-custom
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
}
