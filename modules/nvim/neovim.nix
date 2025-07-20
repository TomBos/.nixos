{ config, pkgs, ... }: {
	programs.neovim = {
		enable = true;

		extraConfig = ''
			" Basic settings
			set nocompatible
			set encoding=utf-8
			syntax on

			" UI
			set number
			set relativenumber
			set showmatch
			set nowrap
			set scrolloff=5
			set laststatus=2

			" Searching
			set ignorecase
			set smartcase
			set incsearch
			set hlsearch

			" Tabs and indent
			set tabstop=4
			set shiftwidth=4
			set noexpandtab
			set autoindent
			set smartindent

			" Undo persistence
			set undofile
			set undodir=~/.vim/undo
			set viminfo=

			" Key mappings
			nnoremap <leader>w :w<CR>
			nnoremap <leader>q :q<CR>

			" Transparent background
			hi Normal guibg=NONE
		'';
	};
}

