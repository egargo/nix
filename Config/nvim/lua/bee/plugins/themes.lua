return {
	{
		-- "folke/tokyonight.nvim",
		"rebelot/kanagawa.nvim",
		-- "catppuccin/nvim",
		-- "ellisonleao/gruvbox.nvim",
		-- "rose-pine/neovim",
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.colorscheme("catppuccin-macchiato")
			-- vim.cmd.colorscheme("gruvbox")
			-- vim.cmd.colorscheme("rose-pine-dawn")
			vim.cmd.colorscheme("kanagawa-wave")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
