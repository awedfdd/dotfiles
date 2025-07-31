require("nvchad.mappings")

local map = vim.keymap.set

local nvim_tmux_nav = require("nvim-tmux-navigation")

map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

map("x", "p", [["_dP]], { noremap = true, silent = true })
