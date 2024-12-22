with import <nixpkgs> {};
haskellPackages.extend (haskell.lib.compose.packageSourceOverrides {
    frontend = ./frontend;
    backend = ./backend;
    common = ./common;
})
