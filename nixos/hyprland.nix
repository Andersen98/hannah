{pkgs,...}:
{
  environment.systemPackages = with pkgs; [
    fnott
    wl-clipboard
    hyprpolkitagent
    hyprcursor
    hyprlock
    hyprpaper
    hyprshot
    hyprpicker
    xdg-desktop-portal-hyprland
    kdePackages.xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
    libfprint-2-tod1-vfs0090
  ];
services.fprintd ={
  enable = true;
  tod.enable = true;
  tod.driver = pkgs.libfprint-2-tod1-vfs0090;
};
programs.hyprlock.enable = true;
    programs.uwsm.waylandCompositors = {
      hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
}
