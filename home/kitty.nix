{config, pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;

    shellIntegration.enableFishIntegration = true;
    settings = {
      allow_remote_control = true;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      selection_foreground = "#${config.colorScheme.palette.base05}";
      selection_background = "#${config.colorScheme.palette.base02}";
      disable_ligatures = "never";
      force_ltr = "no";
    };
    font = {
      name = "Victor Mono Nerd Font";
      size = 14;
    };
  };
}
