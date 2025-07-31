return {
	"neovim/nvim-lspconfig",
	opts = function()
		require("nvchad.configs.lspconfig").defaults()

		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

		local lspconfig = require("lspconfig")

		local servers = {
			"buf_ls",
			"lua_ls",
			"html",
			"cssls",
			"jsonls",
			"yamlls",
			"ts_ls",
			"clangd",
			"docker_compose_language_service",
			"dockerls",
			"bashls",
			"rust_analyzer",
			"gopls",
			"cmake",
		}

		local nvlsp = require("nvchad.configs.lspconfig")
		-- lsps with default config
		for _, lsp in ipairs(servers) do
			local settings = {}
			if lsp == "lua_ls" then
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						telemetry = {
							enable = false,
						},
					},
				}
			elseif lsp == "yamlls" then
				settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
								"compose.yaml",
								"compose.yml",
								"docker-compose.yaml",
								"docker-compose.yml",
								"*.compose.yaml",
								"*.compose.yml",
							},
							["https://json.schemastore.org/github-workflow.json"] = { ".github/workflows/*" },
						},
					},
				}
			end

			lspconfig[lsp].setup({
				on_attach = nvlsp.on_attach,
				on_init = nvlsp.on_init,
				capabilities = nvlsp.capabilities,
				settings = settings,
			})
		end

		lspconfig.tailwindcss.setup({})

		lspconfig["terraformls"].setup({})
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = { "*.tf", "*.tfvars" },
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
			pattern = {
				"compose.yaml",
				"compose.yml",
				"docker-compose.yaml",
				"docker-compose.yml",
				"*.compose.yaml",
				"*.compose.yml",
			},
			callback = function()
				vim.bo.filetype = "yaml.docker-compose"
			end,
		})

		-- configuring single server, example: typescript
		-- lspconfig.ts_ls.setup {
		--   on_attach = nvlsp.on_attach,
		--   on_init = nvlsp.on_init,
		--   capabilities = nvlsp.capabilities,
		-- }
	end,
}
