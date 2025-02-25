return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				qml = { "qmlformat_mr" },
				cpp = { "clang_format_mr" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				qmlformat_mr = {
					command = "/usr/local/bin/qmlformat-mr",
					args = { "-n", "-l", "unix", "--inplace", "-f", "$FILENAME" },
					stdin = false,
					tmpfile_format = ".conform.$RANDOM.$FILENAME",
				},
				clang_format_mr = {
					command = "/usr/local/bin/clang-format-mr",
					args = { "--Werror", "--style=file", "--fallback-style=none" },
					stdin = true,
					cwd = require("conform.util").root_file({ ".clang-format" }),
					require_cwd = true,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
