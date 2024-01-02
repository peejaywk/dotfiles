{ config, pkgs, ...}:
{
  fileSystems."/home/peejaywk/shared" = {
    device = "192.168.1.76:volume1/Shared";
    fsType = "nfs";
    options = [
      "x-systemd.before=local-fs.target"
      "x-systemd.automount"
      "soft"
    ];
  };

  services = {
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
