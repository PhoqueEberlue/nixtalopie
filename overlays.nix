final: prev: {
  # Required for wlroots
  kdePackages.wayland-protocols = (prev.kdePackages.wayland-protocols.overrideAttrs rec {
    version = "1.41";

    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wayland";
      repo = "wayland-protocols";
      rev = "${version}";
      hash = "sha256-mTYtF9mOVw6NGwwOoO63fwut1Qh5VriaCvsixNmAHJE=";
    };
  });
  wlroots_0_18 = ((prev.wlroots_0_18.overrideAttrs rec {
    # Fetching wlroots master because the version 0.19 is required for dwl main
    version = "master";
    
    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "${version}";
      hash = "sha256-979JgP8DXsIrNP/FquEulQkKOs06F8IklxzClpaPTb0=";
    };
  }).override {
    wayland-protocols = final.kdePackages.wayland-protocols;
  });
  dwlb = (prev.dwlb.override {
    # My own config
    configH = ./common/dwl/dwlb-config.h;
  }); 
}
