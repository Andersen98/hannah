{
  description = "Hannah's NixOS config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cuda-maintainers.cachix.org"
      "https://vulkan-haskell.cachix.org"
"https://cosmic.cachix.org/"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "vulkan-haskell.cachix.org-1:byNXKoGxhPa/IOR+pwNhV2nHV67ML8sXsWPfRIqzNUU="
"cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="    ];
  };

  inputs = {
    ixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
     nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
      nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
    nix-on-droid = {
      url = "github:t184256/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixfmt.url = "github:NixOS/nixfmt";
    nix-colors.url = "github:misterio77/nix-colors";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    # optional, not necessary for the module
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    # optionally choose not to download darwin deps (saves some resources on Linux)
    agenix.inputs.darwin.follows = "";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixos-cosmic,
      home-manager,
      utils,
      nix-on-droid,
      plasma-manager,
      nixos-generators,
      neovim-nightly-overlay,
      neorg-overlay,
      nix-colors,
      nixgl,
      agenix,
      nur,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      inherit (lib.modules) importApply;
      mkApp = utils.lib.mkApp;
    in
      utils.lib.mkFlake {
        inherit self inputs;
        channelsConfig.allowUnfree = true;
        channels.unstable.input = nixpkgs;


        sharedOverlays =  [
          self.overlays.additions
          self.overlays.modifications
          neovim-nightly-overlay.overlays.default
          neorg-overlay.overlays.default
          utils.overlay
          nixgl.overlay
          nur.overlays.default
        ]; 
       
        hostDefaults.channelName = "unstable";

        hostDefaults.modules = [
        ./nixos
        ./nix
        (importApply ./nixos/flake-inputs.nix {flake-inputs = inputs; flake-self = self;})
{     home-manager.backupFileExtension = "hm-bak";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.hannah.imports = [
        ./home
        ./home/extra.nix
        ./home/extra-extra.nix
        (importApply ./home/flake-inputs.nix  {flake-inputs = inputs; flake-self = self;})
        { colorScheme =  nix-colors.colorSchemes.pandora; }
        {
          home.username = lib.mkDefault "hannah";
          home.homeDirectory = lib.mkDefault "/home/hannah";
        }
      ]; 
}                    
        ];
        hosts.lenovo-x270.modules = [
          ./hosts/lenovo-x270
          ({lib,...}:{
          # farts.notificationDisplayOutput = "eDP-1";
            home-manager.users.hannah = {
              programs.plasma.enable = lib.mkForce false;
            };
          })
        ];

        # hosts.lenovo-x270-cosmic.modules = [
        #   ./hosts/lenovo-x270
        #   ./barebones-configuration.nix
        #   nixos-cosmic.nixosModules.default
        #   ({lib,...}:{
        #   farts.enable = lib.mkForce false;
        #   services.desktopManager.cosmic.enable = true;
        #   services.displayManager.cosmic-greeter.enable = true;
        #   })
        # ];
        hosts.x570.modules = [
          ./hosts/x570
          { 
            home-manager.users.hannah = {
            wayland.windowManager.hyprland.extraConfig = ''
              cursor:no_hardware_cursors = false
              cursor:allow_dumb_copy = true
              '';
            } ;
          }
          ];
        hosts.vmtest.modules = [
          (importApply ./hosts/vm { inherit nixos-generators; })
          {
            home-manager.users.fake.imports = [
              ./home
              ./home/extra.nix
              ./home/extra-extra.nix
              (importApply ./home/flake-inputs.nix  { flake-self = self; flake-inputs = inputs;} )
              { colorScheme =  nix-colors.colorSchemes.pandora; }
              {
                home.username = lib.mkDefault "fake";
                home.homeDirectory = lib.mkDefault "/home/fake";
              }

            ]; 
      }
    ];


          overlays = import ./overlays;
          outputsBuilder = (channels: {
          apps.vmtest = mkApp {
            drv = self.nixosConfigurations.vmtest.config.system.build.vm;
            exePath = "/bin/run-vmtest-vm";
          };
          
           packages = {
              qcow = self.nixosConfigurations.vmtest.config.formats.qcow;

              nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
              modules = [
                {
                  home-manager = {
                    config = ./home;
                    backupFileExtension = "hm-back";
                    useGlobalPkgs = true;
                    sharedModules = [
                      nix-colors.homeManagerModules.default 
                    ];
                  };
                }
                ./nix-on-droid
              ];
              pkgs = import nixpkgs {
                system = "aarch64-linux";
                overlays = [
                  nix-on-droid.overlays.default
                  neorg-overlay.overlays.default
                  utils.overlay
                ];
              };
            home-manager-path = home-manager.outPath;
              };
            };
        });
    };
}
