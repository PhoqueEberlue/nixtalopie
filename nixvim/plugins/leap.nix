{ ... }:
{
  plugins.leap.enable = true;
  keymaps = [
    {
      mode = [ "n" "x" "o"];
      key = "g";
      action = "<Plug>(leap)";
      options = {
        noremap = true;
        desc = "leap";
      };
    }
  ];
}
