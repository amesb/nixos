{ config, pkgs, ... }:

{
  home.username = "amesb";
  home.homeDirectory = "/home/amesb";

  # river window manager for desktop environment
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;

    extraConfig = import ./dotfiles/river/init;
  };

  home.packages = with pkgs; [
    # general utilities
    file
    which
    tree
    ethtool
    pciutils
    usbutils

    # compression/decompression
    zip
    xz
    unzip
    p7zip

    # system monitoring
    htop
    btop
    strace
    ltrace
    lsof
    lm_sensors

    # vanity
    neofetch

    # graphical utilities
    bemenu
  ];

  programs.git = {
    enable = true;
    userName = "Bryan Ames";
    userEmail = "b130610@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=14";
      };
    };
  };

  programs.firefox = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  services = {
    playerctld.enable = true;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
