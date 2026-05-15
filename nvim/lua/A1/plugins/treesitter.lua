return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.config")

    configs.setup({
		-- ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "go", "cpp", "javascript", "html", "java", "bash" },

    ensure_installed = { "c", "lua", "go", "cpp", "javascript", "html", "vim", "python", "c_sharp", "java", "bash"},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },  
	})
	end
}



-- require "nvim-treesitter".install {
--   "c",
--   "lua",
--   "go",
--   "cpp", 
--   "javascript", 
--   "html", 
--   "vim", 
--   "python", 
--   "c_sharp", 
--   "java",
--   "bash"
-- }

-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = { "c", "lua", "go", "cpp", "javascript", "html", "vim", "python", "c_sharp", "java"},
-- 	sync_install = false,
-- 	auto_install = true,
-- 	highlight = {
-- 		enable = true,
-- 	}
-- })

-- require'nvim-treesitter.configs'.setup {
-- 	ensure_installed = { "c", "lua", "go", "cpp", "javascript", "html", "vim", "python", "c_sharp"},
-- 	sync_install = false,
-- 	auto_install = true,
-- 	highlight = {
-- 		enable = true,
-- 	},
-- }
