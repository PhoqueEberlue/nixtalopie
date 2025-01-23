{...}: {
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    settings = {
      auto_install = false;
      ensure_installed = "all";
      highlight = {
        additional_vim_regex_highlighting = true;
        custom_captures = { };
        disable = [
        ];
        enable = true;
      };
      ignore_install = [
      ];
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
        enable = true;
      };
      parser_install_dir = {
        __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
      };
      sync_install = false;
    };
  };
}
