{ lib, pkgs, ... }:
{
  imports = [
    ./waybar.nix
  ];

  # Cursor theme
  home.pointerCursor = {
    enable = true;
    name = "Banana";
    package = pkgs.banana-cursor;
    # hyprcursor.size = 34;
  };

  # Notifier
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;
      font = "FiraCode Nerd Font";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ pkgs.hyprlandPlugins.hyprsplit ];

    xwayland.enable = true;
    # put my config here for now
    extraConfig = lib.strings.fileContents ./hyprland.conf;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };
}
