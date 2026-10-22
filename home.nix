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

    services.hyprlauncher = {
      enable = true;
      settings = {
        grab_focus = true;

        base = "0xffb7c5ee";
        text = "0xffb7c5ee";

        rounding_large = "2";
        rounding_small = "2";
      };
    };

    programs.nixvim = {
      enable = true;

      colorschemes.kanagawa.enable = true;
      plugins.lualine.enable = true;
      plugins.neo-tree.enable = true;
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "~/Picutres/artoria.jpg"
        ];
        wallpaper = [
          # By display
          # {
          #   monitor = "DP-2";
          #   path = "~/wallpapers/wallpaper2.jpg";
          # }
          # By default/fallback
          {
            monitor = "HDMI-A-1";
            #path = "~/Pictures/artoria.jpg";
            path = "~/Pictures/openbsd.png";
          }
          {
            monitor = "eDP-1";
            path = "~/Pictures/j2k25.png";
          }
        ];
      };
    };

  
  };
}
