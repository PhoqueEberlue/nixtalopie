{...}:
{
  programs.waybar = {
    enable = true;
    style = ./waybar-style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;

        modules-left = ["hyprland/workspaces" "hyprland/submap" ];
        modules-center = ["hyprland/window"];
        modules-right = ["temperature" "pulseaudio" "battery" "clock" "tray"];

        "hyprland/window" = {
          separate-outputs = true;
        };

        tray = {
          icon-size = 18;
          spacing = 15;
        };

        clock = {
          format = "{:%a %b %e  %R}";
          interval = 30;
        };

        battery = {
          bat = "BAT0";
          states = {
            full = 99;
            good = 70;
            normal = 50;
            warning = 30;
            critical = 10;
          };

          format = "{icon}  {capacity}%";
          format-good = "{icon}  {capacity}%"; 
          format-full = "  {capacity}%";
          format-icons = ["" "" "" "" ""];
          interval = 30;
        };

        temperature = {
          thermal-zone = 0;
          format = "{icon} {temperatureC}°C";
          format-icons =[""];
          interval = 30;
        };

        pulseaudio = {
          format = "{icon}  {volume}%  ";
          format-bluetooth = "  {volume}%  ";
          format-muted ="󰝟 ";
          interval = 60;

          format-icons = {
            default = [""];
          };

          on-click = "blueman-manager";
        };
      };
    };
  };
}
