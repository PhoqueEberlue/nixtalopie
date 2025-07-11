# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz;
in
{
  imports = [
    ./common           # Common configuration for all computers
    ./specific/current # Specific configuration for each computer
    ./variables.nix    # Global variables that can be used through the configuration
    (import "${home-manager}/nixos") # Home manager
  ];

  nixpkgs.overlays = [
    (import ./overlays.nix)
  ];

  home-manager.useGlobalPkgs = true;

  home-manager.users.andrew = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = [ pkgs.hyprlandPlugins.hyprsplit ];

      xwayland.enable = true;
      # put my config here for now
      extraConfig = lib.strings.fileContents ./hyprland.conf;
    };

    home.packages = [ pkgs.tmux ];
  
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.05";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
