{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    vm.enable = lib.mkEnableOption "Enable virtualization";
    docker.enable = lib.mkEnableOption "Enable Docker";
  };
  config = lib.mkMerge [
    (lib.mkIf config.vm.enable {
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;
    })
    (lib.mkIf config.docker.enable {
      virtualisation.docker = {
        enable = true;
        logDriver = "local";
      };
      environment.systemPackages = with pkgs; [
        dive
        docker-compose
      ];
    })
  ];
}
