local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Default shell
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = "\""
vim.opt.shellxquote = ""

-- Indentation
vim.keymap.set('i', '<C-BS>', '<C-w>', opts)
vim.keymap.set('i', '<S-Tab>', '<C-d>', opts)
vim.keymap.set('n', '<S-Tab>', '<<', opts)
vim.keymap.set('v', '<S-Tab>', '<gv', opts)

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Paste buffer override
vim.keymap.set('v', 'p', '"_dP', opts)

-- delete without copying to register
vim.keymap.set('v', 'd', '"_d', opts)
vim.keymap.set('n', 'dd', '"_dd', opts)

-- Buffers
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>t', '<cmd> enew <CR>', opts) -- new buffer

-- Undo and Redo with Ctrl+Z and Ctrl+Y in insert mode
vim.keymap.set('i', '<C-z>', '<C-o>u', opts)
vim.keymap.set('i', '<C-y>', '<C-o><C-r>', opts)

-- Delete next word with Ctrl+Delete in insert mode
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { noremap = true, silent = true })

-- Git add current buffer/file
vim.keymap.set('n', '<leader>ga', '<cmd>!git add %<CR>')

-- Zoom in/out in Neovide
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.8 -- default zoom
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
