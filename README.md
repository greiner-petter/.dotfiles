# Dotfiles

CachyOS + Hyprland + Caelestia rice, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

### 1. Clone

```bash
git clone --recursive <repo-url> ~/.dotfiles
```

### 2. Install packages

```bash
sudo pacman -S --needed - < ~/.dotfiles/packages/pacman.txt
yay -S --needed - < ~/.dotfiles/packages/aur.txt
```

### 3. Stow config files

```bash
cd ~/.dotfiles
stow --adopt .
git restore .
```

`--adopt` moves any existing conflicting files into the stow directory, then `git restore` reverts them to the repo versions. This effectively force-overwrites existing files while creating the proper symlinks.

Alternatively, to stow without adopting (will fail if conflicts exist):

```bash
cd ~/.dotfiles
stow .
```

### Updating package lists

After installing or removing packages, run:

```bash
pkg-save
```
