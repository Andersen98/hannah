{pkgs,  lib, ...}:
{
  imports = [
    ./git
    ./zed.nix
    ./haskeline
    ./ihaskell
    ./shh
    # ./neovim
    ./tmux.nix
    ./fzf.nix
    ./bash.nix
    ./fish.nix
    ./nushell
    ./starship.nix
    ./kakoune
    ./helix
    ./man.nix  ];

  xdg.enable = true;

  fonts.fontconfig.enable = false;
  xdg.dataFile.wallpapers = {
    source = ./wallpapers;
    force = true;
  };
  xdg.dataFile."profile_pic.jpg".source = ./profile_pic.jpg;
  xdg.configFile."xdg-desktop-portal/hyprland-portals.conf".source = ./xdg-desktop-portal/hyprland-portals.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;
  home.file.".config/cabal".source = ./cabal;


  xdg.configFile."uwsm" = {
    source = ./uwsm;
    recursive = true;
    force = false;
  };

  home.file.".config/qman.conf".source = ./qman.conf;



  home.packages = with pkgs; [
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    # unbuffer nix-build |& nom
    # unbuffer nixos-rebuild |& nom
    nix-output-monitor
    expect
    #flake-utils-plus fup-repl
    fup-repl


    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # devenv https://devenv.sh
    devenv
    neofetch

    # internet
    lynx
    w3m
    browsh
    elinks

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    curl
    git
    gh
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
    just # A a command runner
    moar

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    kittysay
    cowsay
    fortune
    lolcat
    file
    which
    tree
    gnused
    gnutar
    gawk
    gnupg


    # productivity
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = lib.mkDefault "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
