set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
lua require'nvim-tree'.setup {}
lua require('leap').add_default_mappings()

"you can put lua script between the EOF 
lua <<EOF
EOF
