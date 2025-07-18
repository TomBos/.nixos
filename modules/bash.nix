{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
      update = "sudo nixos-rebuild switch --flake .#Nixie";
    };
    initExtra = ''
      # Custom bash initialization
      export EDITOR=nvim
    '';
  };
}
