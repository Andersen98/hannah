{pkgs, config,lib,...}:{
  home.packages = with pkgs; [
    kakoune-lsp
  ];
  programs.kakoune = {
    enable = true;
    extraConfig = ''
      hook global InsertChar j %{ try %{
        exec -draft hH <a-k>jj<ret> d
        exec -with-hooks <esc>
      }}
      eval %sh{uwsm-app -s b kak-lsp}
      lsp-enable
      '';
  };
}
