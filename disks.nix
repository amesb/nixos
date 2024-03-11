{ config, lib, pkgs, ... }:

{
  fileSystems."/" =
    { device = "/dev/pool/root";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EA58-927B";
      fsType = "vfat";
    };

  swapDevices = [ { device = "/dev/pool/swap"; } ];
}
