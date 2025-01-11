# My NixOS configuration

At the moment this is a *vanilla* NixOS configuration i.e. no flakes and home-manager.

File structure:
```
├── configuration.nix <--------- Entry point
├── dwl                          DWL Wayland compositor with my patches
│   ├── default.nix
│   ├── dwlb-config.h
│   ├── dwl-config.h
│   ├── mergedallpatch.patch
│   ├── start-dwl.fish
│   └── update-dwlb.sh
├── fish
│   └── default.nix
├── machines                     Configuration for each machine
│   └── hw-config-msi.nix
├── nixvim                       Neovim declarative configuration using Nixvim 
│   ├── default.nix
│   ├── keymaps.nix
│   ├── options.nix
│   └── plugins                  Neovim plugins configuration
│       ├── auto-save.nix
│       ├── harpoon.nix
│       ├── lsp.nix
│       ├── nvim-tree.nix
│       ├── telescope.nix
│       └── treesitter.nix
├── todo.md
├── user                         User related configuration
│   ├── default.nix
│   └── dot-files                dot-files, every folder inside will be symlinked to .config
│       ├── fish
│       │   ├── conf.d
│       │   ├── config.fish
│       │   └── fish_variables
│       └── fuzzel
│           └── fuzzel.ini
└── variables.nix                Global variables
```

## Variables

In `./variables.nix` I store my username and nixos config path which will be used in other files.

Make sure to modify these variables accordingly to your config.
