
{config,pkgs,...}:
let
  ihaskellPath= "${config.home.homeDirectory}/hannah/home/ihaskell/ihaskell";
  in
{ 

 home.file."ihaskell" = {
   source =  config.lib.file.mkOutOfStoreSymlink "${ihaskellPath}";
    recursive = true;
   force = true;
  };
}
