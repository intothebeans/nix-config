default:
    @just --list

_format:
    #!/usr/bin/env bash
    alejandra . &>/dev/null || (
            alejandra .
            echo "formatting failed"
        )  

system: _format 
    #!/usr/bin/env bash
    sudo nixos-rebuild switch --flake ./ | tee ./rebuild.log || (cat ./rebuild.log | grep --color error && exit 1)
    msg=$(nixos-rebuild list-generations | grep current)
    git commit -am "$msg"

home: _format
    #!/usr/bin/env bash
    home-manager switch --flake ./ --recreate-lock-file | tee ./home-rebuild.log || (cat ./home-rebuild.log | grep --color error && exit 1)
    timestamp=$(date +"%d-%m-%Y %r")
    git commit -am "Home Manager rebuilt on $timestamp"

bof: _format home system

