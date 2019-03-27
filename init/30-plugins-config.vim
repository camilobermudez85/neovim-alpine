" Airline theme
set noshowmode " don't repeat status bar
let g:airline_theme = "jellybeans"
"let g:airline_theme = "base16"
"let g:airline_theme = "cobalt2"
"let g:airline_theme = "distinguished"
let g:airline_powerline_fonts = 1
set guifont=Monaco:h10

" Color scheme configuration
set termguicolors
set background = "dark"
colorscheme jellybeans

" NERDTree
"nnoremap - :Explore %:p:h<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeHijackNetrw = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

let g:CommandTAlwaysShowDotFiles = 1
