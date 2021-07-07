-- Nvim treesitter cli
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true -- false will disable the whole extension
   },
  rainbow = {
    enable = true,
    extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
   },
   indent = {
     enable = true
   }
 }
