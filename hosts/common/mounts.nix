{ config, pkgs, ...}:
  let
    mount-options = [
      "credentials=/home/peejaywk/.config/smbUser,uid=1000,gid=100,nobrl"
      "x-systemd.before=local-fs.target"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "soft"
    ];
  in {    
    environment.systemPackages = [ pkgs.cifs-utils ];

    fileSystems."/home/peejaywk/Shared/arr" = {
      device = "//192.168.30.174/arr";
      fsType = "cifs";
      options = mount-options;
    };
		fileSystems."home/peejaywk/Shared/data" = {
			device = "//192.168.30.174/Data";
			fsType = "cifs";
			options = mount-options;
		};
    fileSystems."/home/peejaywk/Shared/Docker" = {
      device = "//192.168.30.174/Docker";
      fsType = "cifs";
      options = mount-options;
    };
  services = {
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
