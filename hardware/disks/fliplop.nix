{ config, lib, pkgs, ... }:

{
  fileSystems."/" =
    { device = "/dev/pool/root";
      fsType = "ext4";
      options = [ "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EA58-927B";
      depends = [ "/" ];
      fsType = "vfat";
    };

  swapDevices = [ { device = "/dev/pool/swap"; } ];
}
