return {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
        bind = true,
        -- handler_opts = {
        --     border = 'rounded',
        -- },
        hint_enable = true,
        hint_prefix = "",
        hint_inline = function() return 'eol' end,
        floating_window = false,
    },
}
