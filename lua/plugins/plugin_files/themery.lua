return {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
        -- Minimal config
        require('themery').setup({
            themes = {
                'onedark', 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon',
                'tokyodark', 'nightfox', 'duskfox', 'nordfox', 'terafox', 'carbonfox',
                'retrobox', 'suannhai-jiufen', 'suannhai-lam-ni', 'suannhai-rouiro',
                'suannhai-sumi', 'suannhai-koiai', 
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end,
}
