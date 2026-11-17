{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  config = {
    home.file.".config/hypr/hyprland.lua".text = builtins.readFile ./hyprland.lua;

    programs.home-manager.enable = true;

    home.stateVersion = "26.11";

    home.username = "nfwin";
    home.homeDirectory = "/home/nfwin";

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        nr = "sudo nixos-rebuild switch --flake /etc/nixos#nfwin";
        hyprland = "Hyprland";
        c = "clear";
      };

      history = {
        size = 100000;
        ignoreAllDups = true;
      };
    };

  
    programs.nixvim = {
      enable = true;

      colorschemes.rose-pine.enable = true;
      plugins.lualine.enable = true;
      plugins.neo-tree.enable = true;
    };
        
      
    
  };
}
