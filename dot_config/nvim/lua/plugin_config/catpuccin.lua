require("catppuccin").setup {
	flavour = "mocha",
	integrations = {
		nvimtree = true,
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				NvimTreeNormal = { bg = mocha.none },
			}
		end,
	},
}

vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin"

