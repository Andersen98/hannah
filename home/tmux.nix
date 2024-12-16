{pkgs,...}:{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    disableConfirmationPrompt = true;
    focusEvents = true;
    historyLimit = 5000000;
    keyMode = "vi";
    newSession = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      {plugin = better-mouse-mode; 
      extraConfig = "";}
      {plugin = mode-indicator; 
      extraConfig = "";}
      {plugin = online-status; 
      extraConfig = "";}
      {plugin = power-theme; 
      extraConfig = "";}
      {plugin = prefix-highlight; 
      extraConfig = "";}
      {plugin = resurrect; 
      extraConfig = "";}
      {plugin = tilish;}      
      {plugin = sensible;}      
    ];  };
}
