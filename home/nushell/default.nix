{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    carapace
  ];

 programs = {
    nushell = {
      enable = true;
      loginFile.text = ''
        uwsm check may-start;  uwsm select 
        if $env.LAST_EXIT_CODE == 0 { exec systemd-cat -t uwsm_start uwsm start default }
        '';
      configFile.source = ./config.nu;
      envFile.text = ''
        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
        mkdir ~/.cache/carapace
        carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
        '';
    };
  };
}
