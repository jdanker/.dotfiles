## Install script to setup dev environment

## install brew?
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## add brew to path commands
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

## linux brew to install packages
brew install \
	bat \
	git \
    gh \
	neovim \
	tmux \
	stow \
	ripgrep \
	direnv \
	antibody \
    hugo \
# stow
stow nvim
stow git
stow zsh
# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# set zsh default shell
sudo chsh -s $(which zsh) $USER


# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# install neovim plugins
nvim --headless +PlugInstall +qall


# run zsh 
exec zsh
