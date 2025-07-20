{ config, lib, pkgs, ... }:

{
	programs.bash = {
    	enable = true;
		initExtra = ''
		
		if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
			export XDG_SESSION_TYPE=wayland
			dbus-run-session Hyprland
			swww-deamon &
		fi

		# Env
		source ${./bash/exports.sh}

		# Aliases
		source ${./bash/aliases.sh}

		# Functions
		source ${./bash/functions.sh}

		# Custom Prompt
		source ${./bash/prompt.sh}		
		
		'';
	};
}
