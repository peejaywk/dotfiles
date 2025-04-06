{ config, pkgs, inputs, ... }:
{
  programs.neovim = 
  let 
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      #{
      #  plugin = nvim-lspconfig;
      #  config = toLuaFile ./nvim/plugin/lsp.lua;
      #}

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
    ];
  };



}
