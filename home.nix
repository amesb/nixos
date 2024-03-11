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
    brightnessctl

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

    # gui software
    bemenu
    keepassxc
    slurp
    grim
    wl-screenrec

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
    profiles."default" = {
      search.default = "DuckDuckGo";
      settings = {
        "mousewheel.default.delta_multiplier_x" = 30;
        "mousewheel.default.delta_multiplier_y" = 30;
        "mousewheel.default.delta_multiplier_z" = 30;

        "media.ffmpeg.vaapi.enabled" = true;
      };
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  services = {
    playerctld.enable = true;
    cliphist.enable = true;
  };

  xdg = {
    enable = true;
    userDirs = {
      createDirectories = true;

      desktop = "/home/amesb/desktop";
      documents = "/home/amesb/documents";
      download = "/home/amesb/downloads";
      music = "/home/amesb/storage/media/music";
      pictures = "/home/amesb/storage/media/images";
      videos = "/home/amesb/storage/media/videos";
      publicShare = "/home/amesb/share";
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
