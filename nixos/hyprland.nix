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
  ];
programs.iio-hyprland = {
  enable = true;
};    
services.hypridle.enable = true;
programs.uwsm.waylandCompositors = {
      hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
}
