final: prev: {
  # Required for wlroots
  kdePackages.wayland-protocols = (prev.kdePackages.wayland-protocols.overrideAttrs rec {
    version = "1.40";

    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wayland";
      repo = "wayland-protocols";
      rev = "${version}";
      hash = "sha256-gZdn4J9O34K0OL6zSFxYvDNNHqkkGY3Kc+S/fv8jdtI=";
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
      hash = "sha256-uqeJ+Kyf2U1kao9uYRqihGimYwb/oOcXEZCccjz4+Sw=";
    };
  }).override {
    wayland-protocols = final.kdePackages.wayland-protocols;
  });
  dwlb = (prev.dwlb.override {
    # My own config
    configH = ./common/dwl/dwlb-config.h;
  }); 
}
