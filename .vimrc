" Start up pathogen
execute pathogen#infect()

call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
" https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" comments
Plug 'preservim/nerdcommenter'
" theme
Plug 'haishanh/night-owl.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'artanikin/vim-synthwave84'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" You just always do this. It has to do w/ vi compatability maybe
set nocompatible

set term=xterm-256color
" theme
if has('termguicolors')
    set termguicolors
endif

""""" enable the theme
syntax enable
set background=dark
"colorscheme night-owl
"colorscheme dracula
" colorscheme synthwave84
" colorscheme palenight
colorscheme desert


" https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/
" remap fzf ctrl-p
nnoremap <C-p> :GFiles<Cr>

" silver searcher
nnoremap <C-g> :Ag<Cr>

" Turn on syntax highlighting
syntax on

" Show what's happening in the bottom right corner
set showcmd

" Use space as leader key
map <Space> <Leader>
" I write and quit a lot, so aliases that don't require an <Enter> are nice
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Enter 'jj' in insert mode to return to normal mode
inoremap jj <ESC>

" Ctrl+j and Ctrl+k for longer vertical hops
nnoremap <C-k> 5k
vnoremap <C-k> 5k
nnoremap <C-j> 5j
vnoremap <C-j> 5j

" Allow hidden buffers
set hidden

" Always show tab listing, even if only 1 tab is open
set showtabline=2
" Ctrl-n and Ctrl-p to move to next and previous tab
nnoremap <C-n> :tabn<CR>
nnoremap <C-b> :tabp<CR>

" Highlight search results
set hlsearch
nnoremap <C-h> :noh<CR>

" Line numbers
set number

" Highlight the line the cursor is on
set cursorline

" Show row & column in statusbar
set ruler
" Sad.
set colorcolumn=101

" Set location for backup and swap files, respectively
set backupdir=./.backup,/tmp//,.
set directory=./.backup,/tmp//,.

" Lots of stuff for indents and text width
set tabstop=2
set shiftwidth=2
set nowrap
set textwidth=150
set formatoptions=tcq
set ai
set copyindent
set smarttab
set expandtab

" Get menu for autocompletes like :find
set wildmenu

" Don't look into node_modules - there's a zillion files in there and I (usually) don't care about any of them
set wildignore+=*/node_modules/*

" Allow backspacing over all kinds of stuff
set backspace=indent,eol,start

" Add a small scroll-off value so there's always a few lines above & below the cursor
set scrolloff=4

" open splits below or to the right of the current window - the default top/left is weird
set splitbelow
set splitright

" Path is directory of current file, working directory, and recursive search from working directory
set path=.,,**

" Hm
filetype on
filetype plugin on
filetype indent on

" Language-specific
autocmd FileType html,ruby,eruby,css,scss setlocal sw=2 ts=2 tw=0
autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx setlocal sw=2 sts=2 ts=2 tw=100 et

" Automatic text wrapping at col 80 for git commits
autocmd FileType gitcommit setlocal tw=80 colorcolumn=81

" ctrlp plugin configuration
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_root_markers = ['package.json']
" ignore gitignored files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" CONFIGURE COC
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" END COC CONFIG

" configure neomake to use local eslint
autocmd! BufWritePost * Neomake
let g:neomake_javascript_eslint_maker = {
    \ 'exe': 'node_modules/.bin/eslint',
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" jump to next error in location list with <Leader> e
nnoremap <Leader>e :lnext<CR>

set cole=1
let g:javascript_conceal_function="ƒ"

" vim-json syntax config
" don't conceal quotes, I'm just not into that
let g:vim_json_syntax_conceal = 0

" just for react
abbr ptarray PropTypes.array
abbr ptarrayr PropTypes.array.isRequired
abbr ptbool PropTypes.bool
abbr ptboolr PropTypes.bool.isRequired
abbr ptfunc PropTypes.func
abbr ptfuncr PropTypes.func.isRequired
abbr ptnumber PropTypes.number
abbr ptnumberr PropTypes.number.isRequired
abbr ptshape PropTypes.shape
abbr ptshaper PropTypes.shape.isRequired
abbr ptstring PropTypes.string
abbr ptstringr PropTypes.string.isRequired
