final: prev: {
  wlroots_0_18 = (prev.wlroots_0_18.overrideAttrs {
    # Fetching wlroots master because the version 0.19 is required for dwl main
    version = "master";
    
    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "master";
      hash = "sha256-itELarxPdIBx5EhDxXZht4Iw8kddaiHVHuAWtf0pGfU=";
    };
  });
  # dwl-custom = (prev.dwl-custom.override {
  #   # My own config
  #   configH = ./dwl/dwl-config.h;
  # });
  dwlb = (prev.dwlb.override {
    # My own config
    configH = ./dwl/dwlb-config.h;
  });
}
