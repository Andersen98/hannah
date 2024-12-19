{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    carapace
  ];

 programs = {
    nushell = {
      enable = true;
      plugins = with pkgs.nushellPlugins; [
        dbus
        formats
        polars
      ];
      loginFile.text = ''
        uwsm check may-start;  uwsm select 
        if $env.LAST_EXIT_CODE == 0 { with-env {DEBUG: 1} { exec systemd-cat -t uwsm_start uwsm start default } }
        '';
      configFile.source = ./config.nu;
      # def color-scheme-meta-code [] {print "$env.color_scheme = {"; (for $x in 0..15 { $x | into binary | encode hex |str substring --utf-8-bytes 0..1 | into string | "    base" + $in + ":\"#\${config.colorScheme.palette.base" + $in + "}\","  | print $in  } ); print "}"}
      envFile.text = ''
        $env.color_scheme = {
          base00:"#${config.colorScheme.palette.base00}"
          base01:"#${config.colorScheme.palette.base01}"
          base02:"#${config.colorScheme.palette.base02}"
          base03:"#${config.colorScheme.palette.base03}"
          base04:"#${config.colorScheme.palette.base04}"
          base05:"#${config.colorScheme.palette.base05}"
          base06:"#${config.colorScheme.palette.base06}"
          base07:"#${config.colorScheme.palette.base07}"
          base08:"#${config.colorScheme.palette.base08}"
          base09:"#${config.colorScheme.palette.base09}"
          base0A:"#${config.colorScheme.palette.base0A}"
          base0B:"#${config.colorScheme.palette.base0B}"
          base0C:"#${config.colorScheme.palette.base0C}"
          base0D:"#${config.colorScheme.palette.base0D}"
          base0E:"#${config.colorScheme.palette.base0E}"
          base0F:"#${config.colorScheme.palette.base0F}"
        }
             config nu --doc | nu-highlight | less -R
        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
        mkdir ~/.cache/carapace
        carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
        '';
    };
  };
}
