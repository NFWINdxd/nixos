{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    homemanager.url = "github:nix-community/home-manager";
    homemanager.inputs.nixpkgs.follows = "nixpkgs";
    nix-citizen.url = "github:LovingMelody/nix-citizen";

        # Optional - updates underlying without waiting for nix-citizen to update
        nix-gaming.url = "github:fufexan/nix-gaming";
        nix-citizen.inputs.nix-gaming.follows = "nix-gaming";
  };

  outputs = {self, nixpkgs, ...} @ inputs: {
    nixosConfigurations.nfwin = inputs.nixpkgs.lib.nixosSystem {
     specialArgs = { inherit inputs; };

     modules = [
        ./configuration.nix
        inputs.homemanager.nixosModules.default
      ];
    };
  };


 
}


