" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

set encoding=UTF-8

" source - https://github.com/junegunn/vim-plug/issues/812#issuecomment-496619023
set rtp +=~/.config/nvim

" ensure vim-plug is installed and then load it
call plug#begin('~/.config/nvim/plugged')

" General {{{
" Abbreviations
" abbr funciton function
abbr teh the
" abbr tempalte template
" abbr fitler filter
abbr cosnt const
" abbr attribtue attribute
" abbr attribuet attribute

set autoread " detect when a file is changed

set history=1000 " change history to 1000
set textwidth=120

set relativenumber

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
endif

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

if has('mouse')
    set mouse=a
endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" }}}

" Appearance {{{
set number " show line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set shell=$SHELL
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set signcolumn=yes
set shortmess+=c

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab

" code folding settings
set foldmethod=indent " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" toggle invisible characters
set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" let g:indentLine_setColors=0
let g:indentLine_char_list=['│', '│', '│', '│']


" Plug 'Yggdroot/indentLine'
" 
" Plug 'szw/vim-maximizer'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'

" *******************
" the following stuff has been commented and moves to ~/.config/nvim/colorscheme.vim
" ******************
"
" source ~/.config/nvim/colorscheme.vim
"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Load colorschemes
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'iCyMind/NeoSolarized'

Plug 'Yggdroot/indentLine'

Plug 'szw/vim-maximizer'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'



" have to put this inside liteline
"         \   'colorscheme': 'ayu',

" LightLine {{{
    Plug 'itchyny/lightline.vim'
    Plug 'nicknisi/vim-base16-lightline'
    let g:lightline = {
        \   'colorscheme': 'ayu',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \               [ 'gitbranch' ],
        \               [ 'readonly', 'filetype', 'filename' ]],
        \       'right': [ [ 'percent' ], [ 'lineinfo' ],
        \               [ 'fileformat', 'fileencoding' ],
        \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
        \   },
        \   'component_expand': {
        \   },
        \   'component_type': {
        \       'readonly': 'error',
        \       'linter_warnings': 'warning',
        \       'linter_errors': 'error'
        \   },
        \   'component_function': {
        \       'fileencoding': 'helpers#lightline#fileEncoding',
        \       'filename': 'helpers#lightline#fileName',
        \       'fileformat': 'helpers#lightline#fileFormat',
        \       'filetype': 'helpers#lightline#fileType',
        \       'gitbranch': 'helpers#lightline#gitBranch',
        \       'cocstatus': 'coc#status',
        \       'currentfunction': 'helpers#lightline#currentFunction',
        \       'gitblame': 'helpers#lightline#gitBlame'
        \   },
        \   'tabline': {
        \       'left': [ [ 'tabs' ] ],
        \       'right': [ [ 'close' ] ]
        \   },
        \   'tab': {
        \       'active': [ 'filename', 'modified' ],
        \       'inactive': [ 'filename', 'modified' ],
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '', 'right': '' }
    \ }
" }}}
" }}}

" General Mappings {{{
" set a map leader for more key combos
let mapleader = "\<Space>"

" remap esc
inoremap jj <esc>

" shortcut to save
nmap <leader><leader> :w<cr>

" set paste toggle
set pastetoggle=<leader>v

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <leader>c :set hlsearch! hlsearch?<cr>

" vim maximizer
nmap <leader>m :MaximizerToggle<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" remove extra whitespace
nmap <leader>, :%s/\s\+$<cr>
nmap <leader>,, :%s/\n\{2,}/\r\r/g<cr>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nmap <leader>l :set list!<cr>

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

map <silent> <C-h> <Plug>WinMoveLeft
map <silent> <C-j> <Plug>WinMoveDown
map <silent> <C-k> <Plug>WinMoveUp
map <silent> <C-l> <Plug>WinMoveRight

nmap <leader>z <Plug>Zoom

map <leader>wc :wincmd q<cr>

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>


" Custom text objects

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

" Interesting word mappings
nmap <leader>0 <Plug>ClearInterestingWord
nmap <leader>1 <Plug>HiInterestingWord1
nmap <leader>2 <Plug>HiInterestingWord2
nmap <leader>3 <Plug>HiInterestingWord3
nmap <leader>4 <Plug>HiInterestingWord4
nmap <leader>5 <Plug>HiInterestingWord5
nmap <leader>6 <Plug>HiInterestingWord6
" }}}

" AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
"    " save all files on focus lost, ignoring warnings about untitled buffers
"    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd FileType qf nmap <buffer> q :q<cr>
augroup END
" }}}

" General Functionality {{{
" better terminal integration
" substitute, search, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" search inside files using ripgrep. This plugin provides an Ack command.
Plug 'wincent/ferret'

" easy commenting motions
Plug 'tpope/vim-commentary'

" mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-unimpaired'

" endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-ragtag'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat'

" .editorconfig support
Plug 'editorconfig/editorconfig-vim'

" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'AndrewRadev/splitjoin.vim'

" add end, endif, etc. automatically
Plug 'tpope/vim-endwise'

" detect indent style (tabs vs. spaces)
Plug 'tpope/vim-sleuth'

" Startify: Fancy startup screen for vim {{{
    Plug 'mhinz/vim-startify'

    " Don't change to directory when selecting a file
    let g:startify_files_number = 5
    let g:startify_change_to_dir = 0
    let g:startify_custom_header = [ ]
    let g:startify_relative_path = 1
    let g:startify_use_env = 1

    " Custom startup list, only show MRU from current directory/project
    let g:startify_lists = [
    \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
    \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
    \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
    \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
    \  { 'type': 'commands',  'header': [ 'Commands' ]       },
    \ ]

    let g:startify_commands = [
    \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
    \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
    \ ]

    let g:startify_bookmarks = [
        \ { 'c': '~/.config/nvim/init.vim' },
        \ { 'g': '~/.gitconfig' },
        \ { 'z': '~/.bash_profile' }
    \ ]

    autocmd User Startified setlocal cursorline
    nmap <leader>st :Startify<cr>
" }}}

" Close buffers but keep splits
Plug 'moll/vim-bbye'
nmap <leader>b :Bdelete<cr>

" Writing in vim {{{{
    Plug 'junegunn/goyo.vim'

    let g:goyo_height = '100%'
    let g:goyo_width = 122

    autocmd! User GoyoEnter nested call helpers#goyo#enter()
    autocmd! User GoyoLeave nested call helpers#goyo#leave()

    nmap <silent> <leader>a :Goyo<cr>
" }}}

" context-aware pasting
Plug 'sickill/vim-pasta'

" NERDTree {{{
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:WebDevIconsOS = 'Darwin'
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1
    let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
    let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
    let NERDTreeNodeDelimiter = "\u263a" " smiley face

    augroup nerdtree
        autocmd!
        autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
        autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
    augroup END

    " Toggle NERDTree
    function! ToggleNerdTree()
        if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
            :NERDTreeFind
        else
            :NERDTreeToggle
        endif
    endfunction
    " toggle nerd tree
    nmap <silent> <leader>n :call ToggleNerdTree()<cr>
    " find the current file in nerdtree without needing to reload the drawer
    nmap <silent> <leader>y :NERDTreeFind<cr>

    let NERDTreeShowHidden=1
    " let NERDTreeDirArrowExpandable = '▷'
    " let NERDTreeDirArrowCollapsible = '▼'
    let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

    function! StartUp()
        if 0 == argc()
            NERDTreeToggle
        end
    endfunction

    autocmd VimEnter * call StartUp()
    autocmd VimEnter * wincmd p " source - https://stackoverflow.com/a/24809018/9406420

    Plug 'ryanoasis/vim-devicons'
" }}}

" FZF {{{
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'down': '~25%' }

    if isdirectory(".git")
        " if in a git project, use :GFiles
        nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
    else
        " otherwise, use :FZF
        nmap <silent> <leader>t :FZF<cr>
    endif

    nmap <silent> <leader>s :GFiles?<cr>

    nmap <silent> <leader>r :Buffers<cr>
    nmap <silent> <leader>e :FZF<cr>
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <silent> <Leader>C :call fzf#run({
    \   'source':
    \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
    \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
    \   'sink':    'colo',
    \   'options': '+m',
    \   'left':    30
    \ })<CR>

    command! FZFMru call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '40%'})

    command! -bang -nargs=* Find call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
        \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir GitFiles
        \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
" }}}

" vim-fugitive {{{
    Plug 'tpope/vim-fugitive'
    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>

    Plug 'tpope/vim-rhubarb' " hub extension for fugitive
    Plug 'junegunn/gv.vim'
    Plug 'sodapopcan/vim-twiggy'
" }}}

" UltiSnips {{{
    Plug 'SirVer/ultisnips' " Snippets plugin
    let g:UltiSnipsExpandTrigger="<C-l>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" }}}

" coc {{{
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-git',
    \ 'coc-eslint',
    \ 'coc-tslint-plugin',
    \ 'coc-pairs',
    \ 'coc-emoji',
    \ 'coc-sh',
    \ 'coc-vimlsp',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-ultisnips',
    \ 'coc-rls',
    \ 'coc-sh'
    \ ]

    "autocmd CursorHold * silent call CocActionAsync('highlight')

    " coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    nmap <leader>f :CocCommand prettier.formatFile<cr>

    " coc-git
    nmap [g <Plug>(coc-git-prevchunk)
    nmap ]g <Plug>(coc-git-nextchunk)
    nmap gs <Plug>(coc-git-chunkinfo)
    nmap gu :CocCommand git.chunkUndo<cr>

    "remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh <Plug>(coc-doHover)

    " diagnostics navigation
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " rename
    nmap <silent> <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " organize imports
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    "tab completion
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
" }}}
" }}}

" Language-Specific Configuration {{{
" html / templates {{{
    " emmet support for vim - easily create markdup wth CSS-like syntax
    Plug 'mattn/emmet-vim'

    " match tags in html, similar to paren support
    Plug 'gregsexton/MatchTag', { 'for': 'html' }

    " html5 support
    Plug 'othree/html5.vim', { 'for': 'html' }

    " mustache support
    Plug 'mustache/vim-mustache-handlebars'

    " pug / jade support
    Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }

    " nunjucks support
    Plug 'niftylettuce/vim-jinja', { 'for': 'njk' }
" }}}

" JavaScript {{{
    Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
    " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
    Plug 'moll/vim-node', { 'for': 'javascript' }
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    Plug 'MaxMEllon/vim-jsx-pretty'
    let g:vim_jsx_pretty_highlight_close_tag = 1
" }}}

" TypeScript {{{
    Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
    " Plug 'Shougo/vimproc.vim', { 'do': 'make' } TODO what still needs this?
" }}}


" Styles {{{
    Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
    Plug 'groenewege/vim-less', { 'for': 'less' }
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'stephenway/postcss.vim', { 'for': 'css' }
" }}}

" markdown {{{
    Plug 'tpope/vim-markdown', { 'for': 'markdown' }
    let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

    " Open markdown files in Marked.app - mapped to <leader>m
    Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
    nmap <leader>md :MarkedOpen!<cr>
    nmap <leader>mdq :MarkedQuit<cr>
    nmap <leader>* *<c-o>:%s///gn<cr>
" }}}

" JSON {{{
    Plug 'elzr/vim-json', { 'for': 'json' }
    let g:vim_json_syntax_conceal = 0
" }}}

Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_term_mode = "split"
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

Plug 'timcharper/textile.vim', { 'for': 'textile' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'ekalinin/Dockerfile.vim'

Plug 'kien/ctrlp.vim'

Plug 'kshenoy/vim-signature'
" }}}

call plug#end()

nnoremap <Leader>o :CtrlPMRUFiles<CR>
nnoremap <Leader>p :CtrlP<CR>
let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*|.*/node_modules'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_mruf_relative = 1

" *******************
" the following stuff has been commented and moves to ~/.config/nvim/colorscheme.vim
" ******************
"
"  Colorscheme and final setup {{{
"    " This call must happen after the plug#end() call to ensure
"    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        " let g:onedark_termcolors=16
        " let g:onedark_terminal_italics=1
        " colorscheme onedark
        " let ayucolor="light"  " for light version of theme
        let ayucolor="mirage" " for mirage version of theme
        " let ayucolor="dark"   " for dark version of theme
        colorscheme ayu

        " set background=light
        " colorscheme NeoSolarized

        " set background=dark
        " set background=light
        " colorscheme PaperColor

        " colorscheme nord

    endif
    syntax on
    filetype plugin indent on
    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
    " highlight Type cterm=italic term=italic gui=italic

    hi Normal guibg=NONE ctermbg=NONE
    " highlight Normal ctermbg=none
" }}}
"


inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" vim:set foldmethod=marker foldlevel=0


" visual-increment.vim - easily create increasing sequence of numbers or letters
" via visual mode
" Author: Triglav <trojhlav@gmail.com>
" Home: https://github.com/triglav/vim-visual-increment

" exit if the plugin is already loaded or disabled or when 'compatible' is set
if (exists("g:loaded_visual_increment") && g:loaded_visual_increment) || &cp
  finish
endif
let g:loaded_visual_increment = 1

let s:cpo_save = &cpo
set cpo&vim

" a:step - increment step, default 1
" a:1 - default null, when set to any value, decrement instead
function! s:doincrement(step, ...)
  " visual block start
  let start_column = col("'<")
  let start_row = line("'<")
  " visual block end, as well as the cursor position
  let end_row = line("'>")
  " when 2nd parameter is passed, we are decrementing the numbers instead
  let incrementer = (a:0 > 0 ? '' : '')

  if start_row == end_row
    " just increment/decrement the value if only one line is selected
    exe "normal! ".a:step.incrementer
  else
    " each next line is increased by <a>, from the previous one
    let i = 0
    while line('.') != end_row
      " move to the next line
      call setpos('.', [0, line('.')+1, start_column, 0])
      " if the current line is shorter, skip it
      if start_column < col("$")
        let i += a:step
        " increment the current line by <i>
        exe "normal! ".i.incrementer
      end
    endwhile
  endif
endfunction

vnoremap <silent> <Plug>VisualIncrement :<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <Plug>VisualDecrement :<C-U>call <SID>doincrement(v:count1, 1)<CR>

if !hasmapto("<Plug>VisualIncrement")
  vmap <C-A>  <Plug>VisualIncrement
endif
if !hasmapto("<Plug>VisualDecrement")
  vmap <C-X>  <Plug>VisualDecrement
endif

let &cpo = s:cpo_save


" extra features for now
source ~/.config/nvim/extra.vim


" bash language server, needed for coc-sh
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" cursor color according to ayutheme
" highlight Cursor guifg=black guibg=#ffcc66

" source - https://stackoverflow.com/a/37720708/9406420
" hi Normal guibg=NONE ctermbg=NONE
hi Normal guibg=NONE

" for menu completion like 
" {{{{
  
  set wildmenu
  set wildmode=longest:full,full
  
  " for comfortable arrow navigation
  " source - https://vi.stackexchange.com/questions/22627/switching-arrow-key-mappings-for-wildmenu-tab-completion
  set wildcharm=<C-Z>
  cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
  cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
  cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
  cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
  cnoremap <expr> <CR> wildmenumode() ? " \<bs>\<C-Z>" : "\<CR>"
  
" }}}}


" for JSX  support
" Plug 'pangloss/vim-javascript'
Plug 'pangloss/vim-javascript'


noremap <silent> <Leader>f :FZF -i<CR>

