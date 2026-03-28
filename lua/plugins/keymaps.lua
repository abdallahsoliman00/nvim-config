local opts = { noremap = true, silent = true }

local map = vim.keymap.set

-- Neotree --
map('n', '\\', ':Neotree toggle position=left<CR>:vertical resize 30<CR>', opts)
map('n', '<leader>e', ':Neotree reveal<cr>:vertical resize 30<CR>', opts)

-- Telescope --
map('n', '<leader>sf', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
map('n', '<leader>rg', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })

-- Gitsigns --
map('n', '<leader>hh', ':Gitsigns preview_hunk<CR>')
map('n', '<leader>hn', ':Gitsigns next_hunk<CR>')
map('n', '<leader>hp', ':Gitsigns prev_hunk<CR>')

-- LSP --
map('n', 'grn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
map('n', '<leader>ds', vim.lsp.buf.code_action, { desc = 'See code actions' })
map('n', 'grr', ':Telescope lsp_references<CR>', { desc = '[G]oto [R]eferences' })
map('n', 'gri', ':Telescope lsp_implementations<CR>', { desc = '[G]oto [I]mplementation' })
map('n', 'grd', ':Telescope lsp_definitions<CR>', { desc = '[G]oto [D]efinition' })
map('n', 'grD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
map('n', 'gO', ':Telescope lsp_document_symbols<CR>', { desc = 'Open Document Symbols' })
map('n', 'gW', ':Telescope lsp_dynamic_worspace_symbols<CR>', { desc = 'Open Workspace Symbols' })
map('n', 'grt', ':Telescope lsp_type_definitions<CR>', { desc = '[G]oto [T]ype Definition' })

-- DAP --
map('n', '<leader>db', ':DapToggleBreakpoint<CR>', opts)
map('n', '<leader>dc', ':DapContinue<CR>', opts)
map('n', '<leader>do', ':DapStepOver<CR>', opts)
map('n', '<leader>di', ':DapStepInto<CR>', opts)
map('n', '<leader>dO', ':DapStepOut<CR>', opts)
map('n', '<leader>dq', ':DapTerminate<CR>', opts)
map('n', '<leader>du', ':DapUiToggle<CR>', opts)

-- Markdown Preview --
map('n', '<leader>md', ':LivePreview start<CR>', opts)
map('n', '<leader>mdx', ':LivePreview close<CR>', opts)

-- Live Server
map('n', '<leader>ls', ':LiveServerToggle<CR>')

-- Toggle autoformat
map('n', '<leader>tf', ':ToggleAutoformat<CR>', { silent = true, desc = 'Toggle autoformat' })

-- Toggleterm toggle terminal
map('n', '<C-\\>', ':ToggleTerm<CR>', opts)
map('t', '<C-\\>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

-- Manual format keymap for all languages
vim.keymap.set('n', '<leader>fm', function()
    require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format buffer' })
