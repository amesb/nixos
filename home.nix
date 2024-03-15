{ config, pkgs, ... }:

{
  home.username = "amesb";
  home.homeDirectory = "/home/amesb";

  # river window manager for desktop environment
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;

    extraConfig = import ./dotfiles/river/init.nix;
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
    bc
    graphviz
    gnuplot

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
    amdgpu_top

    # vanity
    neofetch

    # gui software
    bemenu
    keepassxc
    slurp
    grim
    wl-screenrec
    wl-clipboard
    wtype
    gnome.dconf-editor
    playerctl
    stalonetray
    obsidian
    blender-hip
    gimp
    inkscape
    libreoffice

    # audio tools
    lsp-plugins
    calf
    pavucontrol
    helvum
    pulsemixer

    # icons and themes
    gnome.adwaita-icon-theme

    # media tools
    mpv
    ffmpeg
    imv

    adl
    anime-downloader
    trackma

    # games
    prismlauncher
  ];

  home.shellAliases = {
    "nrs" = "sudo nixos-rebuild switch --flake /home/amesb/nixos";
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.git = {
    enable = true;
    userName = "Bryan Ames";
    userEmail = "b130610@gmail.com";
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

  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = import ./config/mangohud-config.nix;
  };

  services = {
    playerctld.enable = true;
    cliphist.enable = true;
    easyeffects.enable = true;
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

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      color-scheme = "prefer-dark";
     };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
