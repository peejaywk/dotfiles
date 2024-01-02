# A script for bootstrapping the system
# Use this to install packages that will allow you to build the initial system.
# Run command "nix-shell"
{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "NixOSBuildShell";
  NIX_CONFIG = "experimental-features = nix-command flakes";
  nativeBuildInputs = with pkgs; [
    git
    nix
    home-manager
  ];
}
