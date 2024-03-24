# fliplop system configuration

{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      # include general system configurations
      ./configuration.nix
      # include hardware specific configurations
      ../hardware/fliplop.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_6_8;

  # hostname
  networking.hostName = "fliplop"; # Define your hostname.
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amesb = {
    isNormalUser = true;
    description = "Bryan Ames";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "audio" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIiF+v8UWPwZGfHfv2sFciVPnu41YEZXNU68pgGkmzMM b130610@gmail.com"
    ];
  };

  programs.steam.enable = true;

  # enable plasma 6 to try hdr stuff
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
