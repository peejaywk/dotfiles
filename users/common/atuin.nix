{ config, ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      sync_address = "http://peejay-cloud1:8888";
      sync_frequency = "15m";
      dialect = "uk";
      search_mode = "fuzzy";
      filter_mode = "host";
      style = "compact";
      enter_accept = true;
    };
  };
}
