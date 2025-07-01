{
	description = "My NixOS Configurations";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		# nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, nur, ... }@inputs:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			nixosConfigurations = {
				bee = nixpkgs.lib.nixosSystem {
					specialArgs = { inherit inputs; };
					modules = [
						{ nixpkgs.overlays = [ nur.overlay ]; }
						./configuration.nix
						home-manager.nixosModules.home-manager
					];
				};
			};
		};
}
