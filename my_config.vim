set nocompatible " No VI compatibility
set autoread " Detect file changes outside vim
"
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
"Plug 'wincent/command-t'
Plug 'ctrlpvim/ctrlp.vim' " Fast file opening
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate' " Auto insert paired characters
"Plun 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
Plug 'unblevable/quick-scope'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
"Plun 'pangloss/vim-javascript'
Plug 'jlanzarotta/bufexplorer'
Plug 'jwhitley/vim-matchit', {'for': 'html'}
Plug 'terryma/vim-multiple-cursors'
"Plug '0x0dea/vim-molasses'
Plug 'tpope/vim-repeat' " Repeat last command with .
Plug 'tpope/vim-unimpaired' " Additional paired mappings
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript'  }
Plug 'groenewege/vim-less', { 'for': 'less'  }
Plug 'ap/vim-css-color', { 'for': 'css'  }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css'  }
Plug 'https://github.com/gorodinskiy/vim-coloresque.git'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'sickill/vim-monokai'

" All of your Plugins must be added before the following line
call plug#end()

set hidden " Some kind of buffer tweak
set history=1000
set undolevels=1000
set title " Set title of the window
set clipboard=unnamed " Use OS clipboard
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set lazyredraw
set ttyfast
set showmatch " Highlight matching pair
set nobackup " Disable swapfiles
set nowritebackup
set noswapfile
set listchars=eol:¬
set visualbell " No noise just flash

" Syntax highlighting
" ===================
" filetype on
" filetype plugin on
" filetype indent on
" set t_Co=256"

" let mapleader = ","
" let g:mapleader = ","

set so=7

set wildmenu
set ruler

set cmdheight=2

set hid

set ignorecase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

syntax enable

set background=dark

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=2
set tabstop=4

set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines


" Visual tweaks
" =============
set number " Display number on the sidebar
set relativenumber
set colorcolumn=80
set nowrap
set linebreak

"Folding
" =======
set foldmethod=indent
set foldnestmax=3
set nofoldenable

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"backspace
set backspace=2


""PLUGINS
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>



""MINE
"colorscheme monokai
" Base16
" ======
"let g:base16colorspace=256

" Colorscheme
" ===========
set background=dark
colorscheme monokai

"Remove visual delay
set timeoutlen=1000 ttimeoutlen=0


"sintastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

"syntastic ignore
let g:syntastic_html_checkers=['']
let g:syntastic_less_checkers=['']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']


"command-t
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor|bower_components|build|reports)|(\.(swp|ico|git|svn))$'

map <leader>ff :Ag 
set pastetoggle=<leader>p
set expandtab
set shiftwidth=2
set softtabstop=2
map <leader>ch :lclose<CR>
map <leader>oh :lopen<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

"Indent guide
hi IndentGuidesOdd  ctermbg=gray

"markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"
" " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬"

"keep indend on paste
":nnoremap p p`[v`]=`]`
"
:let g:notes_directories = ['~/Documents/Notes']
:set diffopt+=vertical

" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
nmap <leader>cs :let @*=expand("%")<CR>
nmap <leader>cl :let @*=expand("%:p")<CR>)

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>sc :SyntasticCheck<CR>
set autoread

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
