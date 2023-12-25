{ config, pkgs, hostname, username, ... }:
let
  inherit (pkgs.stdenv) isLinux;
in
{
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      package = pkgs.syncthingtray;
    };
    extraOptions = [
      "--config=${config.home.homeDirectory}/Syncthing/Devices/nixos"
      "--data=${config.home.homeDirectory}/Syncthing/DB/nixos"
      # "--no-default-folder"
    ];
  };
}
