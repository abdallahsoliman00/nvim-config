require 'core.options'
require 'core.keymaps'


-- [[ Install `lazy.nvim` plugin manager ]]

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end


local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  require 'plugins.onedark',  
  'NMAC427/guess-indent.nvim',
  require 'plugins.neo-tree',
  require 'plugins.gitsigns',
  require 'plugins.treesitter',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  --require 'plugins.comment',
  require 'plugins.autopairs', 
})
