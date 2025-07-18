{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixie";
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Prague";

	users.users.tombos = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" ];
		packages = with pkgs; [
			librewolf-bin
			nerd-fonts.jetbrains-mono
			nerd-fonts.symbols-only
			tree
		];
	};

	environment.systemPackages = with pkgs; [
		neovim
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
		"nix-command"
		"flakes"
		"pipe-operators"
	];

	# Do not change this
	# Unless you know what you are doing
	system.stateVersion = "25.05";
}

