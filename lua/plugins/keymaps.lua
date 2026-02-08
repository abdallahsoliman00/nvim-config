local opts = { noremap = true, silent = true }

local map = vim.keymap.set


-- Neotree --
map('n', '\\', ':Neotree toggle position=left<CR>', opts)
map('n', '<leader>e', ':Neotree reveal<cr>', opts)


-- Telescope --
map('n', '<leader>sf', ':Telescope find_files<CR>', { desc = "Telescope find files" })
map('n', '<leader>rg', ':Telescope live_grep<CR>', { desc = "Telescope live grep" })


-- Gitsigns --
map('n', '<leader>hh', ':Gitsigns preview_hunk<CR>')
map('n', '<leader>hn', ':Gitsigns next_hunk<CR>')
map('n', '<leader>hp', ':Gitsigns prev_hunk<CR>')


-- LSP --
map('n', 'grn', vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })
map('n', 'grr', ':Telescope lsp_references<CR>', { desc = "[G]oto [R]eferences" })
map('n', 'gri', ':Telescope lsp_implementations<CR>', { desc = "[G]oto [I]mplementation" })
map('n', 'grd', ':Telescope lsp_definitions<CR>', { desc = "[G]oto [D]efinition" })
map('n', 'grD', vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map('n', 'gO', ':Telescope lsp_document_symbols<CR>', { desc = "Open Document Symbols" })
map('n', 'gW', ':Telescope lsp_dynamic_worspace_symbols<CR>', { desc = "Open Workspace Symbols" })
map('n', 'grt', ':Telescope lsp_type_definitions<CR>', { desc = "[G]oto [T]ype Definition" })

-- Markdown Preview --
map('n', '<leader>P', ':LivePreview start')
map('n', '<leader>Px', ':LivePreview close')
