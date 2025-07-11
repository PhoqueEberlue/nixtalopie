{ lib, pkgs, ... }:
{
  # home.packages = [ pkgs.fishPlugins.grc ];
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    # Can't make it work apparently
    # plugins = [
    #   { name = "grc"; src = pkgs.fishPlugins.grc.src; } 
    # ];

    shellInit = lib.strings.fileContents ./config.fish;
  };
}
