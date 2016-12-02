" Dein Installation {{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
" }}}
" Plugin Management {{{
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim/'))
" Colorscheme and airline {{{
call dein#add('freeo/vim-kalisi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" }}}
" Shougo Awesomeness {{{
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
" }}}
" tpope Awesomeness {{{
call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-abolish')
" }}}
" Syntax Awesomeness {{{
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('heavenshell/vim-jsdoc', {'on_ft':['javascript', 'typescript']})
call dein#add('moll/vim-node', {'on_ft':['javascript', 'typescript']})
call dein#add('elzr/vim-json', {'on_ft': 'json'})

call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
call dein#add('ap/vim-css-color', {'on_ft': ['css', 'scss', 'yaml']})

call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
" call dein#add('jtratner/vim-flavored-markdown', {'on_ft': 'markdown'})
call dein#add('dhruvasagar/vim-table-mode')
" call dein#add('suan/vim-instant-markdown')
call dein#add('vimlab/mdown.vim', {'build': 'npm install'})
call dein#add('nelstrom/vim-markdown-folding')
call dein#add('tyru/markdown-codehl-onthefly.vim')

call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
" }}}
" Workflow and UI/UX/Navigation Improvements {{{
call dein#add('tmux-plugins/vim-tmux')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('Chiel92/vim-autoformat')
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('jreybert/vimagit')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('mhartington/vim-devicons')
call dein#add('hecal3/vim-leader-guide')
call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
call dein#add('carlitux/deoplete-ternjs')
call dein#add('ervandew/supertab')
call dein#add('townk/vim-autoclose')
" }}}
" Tags, Linting, Building {{{
call dein#add('majutsushi/tagbar')
call dein#add('neomake/neomake')
call dein#add('ramitos/jsctags')
" }}}
" Devicons {{{
call dein#add('ryanoasis/vim-devicons')
" }}}
" Auto Install Plugins {{{
if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif
" }}}
call dein#end()
filetype plugin indent on
" }}}
" System Setup: {{{
let mapleader = ','
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set pastetoggle=<f6>
set nopaste
autocmd BufWritePre * %s/\s\+$//e
" let airline tell me my status
set noshowmode
set noswapfile
filetype on
set number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
set wildmenu
set laststatus=2
set wildmode=full
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \ exe "normal! g'\"" |
      \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz
set complete=.,w,b,u,t,k
let g:gitgutter_max_signs = 1000 " default value
let g:lmap = {}
noremap <leader>f :AutoFormat<CR>
let g:lmap.f = { 'name' : 'Format file' }
nnoremap ; :

" }}}
" Deoplete Setup: {{{
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('npm', 'debug_enabled', 1)
call deoplete#custom#set('htmlTag', 'debug_enabled', 1)
let g:vim_json_syntax_conceal = 0
set splitbelow
set completeopt+=noselect
call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', 'tern')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.html = ''
function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction

autocmd WinEnter * call Preview_func()
" Use tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" }}}
" Neosnippet Setup: {{{
let g:neosnippet#snippets_directory='~/.config/nvim/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
imap <leader>k <Plug>(neosnippet_expand_or_jump)
smap <leader>k <Plug>(neosnippet_expand_or_jump)
xmap <leader>k <Plug>(neosnippet_expand_or_jump)
smap <leader><TAB> neosnippet#expandable_or_jumpable() ? \
"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:SuperTabDefaultCompletionType = "<C-q>"
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-q>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
" }}}
" Unite Setup: {{{
" Unite Setup: {{{
let g:unite_data_directory='~/.nvim/.cache/unite'
let g:unite_source_history_yank_enable=1
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt='> '
" }}}
" Denite Setup: {{{
call denite#custom#source(
      \ 'file_rec', 'vars', {
      \   'command': [
      \     'ag', '--follow', '--nogroup', '--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib'
      \   ] })
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup', '--column'])
nnoremap <silent> <c-p> :Denite file_rec<CR>
nnoremap <silent> <leader>h :Unite -auto-resize -start-insert -direction=botright help<CR>
let g:lmap.h = { 'name': 'Unite help' }
nnoremap <silent> <leader>c :Denite colorscheme<CR>
let g:lmap.c = { 'name' : 'Denite Color' }
nnoremap <silent> <leader>u :call dein#update()<CR>
let g:lmap.u = { 'name' : 'Dein Update' }
nnoremap <silent> <leader>o :Unite -winwidth=45 -vertical -direction=botright outline<CR>
let g:lmap.o = { 'name' : 'Unite Outline' }
" Custom mappings for the unite buffer
autocmd! BufWinEnter unite call s:unite_settings()

call denite#custom#map('_', "\<C-j>", 'move_to_next_line')
call denite#custom#map('_', "\<C-k>", 'move_to_prev_line')
" }}}
" Git from unite: {{{
let s:menus = {}
let s:menus.git = {
      \ 'description': 'Fugitive interface',
      \}
let s:menus.git.command_candidates = [
      \[' git status', 'Gstatus'],
      \[' git diff', 'Gvdiff'],
      \[' git commit', 'Gcommit'],
      \[' git stage/add', 'Gwrite'],
      \[' git checkout', 'Gread'],
      \[' git rm', 'Gremove'],
      \[' git cd', 'Gcd'],
      \[' git push', 'exe "Git! push " input("remote/branch: ")'],
      \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
      \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
      \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
      \[' git fetch', 'Gfetch'],
      \[' git merge', 'Gmerge'],
      \[' git browse', 'Gbrowse'],
      \[' git head', 'Gedit HEAD^'],
      \[' git parent', 'edit %.h'],
      \[' git log commit buffers', 'Glog --'],
      \[' git log current file', 'Glog -- %'],
      \[' git log last n commits', 'exe "Glog -" input("num: ")'],
      \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
      \[' git log until date', 'exe "Glog --until=" input("day: ")'],
      \[' git log grep commits', 'exe "Glog --grep= " input("string: ")'],
      \[' git log pickaxe', 'exe "Glog -S" input("string: ")'],
      \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
      \[' git mv', 'exe "Gmove " input("destination: ")'],
      \[' git grep', 'exe "Ggrep " input("string: ")'],
      \[' git prompt', 'exe "Git! " input("command: ")'],
      \]
call denite#custom#var('menu', 'menus', s:menus)
nnoremap <silent> <Leader>g :Denite menu:git <CR>
" }}}
" }}}
" Workman Key Mappings Setup: {{{
" (O)pen line -> (L)ine {{{
nnoremap l o
nnoremap o l
nnoremap L O
nnoremap O L
" }}}
" Search (N)ext -> (J)ump {{{
nnoremap j n
nnoremap n j
nnoremap J N
nnoremap N J
" }}}
" (E)nd of Word -> brea(k) of word {{{
nnoremap k e
nnoremap e k
nnoremap K E
nnoremap E <nop>
" }}}
" (Y)ank -> (H)aul {{{
nnoremap h y
onoremap h y
nnoremap y h
nnoremap H Y
nnoremap Y H
" }}}
" }}}
" Colorscheme and Airline Setup: {{{
colorscheme kalisi
set background=dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='kalisi'
let g:airline#extensions#whitespace#enabled = 0
" }}}
" Neomake Setup: {{{
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

nmap <Leader><Space>o :lopen<CR>  " open location window
nmap <Leader><Space>c :lclose<CR> " close location window
nmap <Leader><Space>, :ll<CR> " go to current error/warning
nmap <Leader><Space>n :lnext<CR> " next error/warning
nmap <Leader><Space>p :lprev<CR> " previous error/warning
if has('nvim')
  autocmd! BufWritePost *.js Neomake
endif
" }}}
" Tagbar Setup: {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" Vimagit Setup: {{{
autocmd User VimagitEnterCommit startinsert
" }}}
" NERDTree ------------------------------------------------------------------{{{

let NERDTreeMapJumpFirstChild = ''
map <silent> - :NERDTreeToggle<CR>
" map <silent> - :VimFiler<CR>
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winwidth' : 45,
      \ 'winminwidth' : 45,
      \ 'toggle' : 1,
      \ 'auto_expand': 1,
      \ 'parent': 0,
      \ 'explorer_columns' : 'devicons',
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'hidden': 0,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })
augroup vfinit
  autocmd FileType vimfiler call s:vimfilerinit()
augroup END
function! s:vimfilerinit()
  set nonumber
  set norelativenumber
  nnoremap K 5k
endf
" let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
let g:webdevicons_enable_vimfiler = 0
" map <silent> - :VimFiler<CR>
let g:WebDevIconsOS = 'Linux'
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

" let g:webdevicons_enable_nerdtree = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
"
"

"}}}
" Navigate between vim buffers and tmux panels {{{
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-n> :TmuxNavigateDown<cr>
nnoremap <silent> <C-e> :TmuxNavigateUp<cr>
nnoremap <silent> <C-o> :TmuxNavigateRight<cr>
nnoremap <silent> <C-y> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-i> :TmuxNavigatePrevious<cr>
tmap <C-n> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-e> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-o> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-y> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-i> <C-\><C-n>:TmuxNavigatePrevious<cr>
"}}}
" Fold, gets it's own section  {{{

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
set foldlevel=99
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType html setlocal fdl=99

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType css,scss,json setlocal foldmethod=syntax
" autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType coffee setl foldmethod=indent
autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

autocmd FileType javascript,typescript,json setl foldmethod=syntax
" autocmd FileType javascript,typescript,json setlocal foldmethod=marker
" autocmd FileType javascript,typescript,json setlocal foldmarker={,}
" }}}
call leaderGuide#register_prefix_descriptions(',', 'g:lmap')
nnoremap <silent> <Leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual ','<CR>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
let g:airline_powerline_fonts=1
