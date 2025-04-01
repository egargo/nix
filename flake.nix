{
	description = "My NixOS Configurations";

	inputs = {
		# nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations.bee = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
			];
		};
	};
}
