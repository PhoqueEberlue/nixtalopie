# Lsp config file
{...}: {
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        # Experimental signature helper
        trigger.signature_help.enabled = true;
        completion.ghost_text.enabled = true;

        sources.default = [ "lsp" "path" "snippets" ];
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
          };
          # Automatically adds brackets after accepting a completion
          accept.auto_brackets.enabled = true;
        };
        keymap = {
          "<Tab>" = [
            "select_and_accept"
          ];
          "<Up>" = [ "select_prev" "fallback" ];
          "<Down>" = [ "select_next" "fallback" ];
        };
      };
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
          # settings.diagnostics.enable = false;
        };
        nixd = {
          enable = true;
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
}
