local opts = { noremap = true, silent = true }
local map = vim.keymap.set


-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)


-- Remap redo key
map('n', 'U', '<C-r>', opts)


-- Toggle line wrapping
map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


-- Default shell
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = "\""
vim.opt.shellxquote = ""


-- Indentation
map('i', '<C-BS>', '<C-w>', opts)
map('i', '<S-Tab>', '<C-d>', opts)
map('n', '<S-Tab>', '<<', opts)
map('v', '<S-Tab>', '<gv', opts)


-- Resize windows
map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)
map('n', '<C-Left>', ':vertical resize +2<CR>', opts)
map('n', '<C-Right>', ':vertical resize -2<CR>', opts)


-- Navigate between window splits
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)


-- Paste buffer override
map('v', 'p', '"_dP', opts)


-- Delete without copying to register
map('v', 'd', '"_d', opts)
map('n', 'dd', '"_dd', opts)


-- Buffers
map('n', '<leader>q', ':bnext<CR>', opts)
map('n', '<leader><Tab>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bp | bd #<CR>', opts)  -- close buffer without closing window
map('n', '<leader>t', '<cmd> enew <CR>', opts) -- new buffer


-- Undo and Redo with Ctrl+Z and Ctrl+Y in insert mode
map('i', '<C-z>', '<C-o>u', opts)
map('i', '<C-y>', '<C-o><C-r>', opts)


-- Move text up and down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":move '<-2<CR>gv=gv", opts)


-- Easy paste in insert mode
map('i', '<C-v>', '<Esc>pi')


-- Delete next word with Ctrl+Delete in insert mode
map('i', '<C-Del>', '<C-o>dw', opts)


-- Git add current buffer/file
map('n', '<leader>ga', function()
    local file = vim.fn.expand('%.')
    vim.fn.system('git add ' .. file)
    print('Added ' .. file .. ' to git')
end)


-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Easy line adding with enter
map('n', '<CR>', 'o<Esc>', { desc = 'Add newline below in normal mode', noremap = true, silent = true })
map('n', '<S-CR>', 'O<Esc>', { desc = 'Add newline below in normal mode', noremap = true, silent = true })


-- Diagnostics
map("n", "<leader>dn", ":lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>dN", ":lua vim.diagnostic.goto_prev()<CR>")
map("n", "<leader>ds", ":lua vim.lsp.buf.code_action()<CR>")


-- Easy normal mode from terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')


-- Easy comments
map('n', '<leader>.', 'gcc', { remap = true })
map('v', '<leader>.', 'gc', { remap = true })


-- Select all
map('n', '<leader>A', 'ggVG', opts)


-- Auto pairs
local function wrap_selection(left, right)
    return string.format('<Esc>`>a%s<Esc>`<i%s<Esc>', right, left)
end

map('v', '(', wrap_selection('(', ')'))
map('v', '[', wrap_selection('[', ']'))
map('v', '{', wrap_selection('{', '}'))
map('v', '"', wrap_selection('"', '"'))
map('v', "'", wrap_selection("'", "'"))


-- Zoom in/out in Neovide
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.75 -- default zoom
    map({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05<CR>")
    map({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05<CR>")
    map({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 0.75<CR>")
end
