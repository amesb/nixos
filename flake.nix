{
  description = "my flake based nixos configuration";

  inputs = {
    # official unstable channel of nixos for the most up to date packages
    # and so that I can feel like I'm living on the edge
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}@inputs: {
    # configuration for cattywampus
    nixosConfigurations.cattywampus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # reuse the old fashioned configuration for basics
        ./configuration.nix
      ];
    };
  };
}
