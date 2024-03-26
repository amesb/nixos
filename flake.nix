{ description = "my flake based nixos configuration"; inputs = {
    # official unstable channel of nixos for the most up to date packages
    # and so that I can feel like I'm living on the edge
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager for more extensive configuration of desktop software, and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };
  };

  outputs = {self, nixpkgs, home-manager, hyprland, ...}@inputs: {
    # configuration for cattywampus
    nixosConfigurations = {
      # cattywampus is my personal laptop
      # Framework 16
      # Ryzen 7840HS with 2x16 DDR5-5600 and RX 7700s
      # 1TB MP600 Mini and 4TB Lexar NM790
      cattywampus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/cattywampus.nix

          # use home-manager as a nixos module rather than standalone
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.amesb = {
              imports = [ ./home/cattywampus.nix ];
            };
          }
        ];
      };
      # fliplop is my desktop computer
      # ryzen 5800x3d with 64GB DDR4-3200
      # 7900xtx (24GB)
      # 2TB Inland Premium and 4TB Teamgroup MP34
      fliplop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # reuse the old fashioned configuration for basics
          ./hosts/fliplop.nix

          # use home-manager as a nixos module rather than standalone
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.amesb = {
              imports = [ ./home/fliplop.nix ];
            };
          }
        ];
      };
    };
  };
}
