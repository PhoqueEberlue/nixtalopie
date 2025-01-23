# My NixOS configuration

At the moment this is a *vanilla* NixOS configuration i.e. no flakes and home-manager.

File structure:
```
├── configuration.nix <------- ENTRY POINT OF THE CONFIG
├── variables.nix              Global variables
├── overlays.nix
├── common                     Folder containing configurations common to every computers
│   ├── dot-files              Every folder inside dot-files/ will be symlinked to $username/.config/
│   │   ├── fish
│   │   ├── fuzzel
│   │   └── kitty
│   ├── dwl                    Suckless Wayland compositor with my patches
│   ├── fish                   Fish shell
│   └── nixvim                 Neovim editor configured with Nix through the Nixvim project
│       ├── default.nix
│       ├── keymaps.nix
│       ├── options.nix
│       └── plugins            Neovim plugins configuration
├── specific                   Folder containing specific configuration for each computer
│   ├── current -> msi-laptop/ Symlink pointing to the current configuration, it is gitignored
│   ├── hp-laptop
│   │   └── hardware.nix       Specific hardware config for my hp laptop
│   └── msi-laptop
│       ├── hardware.nix       Specific hardware config for my msi laptop
│       └── steam
└── background
```

## Variables

In `./variables.nix` I store my username and nixos config path which will be used in other files.

Make sure to modify these variables accordingly to your config.

In case you lost your user and can't log in anymore: https://wiki.archlinux.org/title/Reset_lost_root_password
