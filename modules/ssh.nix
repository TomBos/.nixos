{
	home.file."~/.ssh/config".text = ''
	Host github.com
		User git
		Hostname github.com
		IdentitiesOnly yes

	Match host github.com exec "test -f $HOME/.ssh/Archie-GH"
		IdentityFile $HOME/.ssh/Archie-GH

	Match host github.com exec "test -f $HOME/.ssh/Archie-Laptop-GH"
		IdentityFile $HOME/.ssh/Archie-Laptop-GH

	Match host github.com exec "test -f $HOME/.ssh/Arch-Work-GH"
		IdentityFile $HOME/.ssh/Arch-Work-GH

	Host bitbucket.org
		User git
		Hostname bitbucket.org
		IdentitiesOnly yes

	Match host bitbucket.org exec "test -f $HOME/.ssh/Arch-Work-IH"
		IdentityFile $HOME/.ssh/Arch-Work-IH

	Match host bitbucket.org exec "test -f $HOME/.ssh/Archie-Laptop-IH"
		IdentityFile $HOME/.ssh/Archie-Laptop-IH

	Match host bitbucket.org exec "test -f $HOME/.ssh/Archie-IH"
		IdentityFile $HOME/.ssh/Archie-IH
	'';
}
