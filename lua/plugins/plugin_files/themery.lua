return {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
        -- Minimal config
        require('themery').setup({
            themes = { 'onedark', 'tokyonight-night', 'tokyonight-storm', 'tokyonight-day', 'tokyonight-moon' },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end,
}
