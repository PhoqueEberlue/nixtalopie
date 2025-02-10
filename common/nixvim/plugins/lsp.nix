# Lsp config file
{ pkgs, ...}: {
  plugins = {
    # Even more snippets
    nvim-snippets = {
      enable = true;
      settings = {
        create_autocmd = true;
        create_cmp_source = true;
        extended_filetypes = {
          typescript = [
            "javascript"
          ];
        };
        friendly_snippets = true;
        global_snippets = [
          "all"
        ];
        ignored_filetypes = [
        #  "lua"
        ];
        search_paths = [
          {
            __raw = "vim.fn.stdpath('config') .. '/snippets'";
          }
        ];
      };
    };

    cmp-emoji = {
      enable = true;
    };

    cmp = {
      enable = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          # {
          #   name = "buffer"; # text within current buffer
          #   option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          #   keywordLength = 3;
          # }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<Up>" = "cmp.mapping.select_prev_item()";
          # "<C-e>" = "cmp.mapping.abort()";
          # "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          # "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    # cmp_luasnip = {
    #   enable = true; # snippets
    # };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    }; 

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
        };
        typst_lsp = {
          package = pkgs.tinymist;
          enable = true;
        };
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
      };
      keymaps.lspBuf = {
        "X" = "hover";
        "gr" = "references";
        "gd" = "definition";
        "gi" = "implementation";
        "gt" = "type_definition";
        "R" = "rename";
      };
    };
  };

  keymaps = [
    {
      key = "gl";
      action = ":lua vim.diagnostic.open_float() <CR>";
      options = {
        noremap = true;
        desc = "Show diagnostic";
      };
    }
  ];
}
