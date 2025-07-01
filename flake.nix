{
  description = "My NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # outputs = { nixpkgs, home-manager, ... }@inputs:
  # let
  # 	system = "x86_64-linux";
  # 	pkgs = nixpkgs.legacyPackages.${system};
  # in {
  # 	nixosConfigurations = {
  # 		nixos = nixpkgs.lib.nixosSystem {
  # 			specialArgs = { inherit system; };
  # 			modules = [
  # 				./configuration.nix
  # 				home-manager.nixosModules.home-manager
  # 			];
  # 		};
  # 	};
  # };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.overlays = [ nur.overlay ]; }
            ./configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };

  # outputs =
  #   inputs@{ nixpkgs, home-manager, ... }:
  #   {
  #     nixosConfigurations = {
  #       nixos = nixpkgs.lib.nixosSystem {
  #         system = "x86_64-linux";
  #         modules = [
  #           ./configuration.nix
  #           home-manager.nixosModules.home-manager
  #         ];
  #       };
  #     };
  #   };
}
