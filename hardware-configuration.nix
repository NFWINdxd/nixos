{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd uinput"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/dd936dea-ebbe-40c3-a63a-14c1db95a687";
    fsType = "ext4";
  };

  fileSystems."/steamdisk" = {
    device = "/dev/disk/by-uuid/88f58c81-d752-47d0-930d-91987db743ca";
    fsType = "ext4";
    options = [
      "users"
      "nofail"
      "exec"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C8AE-12F8";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
 hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;



  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
  


  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;



}
