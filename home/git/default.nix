{config,pkgs,...}:{
  programs.git = {
    package =  pkgs.symlinkJoin {
  name = "git";
  paths = [ pkgs.git pkgs.perl pkgs.watchman ];
  };
    
   
    enable = true;
    extraConfig = {
      core.preloadIndex = true;
      core.fsmonitor = "${config.programs.git.hooks.fsmonitor-watchmanv2}";
    };
    hooks = {
     fsmonitor-watchmanv2= ./fsmonitor-watchmanv2;
    };
  };
}
