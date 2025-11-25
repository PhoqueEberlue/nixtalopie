{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      keys = {
        normal = {
          h = "move_char_left";
          t = "move_visual_line_down";
          n = "move_visual_line_up";
          s = "move_char_right";
        };
      };
    };
  };
}
