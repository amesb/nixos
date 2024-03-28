# common home-manager configuration for all hosts

{ config, pkgs, inputs, ... }:

{
  # allow home-manager to manage itself
  programs.home-manager.enable = true;

  # river window manager for desktop environment
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;

    extraConfig = import ../dotfiles/river/init.nix;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
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
    settings = import ../dotfiles/mangohud-config.nix;
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

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
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
    way-displays

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
    rocmPackages.rocm-smi
    ryzenadj
    powertop

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
    bibata-cursors
    wofi

    # audio tools
    lsp-plugins
    calf
    pavucontrol
    helvum
    pulsemixer

    # icons and themes
    gnome.adwaita-icon-theme

    # media tools
    ffmpeg
    imv

    # mpv stuff
    mpv
    yt-dlp
    mpvScripts.uosc
    mpvScripts.webtorrent-mpv-hook
    mpvScripts.sponsorblock
    mpvScripts.mpris
    adl
    anime-downloader
    trackma

    # games
    prismlauncher
    protontricks
  ];

  # aliases
  home.shellAliases = {
    "nrs" = "sudo nixos-rebuild switch --flake /home/amesb/nixos";
  };
}
