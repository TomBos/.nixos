{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
    };
    initExtra = ''
      # Custom bash initialization
      export EDITOR=nvim
    '';
  };
}
