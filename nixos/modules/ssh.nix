{config, ...}: {
  services.openssh = {
    enable = true;
    ports = [22];
    extraConfig = ''
      PermitUserEnvironment no
      Subsystem sftp internal-sftp -f AUTHPRIV -l INFO
      Protocol 2
      PermitEmptyPasswords no
      IgnoreRhosts yes
      Compression no
      TCPKeepAlive no
      AllowAgentForwarding no
      HostbasedAuthentication no
      MaxAuthTries 3
    '';
    settings = {
      PasswordAuthentication = false;
      UseDns = true;
      UsePAM = true;
      KbdInteractiveAuthentication = false;
      PrintMotd = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
      AllowGroups = ["sshuser"];
      LogLevel = "VERBOSE";
      KexAlgorithms = [
        "curve25519-sha256@libssh.org"
        "ecdh-sha2-nistp521"
        "ecdh-sha2-nistp384"
        "ecdh-sha2-nistp256"
        "diffie-hellman-group-exchange-sha256"
      ];
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
        "aes256-ctr"
        "aes192-ctr"
        "aes128-ctr"
      ];
      Macs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "hmac-sha2-512"
        "hmac-sha2-256"
        "umac-128@openssh.com"
      ];
    };
    hostKeys = [
      {
        bits = 4096;
        type = "ed25519";
        path = "/etc/ssh/ssh_host_ed25519_key";
      }
      {
        bits = 4096;
        type = "rsa";
        path = "/etc/ssh/ssh_host_rsa_key";
      }
      {
        bits = 521;
        type = "ecdsa";
        path = "/etc/ssh/ssh_host_ecdsa_key";
      }
    ];
  };
}
