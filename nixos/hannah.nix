{pkgs,...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    groups.hannah = {};
      users.hannah = {
      isNormalUser = true;
      shell = pkgs.nushell;
      group = "hannah";
      extraGroups = [
        "wheel" # Enable ‘sudo’ for the user.
        "video" # the below i got off github/akirak/homelab/blob/master/machines/li/default.nix#L85
        "audio"
        "disk"
        "networkmanager"
        "systemd-journal"
      ];
    };
  };
}
