{ pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.system}.default;
    settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
  };
}
