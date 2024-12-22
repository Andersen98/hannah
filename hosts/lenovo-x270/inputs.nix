{
  hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;
  hardware.trackpoint.speed = 48;
  services.libinput.enable = true;
  services.libinput.touchpad = {
    naturalScrolling = true;
    scrollMethod = "twofinger";
    tapping = true;
    tappingButtonMap = "lrm";
  };
}
