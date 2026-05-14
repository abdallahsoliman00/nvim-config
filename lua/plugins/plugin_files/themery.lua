return {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
        -- Minimal config
        require('themery').setup({
            themes = {
                'onedark', 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon',
                'nightfox', 'duskfox', 'nordfox', 'terafox', 'carbonfox'
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end,
}
