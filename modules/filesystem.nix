{ config, lib, ... }:
{
  options = {
    filesystem.laptop.enable = lib.mkEnableOption "Enable drive automounting for laptop";
    filesystem.server.enable = lib.mkEnableOption "Enable drive automounting for server";
  };

  config = lib.mkMerge [
    (lib.mkIf config.filesystem.laptop.enable {
      # enable swap partition
      swapDevices = [ { device = "/dev/nvme0n1p6"; } ];
      services.gvfs.enable = true;
      # auto mounts
      fileSystems = {
        "/mnt/d" = {
          device = "/dev/sda2";
          fsType = "ntfs";
          mountPoint = "/mnt/d";
          options = [ "defaults" ];
        };
        "/mnt/c" = {
          device = "/dev/nvme0n1p3";
          fsType = "ntfs";
          mountPoint = "/mnt/c";
          options = [
            "nosuid"
            "noatime"
            "nodev"
            "defaults"
          ];
        };
      };
    })
    (lib.mkIf config.filesystem.server.enable {
      # TODO: implement me
    })
  ];
}
