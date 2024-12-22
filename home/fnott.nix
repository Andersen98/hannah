{pkgs,config,...}:{
  services.fnott.enable = true;
  services.fnott.extraFlags = [
    "--print-pid=_FD_"
    "--log-colorize=always"
  ];
  services.fnott.settings = {
    main = {
      output = "${config.farts.notificationDisplay}";
      selection-helper = "${pkgs.uwsm}/uwsm-app -s s -t service - tofi";
      dpi-aware = true;
      title-font = "VictorMono Nerd Font:style=Bold Italic";
      summary-font = "VictorMono Nerd Font:style=Italic";
      body-font = "VictorMono Nerd Font:style=ExtraLight Italic";
      default-timeout = 30;
      idle-timeout = 300;
    };
  };
}
