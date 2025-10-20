{...}: {
  plugins.nvim-tree = {
    enable = true;
    openOnSetup = true;
    settings = {
        disableNetrw = true;
        git = {
        # Do not hide gitignored files
        ignore = false;
      };

      view = {
        preserveWindowProportions = true;
        width = 30;
      };
    };
  };

  # Needed for nvim-tree
  plugins.web-devicons.enable = true;

  keymaps = [
    {
      key = "<leader>te";
      action = ":NvimTreeToggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>tr";
      action = ":NvimTreeRefresh<cr>";
      mode = [ "n" ];
    }
  ];
}
