if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" ----------------------------------------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf fuzzy finder
Plug 'junegunn/vim-easy-align'                      " Align multiple line easier
Plug 'junegunn/fzf.vim'                             " Fzf integration in vim
Plug 'tpope/vim-sensible'                           " Sane vim default
Plug 'tpope/vim-surround'                           " Surrounding word/WORD easier
Plug 'tpope/vim-repeat'                             " Enable to repeat the map keybind
Plug 'vim-airline/vim-airline'                      " Plugin for statusline/tabline
Plug 'vim-airline/vim-airline-themes'               " Plugin for themes
Plug 'preservim/nerdcommenter'                      " Make commenting become easier
Plug 'preservim/nerdtree'                           " File explorer system for vim
Plug 'luochen1990/rainbow'                          " Bracket pair colorizer
Plug 'wellle/targets.vim'                           " Add various text objects to give you more targets to operate on
Plug 'dracula/vim', { 'as': 'dracula' }             " Dracula color scheme
Plug 'mhinz/vim-startify'                           " Change default vim startup
Plug 'ryanoasis/vim-devicons'                       " Add icon to vim
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Plugin for nerdtree showing git status flags
Plug 'PhilRunninger/nerdtree-visual-selection'      " Defines commands that will work on files inside a visual selection
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " Add syntax highlight and icon to nerdtree
Plug 'farmergreg/vim-lastplace'                     " Intelligently reopen files at your last edit position
Plug 'Yggdroot/indentLine'                          " Plugin to display the indention levels with thin vertical lines
Plug 'haya14busa/is.vim'                            " Improved Incsearch
Plug 'easymotion/vim-easymotion'                    " Motion utilities for vim
Plug 'justinmk/vim-sneak'                           " Sneak 2 characters motion
Plug 'zhou13/vim-easyescape'                        " Make escape keys easier

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" ----------------------------------------------------------


" Custom keybindings
" ----------------------------------------------------------
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 200
cnoremap jk <ESC>
autocmd FileType text,markdown call setbufvar(bufnr("%"), 'easyescape_disable', 1)
" ----------------------------------------------------------

" UI settings
" ----------------------------------------------------------
colorscheme dracula " Dracula color scheme
set termguicolors   " Enable gui colors for vim

" Vim airlines configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
" ----------------------------------------------------------


" Set settings
" ----------------------------------------------------------
set noshowmode                 " Disable statusline below airline
set number relativenumber      " Numberline for vim
set cursorline                 " Show where my cursor position
set wildmode=list:longest,full " Idk i just put this shit
set showcmd                    " Show what command do we type
set ruler                      " Set ruler option to see where my cursor at
let g:rainbow_active = 1       " Enable rainbow plugin
" ----------------------------------------------------------


" Vim easy align configuration
" ----------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" ----------------------------------------------------------


" Vim nerdcommenter configuration
" ----------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1 " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*    /' } }
"Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ----------------------------------------------------------


" Vim nerdtree plugin configuration
" ----------------------------------------------------------
"  nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Keybind for nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n>     :NERDTree<CR>
nnoremap <C-t>     :NERDTreeToggle<CR>
" nnoremap <C-f>     :NERDTreeFind<CR>
" ----------------------------------------------------------


" Fzf.vim integration
" ----------------------------------------------------------
" Keybinding for fzf.vim commands
" let g:fzf_layout = { 'down': '50%' }

" Replace grep built in to ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Ripgrep preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Fzf preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Word completion with custom spec with popup layout option
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" ----------------------------------------------------------

  
" EasyMotion configuration
" ----------------------------------------------------------
" Pre-default easy motion binding
map <Leader> <Plug>(easymotion-prefix)

" Disable shade when search
let g:EasyMotion_do_shade = 0

" Default bindings
let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Mapping to do 2 character search
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)

" " Mapping to do multi char search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 0

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" ----------------------------------------------------------


" Vim sneak configuration
let g:sneak#label = 1 " Enable easymotion like label

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" ----------------------------------------------------------


