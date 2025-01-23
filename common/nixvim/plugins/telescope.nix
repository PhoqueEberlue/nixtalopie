{...}:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      live-grep-args.enable = true;
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Telescope files";
        };
      };
      "<leader>gf" = {
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
      "<leader>gg" = {
        action = "live_grep";
        options = {
          desc = "Live grep";
        };
      };
    };
  };
}
