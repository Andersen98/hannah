{pkgs, ...}:
{
services.kmscon = {
  enable = false;
  extraConfig = ''
  font-size=14
  '';
    extraOptions =''
    --term xterm-256color
    '';
  fonts = [ { name = "Terminess Nerd Font"; package = pkgs.nerd-fonts.terminess-ttf;}];
};
  console = {
   packages = with pkgs; [
    spleen
  ];

    font = "spleen-16x32";
    };
}
