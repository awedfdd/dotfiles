return {
	"neovim/nvim-lspconfig",
	opts = function()
		require("nvchad.configs.lspconfig").defaults()

		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

		local lspconfig = require("lspconfig")

		local servers = {
			"lua_ls",
			"html",
			"cssls",
			"jsonls",
			"yamlls",
			"ts_ls",
			"clangd",
			"qmlls",
			"bashls",
			"rust_analyzer",
			"gopls",
			"tailwindcss",
		}

		local nvlsp = require("nvchad.configs.lspconfig")
		for _, lsp in ipairs(servers) do
			local conf = {
				on_attach = nvlsp.on_attach,
				on_init = nvlsp.on_init,
				capabilities = nvlsp.capabilities,
			}
			if lsp == "lua_ls" then
				conf.settings = {
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
				conf.settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
								"docker-compose.yml",
								"docker-compose.yaml",
								"*.compose.yml",
								"*.compose.yaml",
								"compose.yaml",
								"compose.yml",
								"compose.*.yaml",
								"compose.*.yml",
							},
						},
						validate = true,
						completion = true,
						hover = true,
					},
				}
			end

			lspconfig[lsp].setup(conf)
		end
	end,
}
