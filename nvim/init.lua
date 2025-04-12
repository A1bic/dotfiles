-- Basic
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')

--Plugins
require('plugins.treesitter')
--require('plugins.neotree') 
require('plugins.lsp') --language servers
require('plugins.cmp') --autocompletion
require('plugins.mason') --fast and simple installing lsp
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.alpha')

require('plugins.gitmanager')

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  float = {
    show_header = true,
    source = "always",
    border = "rounded",
  }
})
