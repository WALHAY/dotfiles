{ config, pkgs, ... }:

{
  home.username = "walhay";
  home.homeDirectory = "/home/walhay";

  home.packages = with pkgs; [
    fuzzel
    neovim
    swaybg
    waybar
    vim
    ghostty
    mako
    firefox
    telegram-desktop
    git
    chezmoi
    starship
    home-manager
	zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  # Home Manager settings
  home.stateVersion = "25.11";
}
