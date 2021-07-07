-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'antoinemadec/coc-fzf'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'junegunn/vim-easy-align'
  use "tversteeg/registers.nvim"
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-eunuch'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'wellle/targets.vim'
  use 'dracula/vim'
  use 'ryanoasis/vim-devicons'
  use 'farmergreg/vim-lastplace'
  use 'easymotion/vim-easymotion'
  use 'haya14busa/is.vim'
  use 'zhou13/vim-easyescape'
  use 'dstein64/vim-win'
  use 'voldikss/vim-floaterm'
  use 'kshenoy/vim-signature'
  use 'simnalamburt/vim-mundo'
  use 'brooth/far.vim'
  use 'elzr/vim-json'
  use 'nvim-lua/plenary.nvim'
  use 'famiu/nvim-reload'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'dstein64/nvim-scrollview'
  use 'matbme/JABS.nvim'
  use 'andymass/vim-matchup'



  -- Coding stuff
  -- Lsp
  use 'neoclide/coc.nvim'
  use 'honza/vim-snippets'
  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  -- Formatter helper
  use 'sbdchd/neoformat'
  -- Code runner
  -- use {
  --   'michaelb/sniprun',
  --   run = 'bash ./install.sh',
  --   config = function()
  --     require'sniprun'.initial_setup()
  --   end
  --  }

  use 'turbio/bracey.vim'
  use 'metakirby5/codi.vim'
  use 'skywind3000/asyncrun.vim'

end)
