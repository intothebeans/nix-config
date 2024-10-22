# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  config,
  pkgs,
  inputs,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/modules.nix
    inputs.agenix.nixosModules.default
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  filesystem.server.enable = true;
  sshConfig.enable = true;
  docker.enable = true;
  desktop.enable = false;
  nvidia.enable = false;
  vm.enable = false;

  age.secrets.wifi.file = ../../secrets/wifi.age;
  age.secrets.postfix.file = ../../secrets/postfix.age;

  # bootloader
  boot = {
    initrd.systemd.tpm2.enable = false;
  };

  hardware = {
    raspberry-pi."4" = {
      fkms-3d.enable = true;
      apply-overlays-dtmerge.enable = true;
    };
  };
  environment.systemPackages =
    with pkgs;
    [
      libraspberrypi
      raspberrypi-eeprom
    ]
    ++ [ inputs.agenix.packages.${system}.default ];
  networking = {
    hostName = "pi4";
    wireless = {
      interfaces = [ "wlan0" ];
      secretsFile = config.age.secrets.wifi.path;
      enable = true;
      networks = {
        huntwickville = {
          pskRaw = "ext:password";
        };
      };
    };
    interfaces = {
      wlan0.ipv4.addresses = [
        {
          address = "192.168.1.200";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.1";
    };
    nameservers = [
      "1.1.1.1"
      "4.2.2.1"
      "4.2.2.2"
      "4.2.2.5"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
      allowedUDPPorts = [
        22
        80
        443
      ];
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 3;
    ignoreIP = [
      "127.0.0.1/8"
      "192.168.1.0/24"
    ];
    bantime = "30s";
    bantime-increment.enable = true;
    bantime-increment.factor = "1.5";
    bantime-increment.maxtime = "1d";
  };

  # mta 
  services.postfix = {
    enable = true;
    submissionOptions.smtp_sasl_auth_enable = "yes";
    submissionOptions.smtp_sasl.password_maps = "hash:${config.age.secrets.postfix.path}";
    relayHost = "smtp.gmail.com";
    relayPort = 465;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
