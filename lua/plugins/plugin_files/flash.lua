return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        modes = {
            char = {
                enabled = false,
            },
            search = {
                enabled = false,
            },
        },
        jump = {
            autojump = true,
        },
    },
    keys = {
        { '<leader>j', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
    },
}
