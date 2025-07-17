{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "Nixie";
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Prague";

	users.users.tombos = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		packages = with pkgs; [
			librewolf-bin
			bat
			nerd-fonts.jetbrains-mono
			nerd-fonts.symbols-only
		];
	};

	environment.systemPackages = with pkgs; [
		vim-full
		wl-clipboard
		wget
		git
		xdg-desktop-portal
		xdg-desktop-portal-wlr
		wayland
		waybar
		dunst
		libnotify
		kitty
		rofi-wayland
		swww
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

	# Did you read the nix-devs comments ?
	system.stateVersion = "25.05";
}

