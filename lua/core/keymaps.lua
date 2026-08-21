local opts = { noremap = true, silent = true }
local map = vim.keymap.set


-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Toggle relative line numbers
map("n", "<leader>ln", ":lua vim.o.relativenumber = not vim.o.relativenumber<CR>", opts)


-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)


-- Easy unindent
map('i', '<S-Tab>', '<C-o><<', opts)


-- Remap redo key
map('n', 'U', '<C-r>', opts)


-- Toggle line wrapping
map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


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

-- Clear line and stay in normal mode
map("n", "cc", '"_cc<Esc>')

-- Delete without copying to register
map({'n', 'v'}, 'x', '"_x', opts)
map({'n', 'v'}, 'X', '"_X', opts)
map({'n', 'v'}, 'c', '"_c', opts)
map({'n', 'v'}, 'C', '"_C', opts)
map({'n', 'v'}, 's', '"_s', opts)
map({'n', 'v'}, 'S', '"_S', opts)
map({'n', 'v'}, 'D', '"_D', opts)
map('n', 'dd', '"_dd', opts)


-- Buffers
map('n', '<leader>q', ':bnext<CR>', opts)
map('n', '<leader><Tab>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bp | bd #<CR>', opts)  -- close buffer without closing window


-- Go to end/beginning of line in insert mode (END/HOME key alternatives)
map('i', '<C-e>', '<C-o>A', opts)
map('i', '<C-h>', '<C-o>I', opts)


-- Move text up and down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":move '<-2<CR>gv=gv", opts)


-- Easy paste in command mode
map('c', '<C-v>', '<C-r>+')


-- Easy Paste in insert mode
map('i', '<C-v>', '<C-o>P')


-- The `*` doesn't automatically jump to the next instance
vim.keymap.set("n", "*", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", "\\<" .. vim.fn.escape(word, "\\") .. "\\>")
  vim.opt.hlsearch = true
  vim.cmd("normal! b")
end, { desc = "Highlight word under cursor" })


vim.keymap.set("v", "*", function()
  vim.cmd([[execute "normal! \<Esc>"]])

  -- Get the text inside the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines == 0 then return end

  -- Handle multi-character and multi-line visual selections safely
  lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  lines[1] = string.sub(lines[1], start_pos[3])
  local selected_text = table.concat(lines, "\n")

  -- Set the search register (\V for literal matching)
  local pattern = "\\V" .. vim.fn.escape(selected_text, "\\")
  vim.fn.setreg("/", pattern)
  vim.opt.hlsearch = true

  -- Move the cursor exactly to the beginning of the selection
  vim.fn.setpos(".", start_pos)
end, { desc = "Highlight selection under cursor" })

-- Delete word with Ctrl+Delete and Ctrl+Backspace
map('i', '<C-Del>', '<C-o>dw', opts)
map('i', '<C-BS>', '<C-w>', opts)
map('t', '<C-BS>', '<C-w>', opts)


-- Git add current buffer/file
map('n', '<leader>ga', function()
    local file = vim.fn.expand('%.')
    vim.fn.system('git add ' .. file)
    print('Added ' .. file .. ' to git')
end)


-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Easy line adding with enter
map('n', '<CR>', 'o<Esc>', opts)
map('n', '<S-CR>', 'O<Esc>', opts)


-- Easy normal mode from terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')


-- Select all
map('n', '<leader>A', 'ggVG', opts)


-- Scroll Re-Center
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)

-- Auto pairs
vim.keymap.set("v", "<leader>s", function()
  local char = vim.fn.getcharstr()

  local pairs = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["<"] = ">",
  }

  local open = char
  local close = pairs[char] or char

  return string.format("c%s<C-r>\"%s<Esc>", open, close)
end, { expr = true, noremap = true, silent = true })


-- Zoom in/out in Neovide
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.65 -- default zoom
    map({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05<CR>", { silent = true })
    map({ "n", "v" }, "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05<CR>", { silent = true })
    map({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 0.65<CR>", { silent = true })
end

-- Toggle fullscreen in Neovide
if vim.g.neovide then
    vim.g.neovide_fullscreen = false
    map("n", "<C-S-F>", ":lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>", { silent = true } )
end

-- Open global TODO file
vim.api.nvim_create_user_command('Todo', function()
  local path
  if vim.fn.has('win32') == 1 then
    path = vim.fn.expand('$USERPROFILE/TODO.md')
  else
    path = vim.fn.expand('~/TODO.md')
  end
  vim.cmd('edit ' .. path)
  vim.cmd('normal! G')
end, {})
