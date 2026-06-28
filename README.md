# dotfiles
- OS: MacOS
- Text editor: [neovim](nvim/)
- Terminal: [ghostty](ghostty/)
- Theme: [Rose Pine](https://github.com/rose-pine/neovim) syncing with my system theme (Rose Pine Dawn for light and Rose Pine Moon for dark)

## Setup
- Install ghostty and neovim.
- Install the [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads).
- Run the following to create a symlink to the config folder:
```bash
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/ghostty ~/.config/ghostty
```
- You will also need to install fzf and ripgrep
```bash
brew install fzf ripgrep
```
