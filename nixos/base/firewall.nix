{networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 6065 ];
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};}
