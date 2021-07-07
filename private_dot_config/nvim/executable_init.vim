" Vim-plug package manager
source $HOME/.config/nvim/vim/vimplug.vim
lua require('plugins')
autocmd BufWritePost plugins.lua PackerCompile


" General settings for appearance, keybinds, and set variables
source $HOME/.config/nvim/vim/general-settings.vim

" Plugins configuration
source $HOME/.config/nvim/vim/fzf.vim.vim
source $HOME/.config/nvim/vim/mundo.vim
source $HOME/.config/nvim/vim/firenvim.vim
source $HOME/.config/nvim/vim/floaterm.vim
source $HOME/.config/nvim/vim/easyalign.vim
source $HOME/.config/nvim/vim/easymotion.vim
source $HOME/.config/nvim/vim/vim-win.vim

" Plugin for programming (linter, formatter, completion, highlighting)
" ----------------------------------------------------------
" Lsp and completion
source $HOME/.config/nvim/vim/coc-nvim.vim
" Tree sitter
lua require('treesitter')
" General formatter helper
source $HOME/.config/nvim/vim/neoformat.vim
" Code runner
" lua require('sniprun')
" ----------------------------------------------------------


" List of autocommands that i dont why they were there
" ----------------------------------------------------------
" To fix diagnostic clash with coc.nvim and easymotion
" ----------------------------------------------------------
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" Disable automatic comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Get correct comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+

