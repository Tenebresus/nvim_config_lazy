-- editor settings
vim.wo.relativenumber = true
vim.o.autoindent = false
vim.o.smartindent = false
vim.o.cindent = false
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4

-- remaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>d", vim.cmd.vsp)
vim.keymap.set("n", "<leader>s", vim.cmd.sp)
vim.keymap.set("n", "<leader>D", vim.cmd.close)
vim.keymap.set("n", "<C-j>", "5j")
vim.keymap.set("n", "<C-k>", "5k")
vim.keymap.set("v", "<C-j>", "5j")
vim.keymap.set("v", "<C-k>", "5k")
