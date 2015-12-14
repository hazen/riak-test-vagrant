all: dotfiles
	vagrant up

dotfiles:
	test -f $(HOME)/.gitconfig && cp $(HOME)/.gitconfig .
	mkdir -p .ssh
	test -d $(HOME)/.ssh && cp -p $(HOME)/.ssh/* .ssh
	test -f $(HOME)/.pypirc && cp $(HOME)/.pypirc .
	test -f $(HOME)/.s3cfg && cp $(HOME)/.s3cfg .
