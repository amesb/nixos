# configuration to enable hyprland
{ config, pkgs, lib, ... }: {

  # enable hyprland as compositor
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
  };

  # enable portals for screensharing etc
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

    config = {
      common.default = [ "wlr" "gtk" ];
    };
  };

  # allow polkit authentication through kde agent
  environment.systemPackages = with pkgs; [
    polkit
    kdePackages.polkit-kde-agent-1
  ];


}
