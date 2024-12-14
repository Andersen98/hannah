{ pkgs,...}:
{
  programs.neovim.extraPackages = with pkgs; [
      ripgrep
      fd
  ];
  programs.neovim.plugins = with pkgs.vimPlugins; [
    { plugin = telescope-nvim;
      config = ''
        require('telescope').setup {
          extensions = {
            fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                               -- the default case_mode is "smart_case"
            }
          }
        }
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
      '';
      type = "lua";
    }
    plenary-nvim
    telescope-fzf-native-nvim
    nvim-web-devicons
  ];
}
