return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				-- theme = "catppuccin",
				-- theme = "gruvbox",
				theme = "kanagawa",
				-- theme = "rose-pine",
				-- theme = "tokyonight",
				component_separators = "|",
				section_separators = "",
				"filename",
				path = 1,
			},
		},
	},
}
