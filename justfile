hostname := `hostname -s`

# List recipes
default: 
	@just --list --unsorted

# Update flake inputs to latest versions
update:
	nix flake update

# Build the NixOS configuration without switching to it
build target_host=hostname flags="":
	nixos-rebuild build --flake .#{{target_host}} {{flags}}

# Build the NixOS configuration and switch to it
switch target_host=hostname:
	sudo nixos-rebuild switch --flake .#{{target_host}}
