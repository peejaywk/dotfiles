{ config, pkgs, ... }: {
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
  users.users.peejaywk.openssh.authorizedKeys.keyFiles = [
    ./authorised_keys
  ];
}

