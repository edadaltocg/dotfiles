preinstall:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	cp -r .Brewfile ~/.Brewfile
	brew bundle install --global

install:
	stow -t ~/ .

uninstall:
	stow -D -t ~/ .

.PHONY: preinstall install uninstall
