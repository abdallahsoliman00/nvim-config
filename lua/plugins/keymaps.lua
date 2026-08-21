local opts = { noremap = true, silent = true }

local map = vim.keymap.set

-- Neotree --
map('n', '\\', ':Neotree toggle position=left<CR>:vertical resize 30<CR>', opts)
map('n', '<leader>e', ':Neotree reveal<cr>:vertical resize 30<CR>', opts)

-- Neocoderunner --
map('n', '<C-S-b>', ':NCRunnerBuild<CR>', opts)
map('n', '<C-S-r>', ':NCRunnerRun<CR>', opts)
map('n', '<C-S-n>', ':NCRunCurrentFile<CR>', opts)
map('v', '<C-S-n>', ':<C-U>NCRunCodeSnippet<CR>', opts)

-- Telescope --
map('n', '<leader>ts', ':Telescope<CR>', { desc = 'Open Telescope' })
map('n', '<leader>sf', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
map('n', '<leader>gr', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })
map('n', '<leader>gs', ':Telescope grep_string<CR>', { desc = 'Telescope grep string under cursor' })

-- Gitsigns --
map('n', '<leader>hh', ':Gitsigns preview_hunk<CR>')
map('n', ']w', ':Gitsigns next_hunk<CR>')
map('n', '[w', ':Gitsigns prev_hunk<CR>')

-- Telescope / LSP --
map('n', 'grn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
map('n', '<leader>ds', vim.lsp.buf.code_action, { desc = 'See code actions' })
map('n', '<leader>sd', vim.diagnostic.open_float, { desc = 'Show diagnostic in floating window'})
map('n', 'grr', ':Telescope lsp_references<CR>', { desc = '[G]oto [R]eferences' })
map('n', 'gri', ':Telescope lsp_implementations<CR>', { desc = '[G]oto [I]mplementation' })
map('n', 'gtd', ':Telescope lsp_definitions<CR>', { desc = '[G]oto [D]efinition' })
map('n', 'grD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
map('n', 'gO', ':Telescope lsp_document_symbols<CR>', { desc = 'Open Document Symbols' })
map('n', 'gW', ':Telescope lsp_dynamic_worspace_symbols<CR>', { desc = 'Open Workspace Symbols' })
map('n', 'grt', ':Telescope lsp_type_definitions<CR>', { desc = '[G]oto [T]ype Definition' })

-- Overlook --
map('n', 'grd', require("overlook.api").peek_definition, { desc = "Peek definition" })
map('n', '<leader>pp', require("overlook.api").peek_cursor, { desc = "Peek definition" })
map("n", "<leader>pq", require("overlook.api").close_all, { desc = "Close all popups" })
map("n", "<leader>ps", require("overlook.api").open_in_split, { desc = "Open popup in split" })
map("n", "<leader>pf", require("overlook.api").switch_focus, { desc = "Switch focus" })
map("n", "<leader>pv", require("overlook.api").open_in_vsplit, { desc = "Open popup in vsplit" })
map("n", "<leader>po", require("overlook.api").open_in_original_window, { desc = "Open popup in current window" })

-- DAP --
map('n', '<leader>db', ':DapToggleBreakpoint<CR>', opts)
map('n', '<leader>dc', ':DapContinue<CR>', opts)
map('n', '<S-Down>', ':DapStepOver<CR>', opts)
map('n', '<S-Right>', ':DapStepInto<CR>', opts)
map('n', '<S-Left>', ':DapStepOut<CR>', opts)
map('n', '<S-Up>', ':DapRestartFrame<CR>', opts)
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
