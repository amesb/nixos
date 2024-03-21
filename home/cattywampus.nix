# cattywampus home-manager configuration

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home.nix
  ];

  # user configuration
  home.username = "amesb";
  home.homeDirectory = "/home/amesb";

  # the state version that the system had when it was originally installed
  home.stateVersion = "23.11";

  # extra packages
  home.packages = with pkgs; [
    # framework embedded controll configuration
    fw-ectool
  ];

}
