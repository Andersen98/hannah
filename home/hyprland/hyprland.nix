{lib, pkgs, ...}:
{


  programs.hyprlock = {
    enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "$mod" = "SUPER";
      general = {
        allow_tearing = true;
      };
      input = {
        follow_mouse = 1;
        off_window_axis_events = 3;
      };
      # gestures = {
      #   workspace_swipe = true;
      #   workspace_swipe_min_fingers = true;
      #   workspace_swipe_create_new = false;
      # };
#       device = {
#         name = "synps/2-synaptics-touchpad";
#           scroll_button = 274;
# touchpad = {          clickfinger_behavior = true;
#           drack_lock = true;
# };        
#       };
      windowrulev2 = [ 
      "immediate, class:^(dolphin-emu)$" ];
      misc = {
        vrr = 2;
        # animate_manual_resizes = true;
        # render_ahead_of_time = true;
      };
      debug = {
        disable_logs = false;
      };
      bind =
        [          # Screenshot a window
          "$mod, PRINT, exec, uwsm-app -s a hyprshot -- -m window"
          ", PRINT, exec, uwsm-app -s a hyprshot -- -m output"
          "SUPER_SHIFT, PRINT, exec, uwsm-app -s a hyprshot -- -m region"
 "$mod, P, exec, uwsm-app hyprpicker -- -a -f hex"
          # launch apps
          "$mod, Z, exec, uwsm-app  -- zeditor"
          "$mod, F, exec, uwsm-app -s a -- firefox.desktop"
          "$mod, Return, exec, uwsm-app -s a -- ${pkgs.kitty}/bin/kitty"
          "$mod, S, exec, uwsm-app -s a -- firefox.desktop:new-window https://search.nixos.org/packages?channel=unstablesort=relevance&type=packages"
          "$mod, E, exec, uwsm-app -s a -- ${pkgs.kitty}/bin/kitty --directory ~/nix-config"
          "$mod, Q, killactive"
          "$mod, grave, togglefloating"
          "$mod, g, fullscreen, 0"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

    };
    extraConfig = ''
      exec-once = uwsm-app -s b hyprpaper
      bind = SUPER, R, submap, resize
      submap =  resize
      binde = , L, resizeactive, 20 0
      binde = , H, resizeactive, -20 0
      binde = , K, resizeactive, 0 20
      binde = , J, resizeactive, 0 -20
      bindm = , Control_L, movewindow
      bindm = , ALT_L, resizeWindow
      bind = , escape, submap, reset

      submap = reset

      '';
  };
}
