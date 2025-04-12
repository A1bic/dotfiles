require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "go", "cpp", "javascript", "html", "vim", "python", "bash", "xcompose" },
	sync_install = false,
	auto_install = true,
  highlight = {
		enable = true,
	},
}
