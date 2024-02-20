return {
	"kdheepak/lazygit.nvim",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open lazygit" })
	end,
}
