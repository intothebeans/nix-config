deploy:
    git add .
    sudo nixos-rebuild switch --flake ./ | tee $HOME/rebuild.log 

debug:
    git add .
    sudo nixos-rebuild switch --flake ./ -L -v --show-trace | tee $HOME/rebuild.log
up:
    nix flake update 

history:
    nix profile history --profile /nix/var/nix/profiles/system

clean:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system 

gc:
    sudo nix-collect-garbage --delete-old

commit:
    #!/usr/bin/env bash
    commit_msg=$(nixos-rebuild list-generations | grep current)
    git add . && git commit -am "$commit_msg"

# winapps

winapps-up:
    docker-compose -f ./home-manager/programs/winapps/compose.yaml up -d