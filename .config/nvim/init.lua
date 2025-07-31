vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
local my_plugins = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file_path in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", true, true)) do
	local module_name = file_path:match(".*/lua/(.*)%.lua$")
	if module_name then
		local loaded_module = require(module_name:gsub("/", "."))
		if type(loaded_module) == "table" then
			if type(loaded_module[1]) == "table" then
				for _, p in ipairs(loaded_module) do
					p.lazy = false
					table.insert(my_plugins, p)
				end
			else
				loaded_module.lazy = false
				table.insert(my_plugins, loaded_module)
			end
		end
	end
end

local all_plugins = {
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},
}

vim.list_extend(all_plugins, my_plugins)

---@diagnostic disable-next-line: different-requires
require("lazy").setup(all_plugins, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)
