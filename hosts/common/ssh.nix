{ config, pkgs, ... }: {
  services.openssh = {
    enable = true;
    permitRootLogin = "prohiit-password";
    passwordAuthentication = false;
    keys = [
      "./id_rsa.pub"
    ];
  };
}

