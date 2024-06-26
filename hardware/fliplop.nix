{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      # disk configuration
      ./disks/fliplop.nix
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "amdgpu" "kvm-amd" "i2c-dev" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ ];

  # enable xbox driver
  hardware.xone.enable = true;

  # enable varios steam hardware like controllers and vr
  hardware.steam-hardware.enable = true;

  # enable Power Profiles Daemon for improved battery life
  services.power-profiles-daemon.enable = true;

  # platform and cpu options
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # enable non-root access to keyboard firmware
  hardware.keyboard.qmk.enable = true;

  # enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # have to let the system use my gpu even though it isn't technically
  # reproduceable due to gpu driver shennanigans
  hardware.opengl = {
    enable = true;
    driSupport.enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      mangohud
      gamescope
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      gamescope
    ];
  };
}
