{ config, pkgs, ... }: {
	home = {
		username = "tombos";
		homeDirectory = "/home/tombos";
		stateVersion = "25.05";
	};

	programs.git.enable = true;
	programs.bash.enable = true;
}

