require("nvchad.options")

local o = vim.o
o.cursorlineopt = "both"
o.so = 10
o.wrap = true
o.whichwrap = "b,s"
o.cc = "81"

local opt = vim.opt
opt.fileformats = { "unix", "dos", "mac" }
opt.swapfile = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = false

vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
