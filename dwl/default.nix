{ pkgs, ... }: 
{
  # Setting up DWL with a lot of overlays because I want to use specific versions
  nixpkgs.overlays = [
    ( final: prev: {
        wlroots_0_18 = (prev.wlroots_0_18.overrideAttrs {
          # Fetching wlroots master because the version 0.19 is required for dwl main
          version = "master";
          
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.freedesktop.org";
            owner = "wlroots";
            repo = "wlroots";
            rev = "master";
            hash = "sha256-2bMV213ENfYWzzujlZ7c477/1pexrQttWeM3mvqdoLs=";
          };
        });
      }
    )
    ( final: prev: {
        dwl = ((prev.dwl.overrideAttrs {
          # Fetching main because my patches require the last version
          version = "main";

          src = pkgs.fetchFromGitea {
            domain = "codeberg.org";
            owner = "dwl";
            repo = "dwl";
            rev = "main";
            hash = "sha256-oOJLsJMYNpQOIrbX8L0GNwg7U+JddaPBsSuI3I2Zf8Q="; 
          };

          patches = [
            ./mergedallpatch.patch
          ];
          }).override {
            # My own config
            configH = ./dwl-config.h;
          });
      }
    )
    ( final: prev: {
        dwlb = (prev.dwlb.override {
          # My own config
          configH = ./dwlb-config.h;
        });
      }
    )
  ];
}
