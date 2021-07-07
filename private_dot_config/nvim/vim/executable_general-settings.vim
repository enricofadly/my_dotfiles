" Set settings
" ----------------------------------------------------------
let g:mapleader = ';'                   " My preferred map leader
set autoread
set number               " Numberline for vim
set splitbelow splitright               " Change default split behavior
set cursorline                          " Show where my cursor position
hi CursorLine     ctermbg=8 guibg=#2D2C29
set wildmode=list:longest,full          " Idk i just put this shit
set noswapfile                          " No swapfile
set mouse=a                             " Enable mouse support
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nohlsearch                          " Disable highlight search so it doesnt conflict with other search tools
set undofile                            " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.config/nvim/undo_dir     " Undo directoryset smartcase
set textwidth=75
set tabstop=2
set shiftwidth=2
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab
let g:vim_json_syntax_conceal = 0       " Disable indentline on json
set noshowmode
set showmatch
set colorcolumn=99999

" Neovim indent-blankline configuration
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
" ----------------------------------------------------------

" Custom keybindings
" ----------------------------------------------------------
" Buffer 
nnoremap <silent><nowait> ;jb :JABSOpen<CR>
" Packer sync
nnoremap <silent><nowait> ;pc :PackerSync<CR>
" Mapping to codi
nnoremap <silent><nowait> ;cd :Codi<CR>
nnoremap <silent><nowait> ;c! :Codi!<CR>

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 200
cnoremap jk <ESC>
autocmd FileType text,markdown call setbufvar(bufnr("%"), 'easyescape_disable', 1)

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
map <C-w>d :bdelete!<CR>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" ----------------------------------------------------------

" UI settings
" ----------------------------------------------------------
colorscheme dracula " Dracula color scheme
set encoding=UTF-8
set termguicolors   " Enable gui colors for vim

" Vim airlines configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
" ----------------------------------------------------------
