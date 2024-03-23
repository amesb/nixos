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
  boot.kernelModules = [ "amdgpu" "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ ];

  # enable Power Profiles Daemon for improved battery life
  services.power-profiles-daemon.enable = true;

  # platform and cpu options
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # enable non-root access to keyboard firmware
  hardware.keyboard.qmk.enable = true;

  # have to let the system use my gpu even though it isn't technically
  # reproduceable due to gpu driver shennanigans
  hardware.opengl = {
    enable = true;
    driSupport.enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      mangohud
    ];
    extraPackages32 = with pkgs; [
      mangohud
    ];
  };
}