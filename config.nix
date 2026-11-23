{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./network.nix
    ./locale.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.flatpak.enable = true;
  programs.nix-ld.enable = true;

 
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;


users.users."nfwin" = {
    isNormalUser = true;
    description = "nfwin";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.zsh.enable = true;
  virtualisation.docker.enable = true;

  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
  };




  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
     alsa.support32Bit = true;
    wireplumber.enable = true;
  };

  services.dbus.enable = true;

  programs.nano.enable = false;

  environment.systemPackages = with pkgs; [
    kitty
    vesktop
    librewolf
    fastfetch
    vim
    github-cli
    alejandra
    git
    neovim
    ripgrep
    fd
    tree
    btop
    htop
    tor
    steam
    tor-browser
    wine64
    eden
    unzip
    rar
    spotify
    wget
    glib
    glibc
    protontricks
    openssh
    osu-lazer-bin
    xppen_4
    thunar
    gimp
    qbittorrent
    lug-helper
    inputs.nix-citizen.packages.${system}.rsi-launcher
    mullvad-vpn
    prismlauncher
    wireshark
    grimblast
    yt-dlp
    fzf
    vlc
    mpv
    heroic
    ani-cli
    steamtinkerlaunch
    samrewritten
    freecad
    lazygit
    ripgrep
    pnpm
    ffmpeg

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    (tesseract.override {
      enableLanguages = ["eng" "jpn" "rus" "swe"];
    })
  ];

  environment.sessionVariables.EDITOR = "nvim";

   nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  home-manager = {
    backupFileExtension = "hm-old";
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = {inherit inputs;};
    users.nfwin = {imports = [./home.nix];};
  };





  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  system.stateVersion = "26.05"; # Did you read the comment?
}
