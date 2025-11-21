# Dotfiles

My personal configuration files for:
- Neovim
- Zsh
- Starship prompt

## Installation

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

1. Clone this repository:
   ```bash
   git clone git@github.com:rjones88/dotfiles.git ~/dotfiles
   ```

2. Install GNU Stow:
   ```bash
   sudo pacman -S stow
   ```

3. Create symlinks:
   ```bash
   cd ~/dotfiles
   stow nvim zsh starship
   ```

## Uninstall

To remove symlinks:
```bash
cd ~/dotfiles
stow -D nvim zsh starship
```

## Structure

- `nvim/` - Neovim configuration
- `zsh/` - Zsh configuration
- `starship/` - Starship prompt configuration
