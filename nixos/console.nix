{pkgs, ...}:
{
  console = {
   packages = with pkgs; [
    spleen
  ];
  earlySetup = true;

    font = "spleen-32x64";
    };
}
