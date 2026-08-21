{pkgs, ...}: {
  config = {
    # Let home manager install and manage itself.

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
            path = "~/Pictures/artoria.jpg";
          }
        ];
      };
    };

    services.hyprsunset.enable = true;

    services.hyprsunset.settings = {
      settings = {
        max-gamma = "100";

        profile = [
          {
            time = "7:30";
            identity = true;
          }
          {
            time = "21:00";
            temprature = 5500;
            gamma = 0.8;
          }
        ];
      };
    };
  };
}
