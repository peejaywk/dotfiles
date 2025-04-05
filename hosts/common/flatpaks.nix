{ ... }: {
  services = {
    flatpak = {
      enable = true;
      packages = [
        "com.logseq.Logseq"
        "org.signal.Signal"
        "org.telegram.desktop"
        "com.dropbox.Client"
        "md.obsidian.Obsidian"
      ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };
}


