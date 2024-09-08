{config, ...}: {
  # enable swap partition
  swapDevices = [{device = "/dev/nvme0n1p6";}];

  # auto mounts
  fileSystems = {
    "/mnt/d" = {
      device = "/dev/sda2";
      fsType = "ntfs";
      mountPoint = "/mnt/d";
      options = ["defaults"];
    };
    "/mnt/c" = {
      device = "/dev/nvme0n1p3";
      fsType = "ntfs";
      mountPoint = "/mnt/c";
      options = ["nosuid" "noatime" "nodev" "defaults"];
    };
  };
}
