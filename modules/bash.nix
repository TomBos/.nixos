{ config, lib, pkgs, ... }:

{
	programs.bash = {
    	enable = true;
		initExtra = ''
		
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
