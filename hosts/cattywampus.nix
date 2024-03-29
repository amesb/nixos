# cattywampus system configuration

{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      # include general system configurations
      ./configuration.nix
      # include hardware specific configurations
      ../hardware/cattywampus.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_6_8;

  # hostname
  networking.hostName = "cattywampus"; # Define your hostname.

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

  # enable network streaming of audio (export and import)
  hardware.pulseaudio.zeroconf.discovery.enable
  hardware.pulseaudio.zeroconf.publish.enable


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
