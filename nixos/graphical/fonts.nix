{
  config,
  pkgs,
  lib,
  ...
}:
{
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems = let
    mkRoSymBind = path: {
      device = path;
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };
    aggregatedIcons = pkgs.buildEnv {
      name = "system-icons";
      paths = with pkgs; [
        nixos-icons
        papirus-icon-theme
        #epapirus-icon-theme
        #        kdePackages.breeze-icons
        #        kdePackages.breeze-gtk
        #gnome-themes-extra
      ];
      pathsToLink = [ "/share/icons" ];
    };
    aggregatedFonts = pkgs.buildEnv {
      name = "system-fonts";
      paths = config.fonts.packages;
      pathsToLink = [ "/share/fonts" ];
    };
  in {
    "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
    "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
  };
  fonts= {
    fontDir = {
      decompressFonts = true;
    };
    fontconfig = {
      defaultFonts = {
        monospace = [ "Victor Mono Nerd Font" "Noto Sans Symbols 2" "Noto Sans Symbols" ];
        emoji = [ "Noto Color Emoji" ];
      };
      hinting = {
        style = "none";
      };
      subpixel = {
        lcdfilter = "none";
        };
      allowBitmaps = true;
    };
    packages = with pkgs; [
      noto-sans-symbols-2-font
      noto-sans-symbols-font
      nerd-fonts.symbols-only
      nerd-fonts.victor-mono
      fleuron-font
      fira-code
      rakkas-font
      vollkorn-font
    ];
  };
}
