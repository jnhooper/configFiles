# configFiles

## setup vim
- install vim plug https://github.com/junegunn/vim-plug#unix
- install pathogen https://github.com/tpope/vim-pathogen#installation
- install fzf https://github.com/junegunn/fzf#installation
using https://github.com/neoclide/coc.nvim under the hood for TS. heavily influenced by this config
https://github.com/neoclide/coc.nvim#example-vim-configuration
and 
https://pragmaticpineapple.com/ultimate-vim-typescript-setup/


## starship
https://starship.rs/config/

### tl;dr

`mkdir -p ~/.config && touch ~/.config/starship.toml`
copy `starship.toml` into that file

## vimmode in vscode
to [enable scrolling](https://knowledgebase.constantcontact.com/articles/KnowledgeBase/12509-Mac-Vertical-Scroll-Bars-Missing-From-Toolbar?lang=en_US) by holding k or j
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```
