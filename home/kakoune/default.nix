{pkgs, config,lib,...}:{
  home.packages = with pkgs; [
    kakoune-lsp
  ];
  programs.kakoune = {
    enable = true;
    extraConfig = ''
      eval %sh{uwsm-app -s b kak-lsp}
      lsp-enable
      '';
  };
}
