return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
			integrations = {
				nvimtree = true,
				cmp = true,
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				telescope = {
					enabled = true,
				},
			},
			color_overrides = {
				latte = {
					rosewater = "#dc8a78",
					flamingo = "#dd7878",
					pink = "#ea76cb",
					mauve = "#8839ef",
					red = "#d20f39",
					maroon = "#e64553",
					peach = "#fe640b",
					yellow = "#df7e1d",
					green = "#40a02b",
					teal = "#179299",
					sky = "#04a5e5",
					sapphire = "#209fb5",
					blue = "#1e66f5",
					lavender = "#7287fd",
					text = "#4c4f69",
					subtext1 = "#5c5f77",
					subtext0 = "#6c6f85",
					overlay2 = "#7c7f93",
					overlay1 = "#8c8fa1",
					overlay0 = "#9ca0b0",
					surface2 = "#acb0be",
					surface1 = "#bcc0cc",
					surface0 = "#ccd0da",
					base = "#eff1f5",
					mantle = "#e6e9ef",
					crust = "#dce0e8",
				},
			},
		})
	end,
}
