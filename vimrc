source ~/.vim/vundle.vim

" Filetypes
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

let mapleader=','

scriptencoding utf8
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8
set nobomb

set showmatch matchpairs+=<:>
runtime macros/matchit.vim

set confirm

set incsearch hls ignorecase smartcase

set formatoptions=tcwqn2
set colorcolumn=80,120

set lazyredraw
set showcmd

set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:·
set list

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*/.git/*,*/.hg/*,*/.svn/*

set diffopt+=iwhite

set history=1000 undolevels=1000

set nowrap wrapscan showbreak=..

set title

set number relativenumber numberwidth=5

set autoread autowrite

set switchbuf=newtab
set tabpagemax=20

set cursorline

set tag=

set complete=.,w,b,u,U,i,d
set completeopt=menu,menuone,longest,preview

set timeoutlen=3000
set ttimeoutlen=50

set iskeyword+=-

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse= ttymouse=xterm2

if has("gui_running")
  set guioptions-=T
  set linespace=2
  set lines=999
  set columns=9999
endif

set statusline=[%n]\ %<%.55f\ %h%w%m%r%y
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=[%c,%l/%L\|%P\|%{GetFileSize()}]
set laststatus=2

function! GetFileSize()
  let filesize = getfsize(expand('%:p'))
  if filesize < 0
    return "-1"
  elseif filesize < 1024
    return filesize."b"
  elseif filesize >= 1048576
    return printf("%.2f", (filesize/1048576.00))."Mb"
  else
    return printf("%.2f", (filesize/1024.00))."Kb"
  endif
endfunction

if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark

  if !empty(globpath(&rtp, "colors/solarized.vim"))
    colorscheme solarized
    hi! link SpecialKey Comment
    hi! link NonText Comment
  endif
endif

" Folding
set foldmethod=manual
noremap <F3> zM
noremap <F4> zR
nnoremap <space> za

" Make Y consistent with C and D
nnoremap Y y$

function! TrimFunc()
  normal mz
  normal Hmy
  %s/\s\+$//e
  call histdel("search", -1)
  normal 'yzt
  normal `z
  delm z y
endfunction
autocmd BufWritePre * call TrimFunc()

" Full file indent
function! IndentAllFile()
  normal mz
  normal Hmy
  normal gg=G
  normal 'yzt
  normal `z
  delm z y
endfunction

noremap ,ff :call IndentAllFile()<CR>

" Make <C-l> clear the highlight
nnoremap <C-L> :nohls<CR>:set hls?<CR>

" Show all buffers
nnoremap <silent> ,ls :ls!<CR>
" Delete current buffer
nnoremap <silent> ,bd :bd!<CR>
" Delete all buffers
nnoremap <silent> ,da :exec "1," . bufnr('$') . "bd"<CR>
" Toogle list characters
nnoremap <silent> ,ll :set invlist<CR>:set list?<CR>

" Tabstop 2 to that filetypes
autocmd FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript set
      \ autoindent
      \ copyindent
      \ cindent
      \ smartindent
      \ tabstop=2
      \ shiftwidth=2
      \ softtabstop=2
      \ expandtab
      \ smarttab
      \ shiftround

" Spell
set spelllang=en,pt
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=

autocmd FileType tex,txt,mail,text,markdown set textwidth=80
autocmd Filetype gitcommit set textwidth=72
autocmd FileType tex,txt,mail,text,markdown,gitcommit setlocal
      \ spell
      \ formatoptions+=a

" Sorting selected text
vnoremap ,ss :sort<CR>
