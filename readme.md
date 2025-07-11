# My NixOS configuration

~At the moment this is a *vanilla* NixOS configuration i.e. no flakes and home-manager.~

I have now fully embraced flakes and home-manager, but take a look at this commit [`a508b8e46473ad9c2de420f98e8793100d37e954`](https://github.com/PhoqueEberlue/nixtalopie/tree/a508b8e46473ad9c2de420f98e8793100d37e954)
if you want to see a vanilla config.

File structure:
```
├── flake.nix         <------- ENTRY POINT OF THE CONFIG
├── variables.nix              Global variables
├── nixos.nix                  Non-home-manager config
├── home-manager
│   ├── default.nix
│   ├── fish
│   └── hyprland
├── nixvim                     Using neovim declaratively with the nixvim project
│   ├── config.nix
│   ├── flake.lock
│   ├── flake.nix
│   ├── keymaps.nix
│   ├── options.nix
│   └── plugins                Neovim plugins configurations
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
