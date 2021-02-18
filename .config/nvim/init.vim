" Plugin will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" Declare the list of plugins.
" ----------------------------------------------------------

" Plugin to enhance vim experience
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf fuzzy finder
Plug 'junegunn/vim-easy-align'                      " Align multiple line easier
Plug 'junegunn/fzf.vim'                             " Fzf integration in vim
Plug 'junegunn/vim-peekaboo'                        " Show the register content
Plug 'tpope/vim-sensible'                           " Sane vim default
Plug 'tpope/vim-surround'                           " Surrounding word/WORD easier
Plug 'tpope/vim-repeat'                             " Enable to repeat the map keybind
Plug 'vim-airline/vim-airline'                      " Plugin for statusline/tabline
Plug 'vim-airline/vim-airline-themes'               " Plugin for themes
Plug 'preservim/nerdcommenter'                      " Make commenting become easier
Plug 'luochen1990/rainbow'                          " Bracket pair colorizer
Plug 'wellle/targets.vim'                           " Add various text objects to give you more targets to operate on
Plug 'dracula/vim', { 'as': 'dracula' }             " Dracula color scheme
Plug 'mhinz/vim-startify'                           " Change default vim startup
Plug 'ryanoasis/vim-devicons'                       " Add icon to vim
Plug 'farmergreg/vim-lastplace'                     " Intelligently reopen files at your last edit position
Plug 'Yggdroot/indentLine'                          " Plugin to display the indention levels with thin vertical lines
Plug 'easymotion/vim-easymotion'                    " Motion utilities for vim
Plug 'haya14busa/is.vim'                            " Improved Incsearch
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors Plugin for vim/neovim
Plug 'zhou13/vim-easyescape'                        " Make escape keys easier
Plug 'dstein64/vim-win'                             " Vim plugin to manage window easier
Plug 'voldikss/vim-floaterm'                        " Terminal manager for neovim
Plug 'tpope/vim-vinegar'                            " Combine with netrw to create a delicious salad dressing
Plug 'kshenoy/vim-signature'                        " Plugin to toogle, display and navigate marks
Plug 'simnalamburt/vim-mundo'                       " Vim undo tree visualizer

" Plugin for programming (linter, formatter, completion, highlighting)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" ----------------------------------------------------------


" Set settings
" ----------------------------------------------------------
set relativenumber number               " Numberline for vim
set splitbelow splitright               " Change default split behavior
set cursorline                          " Show where my cursor position
set wildmode=list:longest,full          " Idk i just put this shit
let g:rainbow_active = 1                " Enable rainbow plugin
set noswapfile                          " No swapfile
set mouse=a                             " Enable mouse support
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nohlsearch                          " Disable highlight search so it doesnt conflict with other search tools
set smartindent
set expandtab
let g:peekaboo_window = 'vert bo 90new' " Peekaboo winodw preview size
set undofile                            " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.config/nvim/undo_dir     " Undo directory
" ----------------------------------------------------------


" Custom keybindings
" ----------------------------------------------------------
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
map <C-w>d :bdelete<CR>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" ----------------------------------------------------------


" Mundo configuration
" ----------------------------------------------------------
"  Keybind to triggle mundo preview window
nnoremap ;u :MundoToggle<CR>

let g:mundo_width = 90
let g:mundo_right = 1
" ----------------------------------------------------------


" UI settings
" ----------------------------------------------------------
colorscheme dracula " Dracula color scheme
set termguicolors   " Enable gui colors for vim
set guifont=FiraCode\ Nerd\ Font\ Mono:h11

" Vim airlines configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
" ----------------------------------------------------------


" Floatterm keybind configuration
 " ----------------------------------------------------------
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_keymap_kill   = '<F5>'
let g:floaterm_width         = 0.9
let g:floaterm_height        = 0.7
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
" map <Leader> <Plug>(easymotion-prefix)

" Disable shade when search
let g:EasyMotion_do_shade = 0

" Default bindings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" 2 char search
map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)

" Before the matching search
map t <Plug>(easymotion-bd-t)

" 1 char search
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to begnning of word
" map  <Leader>w <Plug>(easymotion-bd-w)
" map <Leader>W <Plug>(easymotion-bd-W)

" Move to end of word
" map <Leader>e <Plug>(easymotion-bd-e)
" map <Leader>E <Plug>(easymotion-bd-E)

" Mapping to do multi char search
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


" Vim-win configuration
" ----------------------------------------------------------
map <Leader>v <plug>WinWin

let g:win_ext_command_map = {
      \   'c': 'wincmd c',
      \   'C': 'close!',
      \   'q': 'quit',
      \   'Q': 'quit!',
      \   '!': 'qall!',
      \   'V': 'wincmd v',
      \   'S': 'wincmd s',
      \   'n': 'bnext',
      \   'N': 'bnext!',
      \   'p': 'bprevious',
      \   'P': 'bprevious!',
      \   "\<c-n>": 'tabnext',
      \   "\<c-p>": 'tabprevious',
      \   '=': 'wincmd =',
      \   't': 'tabnew',
      \   'x': 'Win#exit'
      \ }
" ----------------------------------------------------------


" To fix diagnostic clash with coc.nvim and easymotion
" ----------------------------------------------------------
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
" ----------------------------------------------------------

" Coc.nvim configuration settings
" ----------------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Coc.nvim extension keybindings
" Coc-yank to open the yank list
nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<cr>
" Coc explorer trigger keybindings
nnoremap <silent><nowait>;e :CocCommand explorer<CR>
" Coc marketplace trigger keybindings
nnoremap <silent><nowait>;m :CocList marketplace<CR>

" Coc.nvim multicursor support
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)
" ----------------------------------------------------------

