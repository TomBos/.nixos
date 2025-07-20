{ config, lib, pkgs, ... }:

{
	programs.bash = {
    	enable = true;
    	shellAliases = {
    		ll = "ls -lah";
	  		reboot = "systemctl reboot";
			shutdown = "systemctl poweroff";
			uefi = "systemctl reboot --firmware-setup";
			reload = "clear && source $BASHRC";
			ducks = "sudo du -ahxd1 | sort -hr | head -n 11";
			mv = "mv -i";
			icat = "kitten icat";
			chomd = "chmod";
			gut = "git";
			mdkir = "mkdir";
			filezilla="nohup filezilla > /dev/null 2>&1 &";
			librewolf="nohup librewolf -P > /dev/null 2>&1 &";
		};
		
		initExtra = ''
			alias cd..="cd .."

			# Source Bash Prompt
			if [[ -f "$HOME/.bash_prompt" ]]; then
				source "$HOME/.bash_prompt"
			else
				export PS1="\u@\h:\w\$ "
			fi

			# Load Custom exports and paths
			if [[ -d "$HOME/.exports" ]]; then
				for file in "$HOME/.exports/"*; do
					if [[ -f "$file" ]]; then
						source "$file"
					fi
				done
			fi

			# Source Bash functions
			source ${./bash/functions.sh}

			# Custom Prompt
			source ${./bash/prompt.sh}		
		'';
	};
}
