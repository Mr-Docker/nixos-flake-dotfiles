{ config, pkgs, inputs, ... }:
  
{
  imports = [
    ./modules/home/noctalia.nix
  ];

  home.username = "kle";
  home.homeDirectory = "/home/kle";
  home.stateVersion = "26.05";

  xdg.configFile."mango/config.conf".text = builtins.readFile ./config.conf;

  programs.bash = {
    enable = true;
    shellAliases = {
      c = "clear";
      v = "nvim";
      p = "python";
      ff = "fastfetch";
      nrs = "cd ~/nixos-flake-dotfiles; sudo nixos-rebuild switch --flake .#hack; cd -";
      eh = "nvim /home/kle/nixos-flake-dotfiles/home.nix";
      ec = "nvim /home/kle/nixos-flake-dotfiles/configuration.nix";
      en = "nvim /home/kle/nixos-flake-dotfiles";
      ls = "eza";
      ll = "eza -la";
      fu = "cd ~/nixos-flake-dotfiles; nix flake update; cd -";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      window.padding = {
        x = 8;
	y = 8;
      };
      font = {
        size = 17;
        normal = {
          family = "ShureTechMono Nerd Font";
          style = "Regular";
        };
      };
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      hide-keyboard-layout = true;
      color = "1d1f21";
      indicator-idle-visible = true;
      indicator-radius = 150;
      indicator-thickness = 30;
      inside-color = "1d1f21";
      inside-clear-color = "1d1f21";
      inside-ver-color = "1d1f21";
      inside-wrong-color = "1d1f21";
      key-hl-color = "7aa6daaa";
      bs-hl-color = "d54e53aa";
      separator-color = "55555555";
      line-color = "1d1f21";
      line-uses-ring = true;
      text-color = "81a2be";
      text-clear-color = "b5bd68";
      text-caps-lock-color = "f0c674";
      text-ver-color = "81a2be";
      text-wrong-color = "cc6666";
      ring-color = "81a2be55";
      ring-ver-color = "81a2be";
      ring-clear-color = "b5bd6811";
      ring-wrong-color = "cc6666";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    #useTheme = "gruvbox";
    configFile = "/home/kle/.config/ohmyposh/kle.omp.json";
  };


  home.packages = with pkgs; [
    bat
    cmatrix
  ];
}
