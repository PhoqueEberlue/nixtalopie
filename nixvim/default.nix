{...}: 
let
  # Fetching nixvim from git
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    # Loading nixvim's module so we can use it in programs
    nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    imports = [ 
      ./keymaps.nix 
      ./options.nix 
      ./plugins/nvim-tree.nix
      ./plugins/lsp.nix
      # idk about harpoon, not using it that much
      # ./plugins/harpoon.nix
    ];
    enable = true;

    colorscheme = "kanagawa";
    colorschemes.kanagawa = {
      enable = true;
      settings = {
        transparent = true;
      };
    };

    plugins.auto-save.enable = true;

    globals.mapleader = " ";

  };
}
