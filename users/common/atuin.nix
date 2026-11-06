{ config, ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      sync_address = "https://peejay-cloud1.porpoise-ghoul.ts.net";
      sync_frequency = "15m";
      dialect = "uk";
      search_mode = "fuzzy";
      filter_mode = "host";
      style = "compact";
      enter_accept = true;
    };
  };
}
