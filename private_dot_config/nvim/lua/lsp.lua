-- Lsp saga tools
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Snippet capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport =
  { properties = { 'documentation', 'detail', 'additionalTextEdits' } }

-- Lsp server settins
-- lua
local sumneko_root_path = '/home/enricofadly/lsp/lua-language-server'
local sumneko_binary = '/home/enricofadly/lsp/lua-language-server/bin/Linux/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
       },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
       },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
       },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false }
     }
   }
 }

-- diagnosticsls
require'lspconfig'.diagnosticls.setup { capabilities = capabilities }

-- tsserver
require'lspconfig'.tsserver.setup { capabilities = capabilities }

-- vimls
require'lspconfig'.vimls.setup { capabilities = capabilities }
------------------------------------------------------------------
-- Lsp-config configuration
-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
