 {
  config,
  inputs,
  ...
}: {

networking.networkmanager.enable = true;

 networking.hostName = "nixos-lenovo"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


    services.mullvad-vpn.enable = true;
     services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ];
  # networking.firewall.enable = false;

    # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # }


  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Class = "0x200414";
        FastConnectable = true;
      };
    };
  };

 
  services.blueman.enable = true;


    }




