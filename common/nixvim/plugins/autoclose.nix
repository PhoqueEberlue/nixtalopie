{...}: {
  plugins.autoclose = {
    enable = true;

    settings = {
      keys = {
        "(" = { escape = false; close = true; pair = "()"; };
        "[" = { escape = false; close = true; pair = "[]"; };
        "{" = { escape = false; close = true; pair = "{}"; };

        ">" = { escape = true; close = false; pair = "<>"; };
        ")" = { escape = true; close = false; pair = "()"; };
        "]" = { escape = true; close = false; pair = "[]"; };
        "}" = { escape = true; close = false; pair = "{}"; };

        "\"" = { escape = true; close = true; pair = "\"\""; };
        "'" = { escape = true; close = false; pair = "''"; };
        "`" = { escape = false; close = false; pair = "``"; };
      };

      options = {
        disabled_file_types = [ "text" ];
        disable_when_touch = true;
        touch_regex = "[%w(%[{]";
        pair_spaces = true;
        auto_indent = true;
        disable_command_mode = false;
      };
    };
  };
}
