# Personalized Development Environment

## Easy setup


```bash
# Clone dotfiles
cd ~
rm -r dotfiles
git clone https://github.com/edadaltocg/dotfiles.git

# Copy all dotfiles to $HOME
cp -rT dotfiles .

# Source config files
source ~/.zshrc
tmux source-file ~/.tmux.conf
```

## yabai

## tmux

[x] install tpm
[x] set prefix to ctrl + space
[x] create new window with prefix + N
[x] rename window with prefix + R
[x] kill window with prefix + X
[x] split pane vertically with prefix + |
[x] split pane horizontally with prefix + -
[x] navigate panes with prefix + arrow keys
[x] navigate panes with prefix + hjkl
[x] navigate panes with ctrl + hjkl
[x] navigate windows with prefix + window number
[x] kill pane with prefix + x
[x] allow mouse (config iTerm2)
[x] allow copy and paste
[x] vi bindings

```bash
cp .tmux.conf ~/.tmux.conf && cp -r .tmux ~ && tmux source-file ~/.tmux.conf
```

## neovim

[x] install LazyVim
[x] install LazyGit
[x] install mason
[] navigate to tmux seamlessly with 
[] relative lines
[x] show hidden files (shift + h on neo-tree)
[] navigate between buffers with ctrl + tab (last used)
[] save file with space + w
[] preview markdown with glow
[] stop hiding special characters conceal level 0
[] setup all lsps
[] change colorscheme to github
[] make menu appear fast
[] nvim tree space + e
[] telescope space + f
[] find files space + s + f
[] toggle term ctrl + \

```bash
rm -r ~/.config/nvim && cp -r .config/nvim ~/.config/
```

### LSP

key	description	mode
K	hover information (double tap to get inside)	normal
KK	move cursor inside K window	normal
gd	go to definition	normal
gD	go to declaration	normal
gr	go to references	normal
gI	go to implementation	normal
gs	show signature help	normal
gl	show line diagnostics	normal
glgl	move cursor inside gl diagnostics window	normal

https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

## mutagen

```bash
cp -r .mutagen.yml ~/.mutagen.yml
```

## Copilot

```
:Copilot setup
```

## Dev container

```bash
docker-compose up --build
docker-compose run --remove-orphans dev_container /bin/zsh
```
