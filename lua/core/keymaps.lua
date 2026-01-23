local opts = { noremap = true, silent = true }

vim.keymap.set('i', '<C-BS>', '<C-w>', opts)
vim.keymap.set('i', '<S-Tab>', '<C-d>', opts)
vim.keymap.set('n', '<S-Tab>', '<<', opts)
vim.keymap.set('v', '<S-Tab>', '<gv', opts)


if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
