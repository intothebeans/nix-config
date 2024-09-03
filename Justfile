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
    sudo nixos-rebuild switch --flake ./ 
    msg=$(nixos-rebuild list-generations | grep current)
    git commit -am "$msg"

home: _format
    #!/usr/bin/env bash
    home-manager switch --flake ./ --recreate-lock-file 
    timestamp=$(date +"%d-%m-%Y %r")
    git commit -am "Home Manager rebuilt on $timestamp"

bof: _format 
    #!/usr/bin/env bash
    home-manager switch --flake ./ --recreate-lock-file
    sudo nixos-rebuild switch --flake ./
    timestamp=$(date +"%d-%m-%Y %r")
    git commit -am "Home and System rebuilt on $timestamp"


