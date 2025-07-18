{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs:
	let
		system = "x86_64-linux";
		hosts = builtins.readDir ./hosts;

		mkHost = name:
			nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [
					./hosts/${name}/configuration.nix
					./hosts/${name}/hardware-configuration.nix

					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							backupFileExtension = "backup";
							
							users = {
								tombos = import ./hosts/${name}/home.nix;
							};
						};
					}
				];
			};

	in {
		nixosConfigurations = builtins.listToAttrs (
			map (name: {
				name = name;
				value = mkHost name;
			}) (builtins.filter (n: hosts.${n} == "directory") (builtins.attrNames hosts))
		);
	};
}

