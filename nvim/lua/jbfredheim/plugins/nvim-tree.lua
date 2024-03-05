return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
				side = "right",
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		ResizeTimer = nil
		ResizeModeActive = false

		function StopResizeMode()
			if not ResizeModeActive then
				return
			end
			ResizeModeActive = false
			vim.api.nvim_del_keymap("n", "h")
			vim.api.nvim_del_keymap("n", "l")
		end

		function ResetTimer()
			if ResizeTimer then
				pcall(vim.fn.timer_stop, ResizeTimer) -- Use pcall to prevent errors
				ResizeTimer = nil
			end
			ResizeTimer = vim.defer_fn(StopResizeMode, 1000) -- 1 second of inactivity
		end

		function ResizeStep(direction)
			if not ResizeModeActive then
				return
			end
			vim.cmd("NvimTreeResize " .. direction)
			ResetTimer()
		end

		function StartResizeMode(direction)
			if ResizeModeActive then
				return -- Already in resize mode
			end
			ResizeModeActive = true

			vim.api.nvim_set_keymap(
				"n",
				"h",
				':lua ResizeStep("+5")<CR>',
				{ noremap = true, silent = true, nowait = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"l",
				':lua ResizeStep("-5")<CR>',
				{ noremap = true, silent = true, nowait = true }
			)

			ResizeStep(direction) -- Perform the first resize step
		end

		-- Set initial keymaps for entering resize mode
		vim.api.nvim_set_keymap("n", "<leader>h", ':lua StartResizeMode("+5")<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>l", ':lua StartResizeMode("-5")<CR>', { noremap = true, silent = true })

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
