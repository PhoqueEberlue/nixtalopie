{ ... }:
{
  plugins.nvim-surround = {
    enable = true;
    settings = {
      keymaps = {
        # insert = "<C-g>s";
        # insert_line = "<C-g>S";
        normal = "<leader>u";
        # normal_cur = "yss";
        # normal_line = "yS";
        # normal_cur_line = "ySS";
        # visual = "S";
        # visual_line = "gS";
        delete = "<leader>i";
        change = "<leader>y";
        change_line = "<leader>Y";
      };
    };
  };
}
