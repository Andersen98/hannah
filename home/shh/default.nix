{config,pkgs,...}:
let
  shhPath= "${config.home.homeDirectory}/hannah/home/shh/shh";
  shell-file = pkgs.writeTextFile {
    name = "Shell.hs";
    text = ''
      {-# LANGUAGE TemplateHaskell #-}
      module Shell where
      import Shh
      $(loadEnv SearchPath)
      '';
    destination = "/share/Shell.hs";
  };
  init-ghci-file = pkgs.writeTextFile {
    name = "init.ghci";
    text = ''
    :seti -XNoOverloadedLists
    import Shh
    import Shh.Prompt
    :set prompt-function formatPrompt "\n\ESC[1;32m[%u@%h:%w]λ \ESC[0m"
    :set prompt-cont "| "
    '';
    destination = "/share/init.ghci";
  };
in
{
  home.packages = with pkgs; [
  (writeShellApplication {
    name = "shh";

  runtimeInputs = [ 
 ( haskellPackages.ghcWithHoogle (hpkgs: [
    hpkgs.shh
    hpkgs.shh-extras
    hpkgs.Glob
    hpkgs.PyF
    hpkgs.dbus
    hpkgs.conduit
    hpkgs.optparse-applicative
    hpkgs.lens
    hpkgs.transformers
    hpkgs.text
    hpkgs.vulkan-api
    
  ])
  )
   ];

  text = ''
    exec shh
  '';
    
  })
(writeShellApplication {
  name = "shh-basic";
  runtimeInputs = [ 
 ( haskellPackages.ghcWithHoogle (hpkgs: [
    hpkgs.shh
    hpkgs.shh-extras
  ])
  )
    init-ghci-file
    shell-file
   ];

  text = ''
    ghci -ghci-script ${init-ghci-file}/share/init.ghci ${shell-file}/share/Shell.hs
  '';
})
  ];
  home.file.".shh" = {
   source =  config.lib.file.mkOutOfStoreSymlink "${shhPath}";
   recursive = true;
   force = true;
  };
  }
