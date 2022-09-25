## Install script to setup dev environment

## install homebrew (linuxbrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo apt-get install build-essential

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
# install powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## linux brew to install packages
brew install \
    gcc \
    zsh \
    bat \
    git \
    gh \
    neovim \
    tmux \
    stow \
    ripgrep \
    hugo

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



# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# install neovim plugins
nvim --headless +PlugInstall +qall


# run zsh 
exec zsh
