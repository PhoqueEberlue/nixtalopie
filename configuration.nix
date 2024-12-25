# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./machines/hw-config-msi.nix
      ./nixvim
      ./dwl
    ];

  # disabling flakes for now
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andrew = {
    isNormalUser = true;
    description = "andrew";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
    packages = with pkgs; [];
  };

  security.sudo.extraRules = [
    {  
      users = [ "andrew" ];
      commands = [
        # Security goes brrrrrrrrrrrrr
        { command = "ALL" ; options= [ "NOPASSWD" ]; }
      ];
    }
  ];
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    git
    acpi

    dwl
    dwlb 
  
    kitty
    fastfetch
    brave
    fuzzel
    brightnessctl

    rustc
    cargo

    spotify
    pavucontrol

    wl-clipboard
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
