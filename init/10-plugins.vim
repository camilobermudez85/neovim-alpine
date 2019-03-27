call plug#begin('~/.local/share/nvim/plugged')

Plug 'camilobermudez85/vim-myhelp'
Plug 'sjbach/lusty'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'scrooloose/nerdtree'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'machakann/vim-highlightedyank'
Plug 'takac/vim-hardtime'
Plug 'vim-scripts/gitignore'

call plug#end()
