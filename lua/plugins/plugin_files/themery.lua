return {
    'zaldih/themery.nvim',
    lazy = false,
    opts = {
        themes = {
            { name = "One Dark", colorscheme = "onedark" },
            { name = "Tokyonight Night", colorscheme = "tokyonight-night" },
            { name = "Tokyonight Storm", colorscheme = "tokyonight-storm" },
            { name = "Tokyonight Moon", colorscheme = "tokyonight-moon" },
            { name = "Tokyodark", colorscheme = "tokyodark" },
            { name = "NightFox", colorscheme = "nightfox" },
            { name = "DuskFox", colorscheme = "duskfox" },
            { name = "NordFox", colorscheme = "nordfox" },
            { name = "TeraFox", colorscheme = "terafox" },
            { name = "CarbonFox", colorscheme = "carbonfox" },
            { name = "Gruvbox Dark", colorscheme = "retrobox", before = [[ vim.opt.background = "dark" ]] },
            { name = "Dark 2026", colorscheme = "dark2026" },
        },
        livePreview = true,
    }
}
