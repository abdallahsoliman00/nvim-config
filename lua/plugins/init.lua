local function add_plugin(name)
    return require("plugins.plugin_files." .. name)
end

local function compile_plugins(plugin_names)
    local plugin_table = {}
    for _, plugin in ipairs(plugin_names) do
        table.insert(plugin_table, add_plugin(plugin))
    end
    return plugin_table
end

local plugins = {
    "onedark",
    "lsp",
    "neotree",
    "treesitter",
    "telescope",
    "autocomplete",
    "bufferline",
    "autopairs",
    "lualine",
    "gitsigns",
    "markdown",
    "indent-lines",
    "guess-indent",
    "cmake",
}

require("plugins.lazy")
require("lazy").setup({
    compile_plugins(plugins),
})

require("plugins.keymaps")
