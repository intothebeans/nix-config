{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    dive
    docker-compose
    freerdp3
    iproute2
    netcat-gnu
  ];
}
