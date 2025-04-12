local lspconfig = require('lspconfig')

lspconfig.cmake.setup{}
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
            'E2',
            'E3',
            'E5',
            'W2',
            'W3',
          },
          maxLineLength = 500
        }
      }
    }
  }
}
lspconfig.clangd.setup({})
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {globals = {'vim'}}
    }
  }
}

--require'lspconfig'.ltex.setup{}
--lspconfig.ltex.setup {
--  settings = {
--    ltex = {
--      language = "ru-RU",
--    }
--  }
--}
