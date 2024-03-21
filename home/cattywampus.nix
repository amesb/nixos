# cattywampus home-manager configuration

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home.nix
  ];

  home.packages = with pkgs; [
    # framework embedded controll configuration
    fw-ectool
  };

  # the state version that the system had when it was originally installed
  home.stateVersion = "23.11";
}
