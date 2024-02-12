install:
	stow --ignore=Makefile -t ~/ .

uninstall:
	stow --ignore=Makefile -D -t ~/ .