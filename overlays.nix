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
    version = "0.19.0";
    
    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "${version}";
      hash = "sha256-I8z50yA/ukvXEC5TksG84+GrQpfC4drBJDRGw0R8RLk=";
    };
  }).override {
    wayland-protocols = final.kdePackages.wayland-protocols;
  });
  dwl = ((prev.dwl.overrideAttrs rec {
    version = "main";

    src = prev.fetchFromGitea {
      domain = "codeberg.org";
      owner = "dwl";
      repo = "dwl";
      rev = version;
      hash = "sha256-RZGHNqK0JVlI/9ExUUfs5IQK958/Wox3NIjce4DXC+0="; 
    };

    patches = [
      ./common/dwl/ipc.patch
      ./common/dwl/restart.patch
      ./common/dwl/nextlayout.patch
      ./common/dwl/restore-monitor.patch
      ./common/dwl/cursor-theme.patch
    ];
  }).override {
      configH = ./common/dwl/dwl-config.h;
      wlroots = final.wlroots_0_18;
    });
  dwlb = (prev.dwlb.override {
    # My own config
    configH = ./common/dwl/dwlb-config.h;
  }); 
}
