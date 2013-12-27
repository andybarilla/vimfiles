if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Tools
NeoBundle 'L9'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kassio/ack.vim'
NeoBundle 'kassio/vim-session_manager'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'

" Snippets
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'kassio/my-snippets'

" HTML, javascript
NeoBundle 'othree/html5.vim'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Colorscheme
NeoBundle 'altercation/vim-colors-solarized'

" tmux
NeoBundle 'kassio/vim-tmux-runner'

" tomdoc
NeoBundle 'duwanis/tomdoc.vim'

filetype plugin indent on
NeoBundleCheck