let mapleader = " "

" Open cheat-sheet
nnoremap <leader>h :vert help myhelp<CR>

nnoremap zs :setlocal foldmethod=syntax
nnoremap zm :setlocal foldmethod=manual

" Vimagit
nnoremap <leader>m :Magit<CR>

" NERDTree
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <c-p> :e .<CR>

" Ack
nnoremap <leader>a <Esc>:Ack 

" Normal mode disabled keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <esc> <nop>
nnoremap <home> <nop>
nnoremap <end> <nop>
nnoremap <del> <nop>
nnoremap <h> <nop>
nnoremap <l> <nop>

" Insert mode disabled keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>
inoremap <home> <nop>
inoremap <end> <nop>
inoremap <del> <nop>
