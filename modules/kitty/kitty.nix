{ config, pkgs, ... }: {
	programs.kitty = {
		settings = {
			font_family = "JetBrainsMono Nerd Font";
			font_size = 14.0;
			initial_window_width = "80";
			initial_window_height = "36";
			allow_remote_control = "yes";
			include = "colors.conf";
			background_opacity = "0.6";
		};
	};

	home.file.".config/kitty/colors.conf".text = ''
		color0	#000000
		color1	#E06C75
		color2	#98C379
		color3	#D19A66
		color4	#61AFEF
		color5	#C678DD
		color6	#56B6C2
		color7	#ABB2BF
		color8	#5C6370
		color9	#E06C75
		color10	#98C379
		color11	#D19A66
		color12	#61AFEF
		color13	#C678DD
		color14	#56B6C2
		color15	#FFFEFE
		background	#1E2127
		foreground	#FFFFFF
		cursor		#5C6370
	'';
}

