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
		fileSystems."/home/peejaywk/Shared/arr_old" = {
			device = "//192.168.30.10/Shared/arr";
			fsType = "cifs";
			options = mount-options;
		};
    fileSystems."/home/peejaywk/Shared/Data" = {
      device = "//192.168.30.10/data";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Homes" = {
      device = "//192.168.30.10/homes";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/MyMusic" = {
      device = "//192.168.30.10/MyMusic";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Videos" = {
      device = "//192.168.30.10/video";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Docker" = {
      device = "//192.168.30.174/Docker";
      fsType = "cifs";
      options = mount-options;
    };
		fileSystems."/home/peejaywk/Shared/Docker_oldw" = {
			device = "//192.168.30.10/Docker";
			fsType = "cifs";
			options = mount-options;
		};
  services = {
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
