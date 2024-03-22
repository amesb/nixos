# fliplop home-manager configuration

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home.nix
  ];

  # display configuration with kanshi
  services.kanshi = {
    enable = true;
    profiles.default.outputs = [
      { criteria = "DP-1"; mode = "3840x2160@240Hz"; scale = 1.0;  adaptiveSync = true; }
    ];
  };
  

  # user configuration
  home.username = "amesb";
  home.homeDirectory = "/home/amesb";

  # the state version that the system had when it was originally installed
  home.stateVersion = "23.11";

  # extra packages
  home.packages = with pkgs; [
  ];

}
