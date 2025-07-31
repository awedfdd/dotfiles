return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			scss = { "prettier" },
			yaml = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			markdown = { "prettier" },

			bash = { "shfmt" },
			sh = { "shfmt" },
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			cmake = { "cmake_format" },
			rust = { "rustfmt" },
			go = { "gofmt" },
		},

		format_on_save = {},
	},
}
