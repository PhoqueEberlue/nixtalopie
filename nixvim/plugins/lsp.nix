# Lsp config file
{...}: {
  plugins = {
    # enabling cmp;
    cmp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;

    lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          # I'll do it myself
          installCargo = false;
          installRustc = false;
          # disable live diagnostics, I think?
          # ?
          settings.diagnostics.enable = false;
        };
        nixd = {
          enable = true;
        };
      };
    };
  };
}
