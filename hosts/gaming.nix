# gaming related packages

{ config, pkgs, lib, hyprland, ... }:

{
  imports =
    [ 
    ];

  # enable gaming software
  programs.steam.enable = true;
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };

  # enable lutris with dependencies
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraLibraries = pkgs: [
      ];
      extraPkgs = pkgs: [
	gamemode
	gamescope
	mangohud
      ];
    })
  ];
}
