return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "kanagawa-wave",
				-- theme = "gruvbox",
				-- theme = "rose-pine",
				-- theme = "tokyonight",
				-- theme = "catppuccin",
				component_separators = "|",
				section_separators = "",
				"filename",
				path = 1,
			},
		},
	},
}
