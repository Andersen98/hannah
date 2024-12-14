let 
  defaultDownloadBufferSize = 67108864;
in 
{ 
  nix.settings = {
  experimental-features = "nix-command flakes";
  download-buffer-size = 10*defaultDownloadBufferSize;
  trusted-users = [  "hannah" ];
  };
}
