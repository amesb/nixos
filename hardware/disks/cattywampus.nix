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

  swapDevices = [ { device = "/dev/2230pool/swap"; } ];
}
