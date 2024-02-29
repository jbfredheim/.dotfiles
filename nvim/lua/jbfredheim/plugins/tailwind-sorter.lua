return {
	"laytan/tailwind-sorter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	lazy = false,
	build = "cd formatter && npm i && npm run build",
	config = true,
}
