{pkgs,...}:{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  programs.light = {
    enable = false;
    # dont wanna mess with intercept rules
    # evinput lib is hard
    brightnessKeys.enable = false;
  };

}
