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

require("lazy").setup({

  --Neo-tree and other "quality of life" plugins

	--{ 
  --  "nvim-neo-tree/neo-tree.nvim",
	--	branch = "v3.x",
	--	dependencies = {
	--	      "nvim-lua/plenary.nvim",
	--	      "nvim-tree/nvim-web-devicons",
	--	      "MunifTanjim/nui.nvim",
	--	}
	--},
	{ 'nvim-treesitter/nvim-treesitter' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  -- Themes

	{ 'cocopon/iceberg.vim' },
	{ 'ellisonleao/gruvbox.nvim' },
  {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    --config = function ()
    --  require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --end

  },

  -- Autocomplete and lsp 

	{ 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
 	{ 'hrsh7th/cmp-path' },
 	{ 'hrsh7th/cmp-cmdline' },
 	{ 'hrsh7th/nvim-cmp' },
 	{ 'williamboman/mason.nvim' },
	{ 'neovim/nvim-lspconfig' },

  --My own plugins

  { 'A1bic/GitManager' },


})
