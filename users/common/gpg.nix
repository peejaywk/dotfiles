{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnupg
    pinentry-qt
  ];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };
}
