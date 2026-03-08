return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
        scope = {
            show_start = false,
            show_end = false,
            highlight = 'IblScopeGray',
        },
        indent = {
            highlight = 'IblIndent',
        },
    },
    config = function(_, opts)
        -- Set highlights first (so ibl sees them), and reapply on colorscheme
        local function set_ibl_grays()
            vim.api.nvim_set_hl(0, 'IblScopeGray', { fg = '#5c6370', nocombine = true })
            vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3b3f4c', nocombine = true })
        end
        set_ibl_grays()
        vim.api.nvim_create_autocmd('ColorScheme', { callback = set_ibl_grays })

        require('ibl').setup(opts)
    end,
}
