{
  description = "my flake based nixos configuration";

  inputs = {
    # official unstable channel of nixos for the most up to date packages
    # and so that I can feel like I'm living on the edge
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager for more extensive configuration of desktop software, and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # most up to date ollama builds
    ollama.url = "github:abysssol/ollama-flake";
  };

  outputs = {self, nixpkgs, home-manager, ollama, ...}@inputs: {
    # configuration for cattywampus
    nixosConfigurations.cattywampus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # reuse the old fashioned configuration for basics
        ./configuration.nix

        # use home-manager as a nixos module rather than standalone
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.amesb = {
            imports = [ ./home.nix ];
          };
        }
      ];
    };
  };
}
