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
        "org.prismlauncher.PrismLauncher"
				"com.valvesoftware.Steam"
				"org.kde.isoimagewriter"
      ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };
}


