
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    homemanager.url = "github:nix-community/home-manager";
    homemanager.inputs.nixpkgs.follows = "nixpkgs";
    nix-citizen.url = "github:LovingMelody/nix-citizen";
    nixvim.url = "github:nix-community/nixvim";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";
    dw-proton.url = "github:imaviso/dwproton-flake";
  };

  outputs = {
    self,
    nixpkgs,
    dw-proton,
    ...
  } @ inputs: {
    ani-cli = {
      url = "github:pystardust/ani-cli";
      flake = false;
    };

    nixosConfigurations.nfwin = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
        inputs.homemanager.nixosModules.default
      ];
    };
  };
}
