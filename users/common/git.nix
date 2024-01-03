{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "peejaywk@gmail.com";
    userName = "peejaywk";
  };
}
