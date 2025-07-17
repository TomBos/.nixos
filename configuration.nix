
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nixie";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";
  

  users.users.tombos = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
     ];
  };

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
     xdg-desktop-portal
     xdg-desktop-portal-wlr
     wayland
     pkgs.waybar
     pkgs.dunst
     libnotify
     kitty
     rofi-wayland
     librewolf-bin
	 bat
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
  ];

  programs.hyprland.enable = true;
  services.openssh.enable = true;
  nix.settings.experimental-features = [
      "nix-command" "flakes"
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}

