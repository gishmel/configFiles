" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

let mapleader = ','
" Mappings to make things easier
" Switch to downward pane using ,m
" Switch to upward pane using Alt-m
" Switch to left pane using ,z
:nmap <leader>z <C-w>h
" Switch to right pane using ,x
:nmap <leader>x <C-w>l
" Split mappings 
noremap <C-t>- :split<CR>
noremap <C-t>\ :vsplit<CR>

call plug#begin('~/.config/nvim/plugged')

  Plug 'freeo/vim-kalisi'
  " vim-airline {{{
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " tabline 
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s:'
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
  let g:airline_powerline_fonts = 0
  let g:airline_theme='kalisi'
  let g:airline#extensions#whitespace#enabled = 0
  " }}}
  " Neomake {{{
  Plug 'benekastah/neomake'
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
  let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
  let g:neomake_open_list = 2

  " Neomake 
  nmap <Leader><Space>o :lopen<CR> " open location window
  nmap <Leader><Space>c :lclose<CR> " close location window
  nmap <Leader><Space>, :ll<CR> " go to current error/warning
  nmap <Leader><Space>n :lnext<CR> " next error/warning
  nmap <Leader><Space>p :lprev<CR> " previous error/warning

  if has('nvim')
    autocmd! BufWritePost *.js Neomake
  endif
  " }}}

  " Shougo Awesomeness {{{
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  set completeopt+=menuone
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippets'
  imap <leader>k <Plug>(neosnippet_expand_or_jump)
  smap <leader>k <Plug>(neosnippet_expand_or_jump)
  xmap <leader>k <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? \
  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  Plug 'Shougo/context_filetype.vim'
  Plug 'Shougo/neoinclude.vim'
  " }}}
  " tpope Awesomeness {{{
  " Surround (surrounding text ( cs[motion], insert: ysi[motion], entire line:
  " yss))
  Plug 'tpope/vim-surround'
  " Unimpaired (pairs of handy bracket mappings)
  Plug 'tpope/vim-unimpaired'
  " vim-commentary (Comment and Uncomment with gcc)
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  " search for, substitute, and abbreviate multiple variants of a word and
  " camel/snake case conversion
  Plug 'tpope/vim-abolish'
  " Git support for vim 
  Plug 'tpope/vim-fugitive'
  " }}}
  Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<C-n>"

  " Javascript and Node.js {{{
  Plug 'pangloss/vim-javascript'
  Plug 'othree/es.next.syntax.vim'
  Plug 'elzr/vim-json'
  " }}}

call plug#end()

" Go to matching parenthesee
noremap % v%
" Configuration Stuff 
" Indentation and Spaces {{{
" makes <TAB> => 4 * ' '
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
" }}}
filetype plugin indent on
" Screen UI stuff
colorscheme kalisi
" Colorscheme
set background=dark

set number
set ruler 
set lazyredraw

" Searching
" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding 
set foldmethod=marker
