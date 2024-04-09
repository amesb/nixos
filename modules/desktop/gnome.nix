# configuration to enable gnome with my preferred defaults
{ config, pkgs, lib, ... }: {

  # enable core gnome services
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # exclude unneeded packages
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music # music player
    epiphany # web browser
    geary # email reader
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);


  # enable extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    gnomeExtensions.appindicator
  ];

}
