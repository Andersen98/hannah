{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    carapace
  ];

 programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        # --------------------
        # External Completions
        # --------------------
        # completions.external.*: Settings related to completing external commands
        # and additional completers

        $env.config.completions.external.enable = true
        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
        mkdir ~/.cache/carapace
        uwsm-app ${lib.getBin pkgs.carapace}/bin/carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
        #~/.config/nushell/config.nu
        source ~/.cache/carapace/init.nu
        '';
      configFile.source = ./config.nu;
    };
  };
}
