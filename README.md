# dotfiles
- OS: MacOS
- Text editor: [neovim](nvim/)
- Terminal: [ghostty](ghostty/)

## Setup
- Install ghostty and neovim.
- Install the [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads).
- Run the following to create a symlink to the config folder:
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ghostty ~/.config/ghostty
```
- You will also need to install fzf and ripgrep
```bash
brew install fzf ripgrep
```
