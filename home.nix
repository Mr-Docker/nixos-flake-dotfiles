{ config, pkgs, ... }:

{
  home.username = "kle";
  home.homeDirectory = "/home/kle";
  home.stateVersion = "26.05";

  xdg.configFile."mango/config.conf".text = builtins.readFile ./config.conf;

  programs.bash = {
    enable = true;
    shellAliases = {
      c = "clear";
      v = "nvim";
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch";
      eh = "sudo nvim /etc/nixos/home.nix";
      ec = "sudo nvim /etc/nixos/configuration.nix";
      en = "sudo nvim /etc/nixos";
      ls = "eza";
      ll = "eza -la";

    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;
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

  home.packages = with pkgs; [
    bat
    cmatrix
  ];
}
