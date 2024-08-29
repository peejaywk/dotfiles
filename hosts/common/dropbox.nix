{ config, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.dropbox
  ];
}
