{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
{
    programs.uwsm.waylandCompositors = {
    sway = {
      prettyName = "Sway";
      comment = "Sway compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/sway";
    };
  };

  environment.systemPackages = with pkgs; [
    sway
  ];
}
