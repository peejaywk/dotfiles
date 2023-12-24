{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 10000;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
    ];
  };
}
