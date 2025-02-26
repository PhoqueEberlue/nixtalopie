{ pkgs, ... }:
let
  # Fetching nixvim from git
  nixvim = import
    (builtins.fetchGit { url = "https://github.com/nix-community/nixvim"; });

  nixvim' = nixvim.legacyPackages.${pkgs.hostPlatform.system};
  nixvimModule = {
    module = import ./config.nix; # import the module directly
  };
  nvim = nixvim'.makeNixvimWithModule nixvimModule;
in
  # Return nvim packaged and ready to go with my configuration
  nvim
