final: prev: {
  wlroots_0_18 = (prev.wlroots_0_18.overrideAttrs {
    # Fetching wlroots master because the version 0.19 is required for dwl main
    version = "master";
    
    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "master";
      hash = "sha256-NnPSC5p/phTFe+nWp9vl8LUbmBO/RXSSUuDZ2boucXY=";
    };
  });
  dwlb = (prev.dwlb.override {
    # My own config
    configH = ./common/dwl/dwlb-config.h;
  });
}
