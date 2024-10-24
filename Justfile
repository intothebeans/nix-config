deploy:
    git add .
    sudo nixos-rebuild switch --flake ./ | tee $HOME/rebuild.log 

remote: 
     nix run github:serokell/deploy-rs ./#server | tee $HOME/remote.log

debug:
    git add .
    sudo nixos-rebuild switch --flake ./ -L -v --show-trace | tee $HOME/rebuild.log
up:
    nix flake update 

history:
    nix profile history --profile /nix/var/nix/profiles/system

clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
    sudo nix-collect-garbage --delete-old

commit:
    #!/usr/bin/env bash
    user=$(whoami)
    host=$(hostname)
    commit_msg=$(nixos-rebuild list-generations | grep current)
    git add . && git commit -am "$user@$host | $commit_msg"

# winapps

winapps-up:
    docker-compose -f ./home-manager/programs/winapps/compose.yaml up -d
