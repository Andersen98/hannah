
{ stdenvNoCC,
  lib,
  ...
}:

stdenvNoCC.mkDerivation {
      pname = "noto-sans-symbols-font";
      version = "1.0.0";
  src = ./NotoSansSymbols;
  
    unpackPhase = ''
    cd $src
    '';
      
      
      installPhase =
        let
          dirName = "NotoSansSymbols";
        in
        ''
          runHook preInstall
          dst_opentype=$out/share/fonts/opentype/${dirName}
          dst_truetype=$out/share/fonts/truetype/${dirName}

          find -name \*.otf -exec mkdir -p $dst_opentype \; -exec cp -p {} $dst_opentype \;
          find -name \*.ttf -exec mkdir -p $dst_truetype \; -exec cp -p {} $dst_truetype \;

          runHook postInstall
        '';

      meta = {
        description = ''
      a font
        '';
        platforms = lib.platforms.all;
      };
    }

