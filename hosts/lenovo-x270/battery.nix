{
  
  boot.extraModprobeConfig = ''
    # 70-80% is the battery threshold
    options thinkpad_acpi charge_control_start_threshold=70 charge_control_end_threshold=80
  '';
}
