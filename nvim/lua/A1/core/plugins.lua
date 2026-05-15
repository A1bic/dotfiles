local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("A1.plugins")

-- require("lazy").setup({
-- 
--   --Neo-tree and other "quality of life" plugins
-- 
-- 	-- { 
--   --   "nvim-neo-tree/neo-tree.nvim",
-- 	-- 	branch = "v3.x",
-- 	-- 	dependencies = {
-- 	-- 	      "nvim-lua/plenary.nvim",
-- 	-- 	      "nvim-tree/nvim-web-devicons",
-- 	-- 	      "MunifTanjim/nui.nvim",
-- 	-- 	}
-- 	-- },
-- 	-- { 'nvim-treesitter/nvim-treesitter' },
-- 
--   -- { 'nvim-treesitter/nvim-treesitter',
--   --   lazy = false,
--   --   build = ':TSUpdate'
--   -- },
--   -- {
--   --   'nvim-lualine/lualine.nvim',
--   --   dependencies = {
--   --     'nvim-tree/nvim-web-devicons'
--   --   }
--   -- },
--   -- {
--   --   "nvim-tree/nvim-tree.lua",
--   --   dependencies = {
--   --     "nvim-tree/nvim-web-devicons"
--   --   }
--   -- },
--   {
--     "folke/todo-comments.nvim",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     opts = {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   },
-- 
--   -- {
--   --   'nvim-telescope/telescope.nvim', version = '*',
--   --   dependencies = {
--   --     'nvim-lua/plenary.nvim',
--   --     -- optional but recommended
--   --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
--   --   }
--   -- },
-- 
--   -- Themes
-- 
-- 	-- { 'cocopon/iceberg.vim' },
-- 
-- 	-- { 'ellisonleao/gruvbox.nvim' },
-- 
--   -- Autocomplete and lsp 
-- 
-- 	-- { 'hrsh7th/cmp-nvim-lsp' },
--   -- { 'hrsh7th/cmp-buffer' },
--  	-- { 'hrsh7th/cmp-path' },
--  	-- { 'hrsh7th/cmp-cmdline' },
--  	-- { 'hrsh7th/nvim-cmp' },
--  	-- { 'williamboman/mason.nvim' },
-- 	-- { 'neovim/nvim-lspconfig' },
--   -- { 'mfussenegger/nvim-jdtls' },
-- 
-- 
--   -- { 'A1bic/GitManager' },
-- })
