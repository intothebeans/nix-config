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
  age.secrets.email.file = ../../secrets/email.age;

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
        80
        443

      ];
      allowedUDPPorts = [
        80
        443
      ];
    };
  };

  services.plex = {
    enable = true;
    group = "media";
    openFirewall = true;
  };

  services.fail2ban = {
    enable = true;
    extraPackages = [ pkgs.mailutils ];
    ignoreIP = [
      "127.0.0.1/8"
      "192.168.1.0/24"
    ];
    maxretry = 3;
    bantime-increment = {
      enable = true;
      multipliers = "1 2 4 8 16 32 64";
      rndtime = "8m";
    };
    jails = {
      authelia.settings = {
        enabled = true;
        port = "http,https,9091";
        filter = "authelia";
        logpath = "/home/${username}/containers/authelia/config/authelia.log";
        maxretry = "3";
        bantime = "1d";
        findtime = "1d";
        chain = "DOCKER-USER";
        action = "iptables-allports[name=authelia]";
      };
      DEFAULT.settings = {
        action = "%(action_mwl)s";
        mta = "mail";
      };
    };
  };
  systemd.services.fail2ban.serviceConfig = {
    CapabilityBoundingSet = [ "CAP_DAC_OVERRIDE" ];
    ReadWritePaths = [ "/var/lib/postfix/queue/maildrop" ];
  };

  environment.etc = {
    "fail2ban/filter.d/authelia.local".text = pkgs.lib.mkDefault (
      pkgs.lib.mkAfter ''
        [Definition]
        failregex = ^.*Unsuccessful (1FA|TOTP|Duo|U2F) authentication attempt by user .*remote_ip"?(:|=)"?<HOST>"?.*$
                    ^.*user not found.*path=/api/reset-password/identity/start remote_ip"?(:|=)"?<HOST>"?.*$
                    ^.*Sending an email to user.*path=/api/.*/start remote_ip"?(:|=)"?<HOST>"?.*$

        ignoreregex = ^.*level"?(:|=)"?info.*
                      ^.*level"?(:|=)"?warning.*''
    );
  };

  # mta 
  services.postfix = {
    enable = true;
    config = {
      smtp_use_tls = "yes";
      smtp_sasl_auth_enable = "yes";
      smtp_sasl_security_options = "noanonymous";
      smtp_tls_security_level = "encrypt";
      smtp_sasl_password_maps = "texthash:${config.age.secrets.postfix.path}";
      virtual_alias_maps = "texthash:${config.age.secrets.email.path}";
    };
    relayHost = "smtp.gmail.com";
    relayPort = 587;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
