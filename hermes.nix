{ config, pkgs, ... }:

{
  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
    container.enable = true;
#environmentFiles = [ config.sops.secrets."hermes-env".path];
    

    settings = {
      model = {
        default = "nousresearch/hermes-3-llama-3.8b:free";
      };
      agent = {
        max_turns = 60;
      };
    };

 extraPackages = with pkgs; [
      ripgrep
      jq
      nodejs
    ];
  };
}
