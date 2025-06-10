{ 
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins/nvim-tree.nix
    ./plugins/lsp.nix
    ./plugins/auto-save.nix
    ./plugins/telescope.nix
    ./plugins/dap.nix
    ./plugins/autoclose.nix
    ./plugins/gitsigns.nix
    ./plugins/image.nix
    ./plugins/treesitter.nix
    ./plugins/toggleterm.nix
    # ./plugins/nvim-surround.nix
  ];

  clipboard.register = "unnamedplus";

  colorscheme = "kanagawa";
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      transparent = true;
      # Important to disable the background color of line numbers
      # colors.theme.all.ui.bg_gutter = "none";
    };
  };

  plugins.nix.enable = true;

  globals.mapleader = " ";

  # Always display signcolumn even if there are no diagnostic icons to prevent "jumping" (Not available through opts.* apparently?)
  extraConfigVim = ''
  set scl=yes
  '';
}
