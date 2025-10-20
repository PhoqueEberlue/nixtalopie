{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ pkgs.hyprlandPlugins.hyprsplit ];

    xwayland.enable = true;
    # put my config here for now
    extraConfig = lib.strings.fileContents ./hyprland.conf;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk pickers
      xdg-desktop-portal-hyprland
    ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
        # "org.freedesktop.impl.portal.ScreenCast" = [
        #   "gnome"
        # ];
      };
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  # systemd.user.services.xdg-desktop-portal-hyprland = {
  #   Service = {
  #     Environment = "XDG_CURRENT_DESKTOP=Hyprland";
  #     ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
  #   };
  # };
}
