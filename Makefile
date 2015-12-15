# ansible-galaxy install kosssi.gitconfig
DOT = dot

all: dotfiles
	vagrant up

dotfiles:
	test -d $(DOT) || mkdir $(DOT)
	test -d $(DOT)/.ssh || mkdir -p $(DOT)/.ssh
	test -d $(HOME)/.ssh && cp -p $(HOME)/.ssh/id_rsa* $(DOT)/.ssh
	test -f $(HOME)/.pypirc && cp $(HOME)/.pypirc $(DOT)
	test -f $(HOME)/.s3cfg && cp $(HOME)/.s3cfg $(DOT)
	test -d $(HOME)/.gnupg && cp -pR $(HOME)/.gnupg $(DOT)

clean:
	rm -rf $(DOT)
