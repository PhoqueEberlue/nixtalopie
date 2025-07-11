{
  description = "PhoqueEberlue's NixOS config";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim-phoque.url = "path:./nixvim";
    nixvim-phoque.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixvim-phoque, ... }@inputs: {
    nixosConfigurations.andrew = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.andrew = {
            home.packages = [
              nixvim-phoque.packages.${system}.default
            ];
            imports = [
              ./home-manager
            ];
          };
        }
      ];
    };
  };
}
