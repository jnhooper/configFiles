# configFiles

## setup vim
- install vim plug https://github.com/junegunn/vim-plug#unix
- install pathogen https://github.com/tpope/vim-pathogen#installation
- install fzf https://github.com/junegunn/fzf#installation

using https://github.com/neoclide/coc.nvim under the hood for TS. heavily influenced by this config
https://github.com/neoclide/coc.nvim#example-vim-configuration
and 
https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
 
## install a font
 https://github.com/powerline/fonts#quick-installation
 or 
 https://www.nerdfonts.com/

## install neovim and setup config
- make a `nvim` folder in your `~/.config` folder
- copy the `init.vim` file
- add `coc-settings.json` in the same config folder and copy the contents found here
- install silver searcher https://github.com/ggreer/the_silver_searcher
some plugins require at least neovim v0.8 which is NOT the default on ubuntu, so some manual installation might be needed.
[this](https://linuxopsys.com/topics/install-neovim-ubuntu-and-plugins) was useful
 

## starship
https://starship.rs/config/

### tl;dr

`mkdir -p ~/.config && touch ~/.config/starship.toml`
copy `starship.toml` into that file

## eza
https://github.com/eza-community/eza

## zsh tools
https://github.com/marlonrichert/zsh-autocomplete
https://github.com/zsh-users/zsh-autosuggestions

## vimmode in vscode
to [enable scrolling](https://knowledgebase.constantcontact.com/articles/KnowledgeBase/12509-Mac-Vertical-Scroll-Bars-Missing-From-Toolbar?lang=en_US) by holding k or j
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```
