{pkgs, ...}:
{
  console = {
   packages = with pkgs; [
    spleen
  ];
  earlySetup = true;

    font = "${pkgs.spleen}/share/consolefonts/spleen-32x64.psfu";
    };
boot.loader.systemd-boot.consoleMode = "auto";
}
