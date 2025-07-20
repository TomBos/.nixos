{ config, pkgs, ... }: {
	
	imports = [ 
		../../modules/bash.nix
		../../modules/kitty/kitty.nix
		../../modules/nvim/neovim.nix
	];


	home = {
		username = "tombos";
		homeDirectory = "/home/tombos";
		stateVersion = "25.05";
	};
	
	programs.git.enable = true;
	programs.bash.enable = true;
	programs.kitty.enable = true;
	programs.neovim.enable = true;
}


