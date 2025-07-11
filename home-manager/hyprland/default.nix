{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ pkgs.hyprlandPlugins.hyprsplit ];

    xwayland.enable = true;
    # put my config here for now
    extraConfig = lib.strings.fileContents ./hyprland.conf;
  };
}
