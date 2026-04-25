-- Default shell
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.opt.shell = "powershell"
    vim.opt.shellcmdflag = "-command"
    vim.opt.shellquote = "\""
    vim.opt.shellxquote = ""
end

vim.wo.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'

vim.o.winborder = "rounded"
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartindent = true
vim.o.undofile = true

if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_cursor_animation_length = 0.125
end
