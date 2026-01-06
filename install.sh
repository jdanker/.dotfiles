#!/bin/bash
# macOS (Apple Silicon) Development Environment Setup
# Uses GNU Stow to symlink dotfiles to home directory

set -e  # Exit on error

echo "🚀 Setting up macOS development environment..."

# Check for Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "⏸️  Please complete Xcode CLI Tools installation, then re-run this script"
    exit 1
else
    echo "✅ Xcode Command Line Tools already installed"
fi

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed"
fi

# Install packages
echo "📦 Installing packages via Homebrew..."
brew install \
    zsh \
    bat \
    git \
    gh \
    neovim \
    tmux \
    stow \
    ripgrep \
    hugo

# Set zsh as default shell if not already
if [[ "$SHELL" != "$(which zsh)" ]]; then
    echo "🐚 Setting zsh as default shell..."
    chsh -s "$(which zsh)"
else
    echo "✅ zsh already default shell"
fi

# Install oh-my-zsh if not present (non-interactive)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "💫 Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ oh-my-zsh already installed"
fi

# Install powerlevel10k theme
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
    echo "🎨 Installing powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
    echo "✅ powerlevel10k already installed"
fi

# Install zsh plugins
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]]; then
    echo "🔌 Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
else
    echo "✅ zsh-autosuggestions already installed"
fi

if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
    echo "🔌 Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting already installed"
fi

# Use GNU Stow to symlink dotfiles
echo "🔗 Symlinking dotfiles with stow..."
cd "$(dirname "$0")"
stow -R nvim
stow -R git
stow -R zsh
stow -R p10k

# Install neovim plugins
if command -v nvim &>/dev/null; then
    echo "🔌 Installing neovim plugins..."
    nvim --headless +PlugInstall +qall 2>/dev/null || true
fi

echo ""
echo "✨ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal or run: exec zsh"
echo "   2. Configure p10k if first time: p10k configure"
echo "   3. Configure git credentials if needed"
echo ""
