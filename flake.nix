{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    homemanager.url = "github:nix-community/home-manager";
    homemanager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ...} @ inputs: {
    nixosConfigurations.nfwin = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        inputs.homemanager.nixosModules.default
      ];
    };
  };
}
