{pkgs,config,...}:
let
  helixRuntimePath = "${config.home.homeDirectory}/hannah/home/helix/runtime";
  in
{
  home.packages = with pkgs;[
    nixfmt-rfc-style
    nil
  ];
  xdg.configFile."helix/runtime"= {
   source =  config.lib.file.mkOutOfStoreSymlink "${helixRuntimePath}";
   recursive = true;
   force = true;
  };

  programs.helix = {

    settings = {
      editor = {
        line-number = "relative";
        shell = ["${pkgs.nushell}/bin/nu" "-c" ];
        completion-timeout = 100;
        true-color = true;
        undercurl = true;
        bufferline = "multiple";
        color-modes = true;
        popup-border = "all";
        indent-heuristic = "hybrid";
        indent-guides = {
          render = true;
          character = "";
        };
        smart-tab.supersede-menu = true;

        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      keys.normal = {
        tab = "move_parent_node_end";
        S-tab = "move_parent_node_start";
      };
      keys.insert = {
        S-tab = "move_parent_node_start";
      };
      keys.select = {
        tab = "move_parent_node_end";
        S-tab = "move_parent_node_start";
      };
      keys.insert = {
       up = "no_op" ;
        down = "no_op"       ;
        left = "no_op"       ;
        right = "no_op"      ;
        pageup = "no_op"     ;
        pagedown = "no_op"   ;
        home = "no_op"       ;
        end = "no_op"        ;
      };
    };
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      haskell-language-server
      nil
      nixfmt-rfc-style
      ];
    ignores = [
      ".build/"
      "!.gitignore"
    ];
    languages = {
      language = [
        {name = "nix";
        formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
                  }
      ];
      
      language-server = {
        nil = {
          command = "${pkgs.nil}/bin/nil";
          config = {
           nil = {
            formatting = { command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";};
            nix = {
            maxMemoryMB = 6144;
            flake = {
              autoArchive = true;
              autoEvalInputs = true;
              nixpkgsInputName = "nixpkgs";
            };
            };
            };

          };
        };
      };
    };
  };


}
