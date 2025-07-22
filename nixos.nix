{ config, pkgs, ...}:
{
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

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "${config.username}";
        };
      };
    };

    xserver = {
      # I think this is necessary for xwayland
      enable = true;
      # This disables the default display manager
      displayManager.startx.enable = true;

      # Also set up dwm when we need
      # Xorg only sessions
      windowManager.dwm.enable = true;

      autoRepeatDelay = 350;
      autoRepeatInterval = 75;

      xkb = {
        layout = "us";
        variant = "dvorak-intl";
        options = "caps:escape";
      };
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwm = (prev.dwm.override {
        conf = ./dwm-config.h;
      });
    })
  ];

  hardware.graphics.enable = true;

  # Enable networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixos"; # Define your hostname.
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
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

    supportedLocales = [ 
      "en_US.UTF-8/UTF-8" "fr_FR.UTF-8/UTF-8" 
    ];
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      fira-code
      nerd-fonts.fira-code
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "FiraCode" ];
      };
    };
  }; 

  # So useful!! I can use the same layout in TTYs
  console.useXkbConfig = true; 

  # Allow unfree packages, needed for nvidia drivers I think
  nixpkgs.config.allowUnfree = true; 
}
