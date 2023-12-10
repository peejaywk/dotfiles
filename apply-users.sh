#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/peejaywk/home.nix
popd
