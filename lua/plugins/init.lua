local function add_plugin(name)

    return require('plugins.plugin_files.' .. name)
end

local function compile_plugins(plugin_names)
    local plugin_table = {}
    for _, plugin in ipairs(plugin_names) do
        table.insert(plugin_table, add_plugin(plugin))
    end
    return plugin_table
end

local plugins = {
    'onedark',
    'lsp',
    'neotree',
    'treesitter',
    'telescope',
    'autocomplete',
    'bufferline',
    'autopairs',
    'lualine',
    'gitsigns',
    'markdown',
    'indent-lines',
    'guess-indent',
    -- 'vimbegood',
    'toggleterm',
    'live-server',
    'comment',
    'neogen',
    'themery',
    'tokyonight',
    'flash',
    'nvim-dap',
    'java-lsp',
    'visimatch',
    'neocoderunner',
    'nightfox-theme',
    'git-preview',
    -- 'lsp-hints',
    'tokyodark',
    'smart-paste',
    'overlook',
    'dark2026',
    'vim-tmux',
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    compile_plugins(plugins),
})

require('plugins.keymaps')
