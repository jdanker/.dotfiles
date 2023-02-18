## Install script to setup dev environment
yes | sudo apt-get install build-essential

yes | sudo apt install zsh

sudo chsh -s $(which zsh) $USER

## install homebrew (linuxbrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/jdanker/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


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
stow p10k 

# install powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# load existing configs for oh-my-zsh
cat .zshrc.pre-oh-my-zsh >> .zshrc


# install neovim plugins
nvim --headless +PlugInstall +qall

# run zsh 
zsh

