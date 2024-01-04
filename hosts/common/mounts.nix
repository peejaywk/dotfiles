{ config, pkgs, ...}:
  let
    mount-options = [
      "credentials=/home/peejaywk/.config/smbUser,uid=1000,gid=100,nobrl"
      "x-systemd.before=local-fs.target"
      "x-systemd.automount"
      "soft"
    ];
  in {    
    environment.systemPackages = [ pkgs.cifs-utils ];

    fileSystems."/home/peejaywk/Shared/arr" = {
      device = "//192.168.1.76/Shared/arr";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Data" = {
      device = "//192.168.1.76/data";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Homes" = {
      device = "//192.168.1.76/homes";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/MyMusic" = {
      device = "//192.168.1.76/MyMusic";
      fsType = "cifs";
      options = mount-options;
    };
    fileSystems."/home/peejaywk/Shared/Videos" = {
      device = "//192.168.1.76/video";
      fsType = "cifs";
      options = mount-options;
    };
  
  services = {
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
