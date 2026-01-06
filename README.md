# .dotfiles

Personal macOS development environment configuration managed with GNU Stow.

## Features

- **Shell**: zsh with oh-my-zsh and powerlevel10k theme
- **Editor**: neovim with vim-plug and gruvbox-material theme
- **Version Control**: git with LFS support
- **Tools**: bat, ripgrep, gh CLI, hugo, tmux

## Structure

```
.dotfiles/
├── git/         # Git configuration
├── nvim/        # Neovim configuration
├── p10k/        # Powerlevel10k theme configuration
├── zsh/         # Zsh configuration with oh-my-zsh
└── install.sh   # Automated setup script
```

## Installation

### Prerequisites
- macOS (Apple Silicon)
- Internet connection

### Quick Start

```bash
cd ~/.dotfiles
./install.sh
```

The script will:
1. Install Xcode Command Line Tools (if needed)
2. Install Homebrew (if needed)
3. Install required packages (zsh, neovim, git, etc.)
4. Install oh-my-zsh and powerlevel10k theme
5. Symlink configurations using GNU Stow
6. Install neovim plugins

The script is idempotent - safe to run multiple times.

## Post-Installation

1. Restart your terminal or run: `exec zsh`
2. Configure p10k theme (first time): `p10k configure`
3. Update git credentials if needed

## Customization

Each directory (git, nvim, p10k, zsh) is a GNU Stow package. To modify:
- Edit files in their respective directories
- Re-stow if needed: `stow -R <package>`

## Zsh Plugins

Installed as oh-my-zsh custom plugins:
- zsh-autosuggestions
- zsh-syntax-highlighting

Built-in oh-my-zsh plugins:
- git, 1password, golang, wd

## Neovim Plugins

Managed with vim-plug:
- gruvbox-material (color scheme)
