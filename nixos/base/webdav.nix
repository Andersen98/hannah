{

  services.webdav = {
    # enable = true;
    settings = {
      address = "0.0.0.0";
      port = 6065;
      directory = /srv/webdav;
      permissions = "RCUD";
      users = [
{        username = "admin";
        password = "admin";
}     
{ username = "hannah"; password = "hannah";}
{ username = "sherry"; password = "sherry";}
{ username = "stella"; password = "stella";}
 ];
    };
  };
}
