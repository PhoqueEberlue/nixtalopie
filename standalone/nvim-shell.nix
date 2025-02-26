let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {};
  nixtalopie = builtins.fetchTarball {
    url = "https://github.com/PhoqueEberlue/nixtalopie/archive/main.tar.gz";
  };
  nvim-custom = import "${nixtalopie}/common/nixvim/default.nix" { inherit pkgs; system = pkgs.hostPlatform.system; };
in
  pkgs.mkShell {
    packages = [ nvim-custom ];
  }
