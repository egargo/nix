{
  description = "My NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      legacyPackages = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system legacyPackages;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations."bee" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations."clint" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs system; };
        modules = [ ./home-manager ];
        };
    };
}
