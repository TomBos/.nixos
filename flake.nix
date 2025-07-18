{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.Nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Set your system architecture
      modules = [
        ./hosts/Nixie/configuration.nix
        ./hosts/Nixie/hardware-configuration.nix
        
        # Home Manager module
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.tombos = import ./hosts/Nixie/home.nix;
          };
        }
      ];
    };
  };
}
