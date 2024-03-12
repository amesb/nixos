{ config, lib, pkgs, ... }:

{
  fileSystems."/" =
    { device = "/dev/2230pool/root";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EA58-927B";
      depends = [ "/" ];
      fsType = "vfat";
    };

  fileSystems."/home/amesb/mount" = {
    device = "/run/media/amesb";
    options = [ "bind" ];
  };


  #fileSystems."/storage" =
  #  { device = "/dev/2280pool/storage";
  #    depends = [ "/" ];
  #    fsType = "btrfs";
  #    options = [ "subvol=@" "compress=zstd" "noatime" ];
  #  };

  swapDevices = [ { device = "/dev/2230pool/swap"; } ];
}
