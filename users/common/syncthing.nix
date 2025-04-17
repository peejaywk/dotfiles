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
      "--config=${config.home.homeDirectory}/Syncthing/Devices/${hostname}"
      "--data=${config.home.homeDirectory}/Syncthing/DB/${hostname}"
      "--no-default-folder"
    ];
  };
}
