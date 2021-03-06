if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \ 'windows' : 'tools\\update-dll-mingw',
      \ 'cygwin': 'make -f make_cygwin.mak',
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
      \ } }

" Fuzzy search
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'mileszs/ack.vim'

" colorscheme
NeoBundle 'altercation/vim-colors-solarized'

" whitespaces
NeoBundle 'bronson/vim-trailing-whitespace'

" comments
NeoBundle 'tpope/vim-commentary'

" file browsing
NeoBundle 'scrooloose/nerdtree'

" syntax checker
NeoBundle 'scrooloose/syntastic'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'airblade/vim-gitgutter'

" shell
NeoBundle 'tpope/vim-dispatch'

" Editing
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'godlygeek/tabular'

" Tags
NeoBundle 'vim-scripts/AutoTag'
NeoBundle 'majutsushi/tagbar'

" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Programming languages
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'derekwyatt/vim-scala'

" File types
NeoBundle 'tpope/vim-markdown'
NeoBundle 'ajf/puppet-vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'


call neobundle#end()

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" Enable detection, plugins and indenting in one step
filetype plugin indent on


" General settings =============================================================

set number
set showcmd
set showmode
set showmatch
set hidden
set autoread
set autowriteall
set splitbelow splitright
set lazyredraw
set mouse=a
set pastetoggle=<F2>
set nrformats-=octal
set fileformats="unix,dos,mac"
set switchbuf=useopen
set history=100
set viminfo='20,\"80
set shell=/bin/bash
"set ruler
"set colorcolumn=81
"set cursorline

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set binary
set bomb

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn backup off
set nobackup
set noswapfile
set nowritebackup

" Highlighting
syntax on
set background=dark
set t_Co=256
set t_ut=
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Text display settings
set wrap
set showbreak=...
set linebreak
set linespace=4
set whichwrap+=h,l,<,>,[,]

" Don't show invisible characters
set nolist
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Indenting
set autoindent
set copyindent
set shiftround

" Scrolling
set scrolloff=10
set scrolljump=3
set sidescrolloff=10
set sidescroll=1

" Folding
set foldmethod=indent
set foldnestmax=5
set foldlevel=5
set foldcolumn=0
set foldlevelstart=99
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo " which commands trigger auto-unfold

" Turn bells off
set novisualbell
set noerrorbells

" Auto complete
set completeopt=longest,menuone
set wildmode=list:longest,full
set wildmenu
set wildignore=*~,*.o,*.a,*.so,*.bak,*.pyc,*.class,*.db,*.sqlite
set wildignore+=*.gem,*.jar,*.zip,*.gz
set wildignore+=.git,.hg,.svn
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.png,*.jpg,*.gif,*.ico,*.bmp,*.pdf


" Status line ==================================================================
" always a status line
set laststatus=2

hi User1 ctermbg=Black ctermfg=Green cterm=bold
hi User2 ctermbg=Black ctermfg=DarkGreen
hi User3 ctermbg=Black ctermfg=White cterm=bold
hi User4 ctermbg=Black ctermfg=Green

set statusline=

" git current branch
set statusline+=%1*\ %{fugitive#head()}\ %*

" tail of the filename
set statusline+=%2*\ %f\ %*

" flags
set statusline+=%3*
set statusline+=%H  " help file flag
set statusline+=%M  " modified flag
set statusline+=%R  " read only flag
set statusline+=\ %*

" syntastic error sign
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" left/right separator
set statusline+=%2*%=

set statusline+=%4*
set statusline+=\ %4*
set statusline+=%{strlen(&fenc)?&fenc:&enc} " encoding
set statusline+=\ \|\ %4*
set statusline+=%{strlen(&ft)?&ft:'none'}   " filetype
set statusline+=\ \|\ %4*

" document details
set statusline+=%4*
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set statusline+=\ %*


" Shortcuts ====================================================================

" Map leader to ,
" let mapleader=','

nnoremap ; :

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

" Quickly get out of insert mode without your fingers having to leave the home row
inoremap jj <Esc>

" Make possible to navigate within lines of wrapped lines
nnoremap j gj
nnoremap k gk
set fo=l

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" Switch to previous split
nnoremap <leader>l <C-w>p

" Maximize current split
nnoremap <Leader>m <C-w>_<C-w><Bar>

" Complete whole filenames/lines with a quicker shortcut key in insert mode
imap <C-f> <C-x><C-f>
imap <C-l> <C-x><C-l>

" Quick yanking to the end of the line
nmap Y y$

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Pull word under cursor into LHS of a substitute (for quick search and replace)
nmap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quit all, very useful in vimdiff
nnoremap Q :qa!<cr>

" Index ctags from any project
map <leader>ct :!ctags -R .<CR>

" spell check
map <leader>s :set spell<CR>
"set spelllang=en_us

" make code and open the results pane
nmap <F5> :make<CR>:copen<CR>

" tabedit shortcuts
map <leader>0 :tablast<CR>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>j :tabprev<CR>
map <leader>k :tabnext<CR>
map <C-t> <ESC>:tabnew<CR>
"map <C-o> :tabonly<CR>


" Plugins settings =============================================================

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = ' Syntax: line:%F (%t) '

" ack
let g:ackprg="ack --with-filename --nocolor --nogroup --nopager --column --no-log"
nnoremap <leader>a :Ack
" search for word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>"

" dispatch
nnoremap <F6> :Dispatch<CR>

" tagbar
nnoremap <F7> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
"let g:tagbar_autopreview = 1

" NerdTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
nnoremap <F9> :NERDTreeToggle<CR>
noremap <silent> <F10> :NERDTreeFind<CR>

" commentary
map <leader>' :Commentary<CR>

" Indent lines
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Bubble single lines
nmap <Up> [e
nmap <Down> ]e

" Bubble multiple lines
vmap <Up> [egv
vmap <Down> ]egv

" Matchit: Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" supertab
let g:SuperTabDefaultCompletionType = "context"

" unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'tmp/',
      \ '.sass-cache',
      \ ], '\|'))

nnoremap <leader>p :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer  buffer<cr>

" ragtag
let g:ragtag_global_maps = 1

" golang
let g:go_bin_path = expand("~/bin")
let g:go_fmt_command = "goimports"
let g:go_dispatch_enabled = 1

" tagbar
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }


" Whitespaces ==================================================================
nmap <silent> <Leader><space> :FixWhitespace<CR>

" Quickfix window (open/close using F12) =======================================
nmap <silent> <F12> :QFix<CR>

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Restore cursor position ======================================================
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" Filetypes ====================================================================
au BufRead,BufNewFile,BufWrite nginx.*    setf nginx
au BufRead,BufNewFile,BufWrite *.json     setf javascript
au BufRead,BufNewFile,BufWrite afiedt.buf setf sql
au BufRead,BufNewFile,BufWrite .dir_colors,.dircolors,/etc/DIR_COLORS setf dircolors
au BufRead,BufNewFile,BufWrite {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Capfile,config.ru,.caprc,.irbrc,*.rake} setf ruby
au BufRead,BufNewFile,BufWrite {*.json,,*.py,*.coffee,*.yaml,*.yml} set foldmethod=indent

" Golang
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

