-- Basic
vim.g.mapleader = " "
require('A1.core.plugins')
require('A1.core.mappings')
require('A1.core.configs')
require('A1.core.colors')

-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.backupcopy = "no"

vim.diagnostic.config({
  virtual_text = true,  -- Показывает ошибки внутри кода
  signs = true,         -- Включает значки ошибок в колонке слева
  underline = true,     -- Подчеркивает ошибки
  float = {
    show_header = true,
    source = "always",
    border = "rounded",
  }
})
