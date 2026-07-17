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
        rounding_large = 2;
	rounding_small = 2;

      };
    };
  };
}
