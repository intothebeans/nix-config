_format:
    #!/usr/bin/env bash
    alejandra . &>/dev/null || (
            alejandra .
            echo "formatting failed"
            exit 1
        )

deploy:
    sudo nixos-rebuild switch --flake ./ | tee $HOME/rebuild.log 

debug:
    sudo nixos-rebuild switch --flake ./ -L -v --show-trace | tee $HOME/rebuild.log
up:
    nix flake update 

commit: _format
    #!/usr/bin/env bash
    commit_msg=$(nixos-rebuild list-generations | grep current)
    git add . && git commit -am "$commit_msg"