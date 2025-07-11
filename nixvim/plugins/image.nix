{...}: {
  plugins.image = {
    enable = true;
    settings = {
      integrations = {
        markdown.enabled = false;
      };
    };
  };
}
