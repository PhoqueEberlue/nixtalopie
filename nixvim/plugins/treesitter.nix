{ ... }: {
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = false;
          node_decremental = "grm";
          node_incremental = "grn";
          scope_incremental = "grc";
        };
      };
      indent = {
        enable = false;
      };
    };
  };
}
