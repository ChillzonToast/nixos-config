{
	description = "My NixOS configuration";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs: {
		nixosConfigurations = {
			nixos = inputs.nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
					./hardware-configuration.nix
					inputs.home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ibilees = import ./home/home.nix;
						home-manager.extraSpecialArgs = { inherit inputs; };
					}
				];
			};
		};
	};
}
