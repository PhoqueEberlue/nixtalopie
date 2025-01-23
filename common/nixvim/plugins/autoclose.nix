{...}: {
  plugins.autoclose = {
    enable = true;

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
      disabledFiletypes = [ "text" ];
      disableWhenTouch = true;
      touchRegex = "[%w(%[{]";
      pairSpaces = true;
      autoIndent = true;
      disableCommandMode = false;
    };
  };

}
