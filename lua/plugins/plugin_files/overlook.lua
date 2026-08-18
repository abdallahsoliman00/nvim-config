return {
    'WilliamHsieh/overlook.nvim',
    opts = {
        ui = {
            border = 'rounded', -- default is "rounded"
            size_ratio = 0.7, -- default is 0.65
        },
        -- Run custom logic when the last popup in a stack closes
        on_stack_empty = nil,
    },
}
