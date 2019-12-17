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
call dein#add('w0rp/ale')
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('othree/html5-syntax.vim', {'on_ft': 'html'})
call dein#add('othree/html5.vim', {'on_ft': 'html'})
call dein#add('othree/jspc.vim', {'on_ft': 'javascript'})
call dein#add('heavenshell/vim-jsdoc', {'on_ft':['javascript', 'typescript']})
call dein#add('moll/vim-node', {'on_ft':['javascript', 'typescript']})
call dein#add('elzr/vim-json', {'on_ft': 'json'})
call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})

call dein#add('gregsexton/matchtag', {'on_ft': 'html'})

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
call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})
call dein#add('ervandew/supertab')
call dein#add('townk/vim-autoclose')
" }}}
" Tags, Linting, Building {{{
call dein#add('xolox/vim-easytags')
call dein#add('xolox/vim-misc')
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
" Use tern_for_vim {{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
autocmd FileType javascript setlocal omnifunc=tern#Complete

noremap <Leader>tD :TernDoc<CR> " Find the documentation of the thing under the cursor
noremap <Leader>tb :TernDocBrowse<CR> " Browse the documentation
noremap <Leader>tt :TernType<CR> " Find the type of the thing under the cursor
noremap <Leader>td :TernDef<CR> " Jump to the definition of the thing under the cursor
noremap <Leader>tpd :TernDefPreview<CR> " Bring up a small split with the definition
noremap <Leader>ttd :TernDefTab<CR> " Bring up a tab with the definition
noremap <Leader>tr :TernRefs<CR> " Show all references to the thing under the cursor
noremap <Leader>tR :TernRename<CR> " Rename the variable under the cursor

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

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
" Tags Setup: {{{
nmap <F8> :TagbarToggle<CR>
let g:easytags_async = 1
nnoremap <Leader>tj <C-]>
nnoremap <Leader>tb <C-t>
" }}}
" Vimagit Setup: {{{
autocmd User VimagitEnterCommit startinsert
noremap <Leader>m :Magit<CR>
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

autocmd FileType javascript,typescript,json setl foldmethod=syntax
" autocmd FileType javascript,typescript,json setlocal foldmethod=marker
" autocmd FileType javascript,typescript,json setlocal foldmarker={,}
" }}}

" Deoplete ------------------------------------------------------------------{{{

  " enable deoplete
  let g:deoplete#enable_at_startup = 1

  call deoplete#custom#option({
   \ 'auto_complete_delay': 0,
   \ 'smart_case': v:true,
   \})
  call deoplete#custom#option('omni_patterns', {
   \ 'html': '',
   \ 'css': '',
   \ 'scss': ''
   \})
  let g:echodoc_enable_at_startup=1
  let g:echodoc#type="virtual"
  set splitbelow
  set completeopt+=menuone,noinsert,noselect
  set completeopt-=preview
  autocmd CompleteDone * pclose

  function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
  endfunction
  function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
  endfunction


  let g:deoplete#file#enable_buffer_path=1
  " call deoplete#custom#source('buffer', 'mark', 'ℬ')
  " call deoplete#custom#source('tern', 'mark', '')
  " call deoplete#custom#source('omni', 'mark', '⌾')
  " call deoplete#custom#source('file', 'mark', '')
  " call deoplete#custom#source('jedi', 'mark', '')
  " call deoplete#custom#source('neosnippet', 'mark', '')
  " call deoplete#custom#source('LanguageClient', 'mark', '')
  " call deoplete#custom#source('typescript',  'rank', 630)
  " call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
  " call deoplete#custom#source('_', 'sorters', [])
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {'_': ['around', 'buffer', 'member' ]}

  " let g:deoplete#enable_debug = 1
  " call deoplete#enable_logging('WARN', 'deoplete.log')
  " call deoplete#custom#source('typescript', 'is_debug_enabled', 1)
"}}}

" Denite --------------------------------------------------------------------{{{

  let s:menus = {}
  call denite#custom#option('_', {
       \ 'prompt': '❯',
       \ 'winheight': 10,
       \ 'updatetime': 1,
       \ 'auto_resize': 0,
       \ 'highlight_matched_char': 'Underlined',
       \ 'highlight_mode_normal': 'CursorLine',
       \ 'reversed': 1,
       \ 'auto-accel': 1,
       \ 'start_filter': 1,
       \})
  call denite#custom#option('TSDocumentSymbol', {
       \ 'prompt': '@ ' ,
       \})
  call denite#custom#option('TSWorkspaceSymbol', {
       \ 'prompt': '# ' ,
       \ 'start_filter': 0,
       \})
  "
  call denite#custom#source('file/rec', 'vars', {
       \'command': ['rg', '--files', '--glob', '!.git'],
       \'matchers': ['matcher/fruzzy'],
       \'sorters':['sorter_sublime'],
       \})
  let g:denite#_update_timer = timer_start(5, {-> denite#call_async_map('update')}, {'repeat': -1})
  call denite#custom#source('grep', 'vars', {
       \'command': ['rg'],
       \'default_opts': ['-i', '--vimgrep'],
       \'recursive_opts': [],
       \'pattern_opt': [],
       \'separator': ['--'],
       \'final_opts': [],
       \'matchers': ['matcher/ignore_globs', 'matcher/regexp', 'matcher/pyfuzzy']
       \})

  let g:ctrlp_user_command="rg --files --glob !.git"
  let g:ctrlp_grep_command_definition="rg -i --vimgrep"
  let g:ctrlp_use_caching = 0
  let g:ctrlp_match_func = {'match': 'fruzzy#ctrlp#matcher'}
  let fruzzy#usenative = 1



  nnoremap <silent> <c-p>      :Denite file/rec<CR>
  nnoremap <silent> <leader>h  :Denite help<CR>
  nnoremap <silent> <leader>v  :Denite vison<CR>
  nnoremap <silent> <leader>c  :Denite colorscheme<CR>
  nnoremap <silent> <leader>al :Denite airline<CR>
  nnoremap <silent> <leader>b  :Denite buffer<CR>
  nnoremap <silent> <leader>l  :Denite line<CR>
  nnoremap <silent> <leader>a  :Denite grep:::!<CR>
  nnoremap <silent> <leader>u  :DeinUpdate<CR>
  nnoremap <silent> <Leader>i  :Denite menu:ionic <CR>
  nnoremap <silent> z=   :Denite -no-start-filter spell <CR>


  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')

    nnoremap <silent><buffer><expr> <Tab>    denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> <ESC>   denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  endfunction

  autocmd FileType denite-filter call s:denite_filter_settings()
  function s:denite_filter_settings() abort
    setl nonumber
    call deoplete#custom#buffer_option('auto_complete', v:false)
    " nunmap <CR>
    inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    inoremap <silent><buffer> <CR>  <ESC><C-w>p:call denite#call_map('do_action')<CR>
    " inoremap <silent><buffer> <CR>  <Esc><C-w>p<CR>

    " inoremap <silent><buffer> <Space> <Esc><C-w>p:call denite#call_map()('toggle_select', [])<CR><C-w>pA
    inoremap <silent><buffer> <Tab>   <Esc><C-w>p:call denite#call_map('choose_action')<CR>
    inoremap <silent><buffer> <Space> <Esc><C-w>p:call denite#call_map('toggle_select')<CR><C-w>pA
    inoremap <silent><buffer> <C-n>   <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-p>   <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
  endfunction

  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
  call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)
"}}}

" Linting -------------------------------------------------------------------{{{

  call neomake#configure#automake({
  \ 'BufWritePost': {'delay': 0},
  \ 'BufWinEnter': {},
  \ 'TextChanged': {},
  \ 'InsertLeave': { },
  \ }, 1000)
  " call neomake#configure#automake({
  " \ 'BufWritePost': {},
  " \ }, 0)

  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '•'
  let g:airline#extensions#ale#error_symbol='• '
  let g:airline#extensions#ale#warning_symbol='•  '
  let g:airline#extensions#neomake#error_symbol='• '
  let g:airline#extensions#neomake#warning_symbol='•  '
  " let g:neomake_typescript_tsc_tempfile_enabled = 0
  " let g:neomake_typescript_tslint_tempfile_enabled = 0
  let g:neomake_warning_sign = {'text': '•'}
  let g:neomake_error_sign = {'text': '•'}
  let g:neomake_info_sign = {'text': '•'}
  let g:neomake_message_sign = {'text': '•'}

  hi link ALEError SpellBad
  hi link ALEWarning SpellBad
  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  " let g:neomake_verbose = 3
  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \}
  let g:ale_fix_on_save = 1
"}}}

" Javascript ----------------------------------------------------------------{{{
  " set nobinary
  " let $NVIM_NODE_LOG_FILE='nvim-node.log'
  " let $NVIM_NODE_LOG_LEVEL='warn'
  " let $NVIM_NODE_HOST_DEBUG=1

  let g:neoformat_javascript_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_javascript = ['prettier']

  autocmd FileType vue syntax sync fromstart

  let g:jsx_ext_required = 0
  let g:neomake_javascript_enabled_makers = []
  let g:jsdoc_allow_input_prompt = 1
  let g:jsdoc_input_description = 1
  let g:jsdoc_return=0
  let g:jsdoc_return_type=0

  let g:neoformat_json_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_json = ['prettier']
  let g:vim_json_syntax_conceal = 0

  autocmd FileType typescript,typescript.tsx setl omnifunc=TSOmniFunc
  let g:nvim_typescript#max_completion_detail=50
  let g:nvim_typescript#completion_mark=''
  let g:nvim_typescript#javascript_support=1
  let g:nvim_typescript#expand_snippet=0
  " let g:nvim_typescript#vue_support=1
  let g:nvim_typescript#diagnostics_enable=1

  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader>gd :TSDoc <cr>
  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader>gt :TSType <cr>
  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader>gtd :TSTypeDef <cr>
  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader>@ :Denite -buffer-name=TSDocumentSymbol TSDocumentSymbol <cr>
  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader># :Denite -buffer-name=TSWorkspaceSymbol TSWorkspaceSymbol <cr>
  autocmd FileType typescript,typescript.tsx,javascript map <silent> <leader>ti :TSImport <cr>
  autocmd FileType typescript,typescript.tsx,javascript nnoremap <m-Enter> :TSGetCodeFix<CR>

  " nnoremap <silent> <leader>gt :call CocAction('doHover') <cr>
  " nnoremap <silent> <leader>gtd <Plug>(coc-type-definition) <cr>
  " nnoremap <silent> <leader>gd :call <SID>show_documentation()<CR>
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  " function! s:show_documentation()
  "   if (index(['vim','help'], &filetype) >= 0)
  "     execute 'h '.expand('<cword>')
  "   else
  "     call CocAction('doHover')
  "   endif
  " endfunction
  " autocmd FileType typescript,typescript.tsx,javascript nmap <m-Enter> <Plug>(coc-codeaction)
  " nmap <leader>rn <Plug>(coc-rename)

  let g:neomake_typescript_enabled_makers = []
  " let g:neomake_typescript_enabled_makers = ['nvim_ts']
  let g:neomake_vue_enabled_makers = []
  let g:neoformat_typescript_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_typescript = ['prettier']
  let g:nvim_typescript#kind_symbols = {
      \ 'keyword': 'keyword',
      \ 'class': '',
      \ 'interface': '',
      \ 'script': 'script',
      \ 'module': '',
      \ 'local class': 'local class',
      \ 'type': '',
      \ 'enum': '',
      \ 'enum member': '',
      \ 'alias': '',
      \ 'type parameter': 'type param',
      \ 'primitive type': 'primitive type',
      \ 'var': '',
      \ 'local var': '',
      \ 'property': '',
      \ 'let': '',
      \ 'const': '',
      \ 'label': 'label',
      \ 'parameter': 'param',
      \ 'index': 'index',
      \ 'function': '',
      \ 'local function': 'local function',
      \ 'method': '',
      \ 'getter': '',
      \ 'setter': '',
      \ 'call': 'call',
      \ 'constructor': '',
      \}


  let s:menus.typescript = {
    \ 'description' : 'typescript commands',
    \}
  let s:menus.typescript.command_candidates = [
    \['Get Type', 'TSType' ],
    \['Get Doc', 'TSDoc'],
    \['Edit Project Config', 'TSEditConfig'],
    \['Restart Server', 'TSRestart'],
    \['Start Server', 'TSStart'],
    \['Stop Server', 'TSStop'],
    \]



" }}}

" Snipppets -----------------------------------------------------------------{{{

" Enable snipMate compatibility feature.
  let g:neosnippet#enable_completed_snippet=0
  let g:neosnippet#enable_snipmate_compatibility=0
  " let g:neosnippet#enable_conceal_markers=0
  " let g:neosnippet#snippets_directory='~/GitHub/ionic-snippets'
  " let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
"   imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: pumvisible() ? "\<C-n>" : "\<TAB>"
"   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: "\<TAB>"

"}}}

" Code formatting -----------------------------------------------------------{{{

" ,f to format code, requires formatters: read the docs
"
  noremap <silent> <leader>f :Neoformat<CR>
  let g:standard_prettier_settings = {
              \ 'exe': 'prettier',
              \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
              \ 'stdin': 1,
              \ }
  let g:neoformat_vue_prettier = {
              \ 'exe': 'vue-formatter',
              \ 'stdin': 1,
        \}
              " \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
    let g:neoformat_zsh_shfmt = {
              \ 'exe': 'shfmt',
              \ 'args': ['-i ' . shiftwidth()],
              \ 'stdin': 1,
              \ }
  let g:neoformat_enabled_zsh = ['shfmt']

" }}}



call leaderGuide#register_prefix_descriptions(',', 'g:lmap')
nnoremap <silent> <Leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual ','<CR>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
let g:airline_powerline_fonts=1
