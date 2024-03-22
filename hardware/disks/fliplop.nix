{ config, lib, pkgs, ... }:

{
  fileSystems."/" =
    { device = "/dev/pool/root";
      fsType = "ext4";
      options = [ "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0A3D-5EF9";
      depends = [ "/" ];
      fsType = "vfat";
    };

  swapDevices = [ { device = "/dev/pool/swap"; } ];
}
