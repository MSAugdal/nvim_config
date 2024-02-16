vim.g.mapleader = " "

--goes to current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--allows for moving of higlhighted lines (does not work on mac)
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


--keeps cursor in the middle when searching and half page scrolling
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--can paste over highlighted text without copying it
vim.keymap.set("x", "<leader>p", [["_dP]])

--copies to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--just dont press Q i guess?
vim.keymap.set("n", "Q", "<nop>")

--allows for changing of directory (does not work on mac for some reason)
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--lets you replace all instances of higlighted text
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--open terminal below and resize
vim.keymap.set("n", "<leader>nt", ":sp<bar>term<cr><c-w>J:resize10<cr>")

--exit terminal mode
vim.keymap.set("t", "<leader>et", "<C-\\><C-n><C-W>w")

