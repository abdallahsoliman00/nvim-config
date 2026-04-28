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
    },
    keys = {
        { '<leader>j', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
    },
}
