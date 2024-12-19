{pkgs, ...}:
{
  fonts.packages = with pkgs; [ spleen ];
  console = {
   packages = with pkgs; [
    spleen
  ];
  earlySetup = true;

    font = "spleen-16x32";
    };
boot.loader.systemd-boot.consoleMode = "auto";
}
