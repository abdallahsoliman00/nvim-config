return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        on_highlights = function(hl, c)
            hl.TelescopeSelection = {
                bg = "#0f6a7d",
                fg = "#FFFFFF",
            }
        end,
        styles = {
            functions = { bold = true },
        },
        plugins = {
            telescope = true,
            flash = true,
        },
    },
}
