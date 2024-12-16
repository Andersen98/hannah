{pkgs,...}:{
  home.packages = with pkgs; [
    watchman
    perl
  ];
  programs.git = {
    package = pkgs.git.overrideAttrs ( 
      finalAttrs: prevAtts: {
        buildInputs = prevAtts.buildInputs ++ [  pkgs.makeWrapper ];
        paths = [ pkgs.perl pkgs.watchman ];
        preFixup =  ''
          for f in $(find $out/bin/ $out/libexec/ -type f -executable); do
            wrapProgram "$f" \
              --prefix PATH : "${pkgs.perl}/bin/perl" \
              --prefix PATH : "${pkgs.watchman}/bin/watchman"
          done
       '';
    });
    
   
    enable = true;
    extraConfig = {
      core.preloadIndex = true;
      core.fsmonitor = ".git/hooks/fsmonitor-watchmanv2";
    };
    hooks = {
     fsmonitor = ./fsmonitor-watchmanv2;
    };
  };
}
