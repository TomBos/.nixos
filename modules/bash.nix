{ config, lib, pkgs, ... }:

{
	programs.bash = {
    	enable = true;
		initExtra = ''
		
		if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
			export XDG_SESSION_TYPE=wayland
			dbus-run-session Hyprland
		fi

		# Load Custom exports and paths
		if [[ -d "$HOME/.exports" ]]; then
			for file in "$HOME/.exports/"*; do
				if [[ -f "$file" ]]; then
					source "$file"
				fi
			done
		fi
		
		# Aliases
		source ${./bash/aliases.sh}

		# Functions
		source ${./bash/functions.sh}

		# Custom Prompt
		source ${./bash/prompt.sh}		
		
		'';
	};
}
