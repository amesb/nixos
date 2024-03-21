# non-host-specific system configuration
{ config, pkgs, lib, ... }:

{
  # nix configuration
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;


  #
  # Core System Components
  #

  # Enable networking
  networking.networkmanager.enable = true;

  # enable dhcp
  networking.useDHCP = lib.mkDefault true;

  # enable wireguard for vpn, and allow it through the firewall
  networking.wireguard.enable = true;
  networking.firewall.checkReversePath = "loose";

  # enable non-priviledged mounting of disks through udisks
  services.udisks2.enable = true;

  # Enable sound
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # enable ssh key management agent
  programs.ssh = {
    startAgent = true;
    agentTimeout = "2h";
    extraConfig = ''
      AddKeysToAgent yes
    '';

  };

  # Enable file sync with syncthing
  services.syncthing = {
    enable = true;
    user = "amesb";
    group = "users";
    dataDir = "/home/amesb";
    configDir = "/home/amesb/.config/syncthing";
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

  #
  # localization and language
  #

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  #
  # system packages
  #

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    nerdfonts
  ];

  # software that I prefer to install at a system level rather than in home-manager
  programs.dconf.enable = true;
}
