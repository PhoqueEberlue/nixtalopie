{ ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
      };
      formatOnSave = true;
    };
  };
}
