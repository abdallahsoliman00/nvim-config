return {
    'numToStr/Comment.nvim',
    opts = {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = '<leader>.',
            ---Block-comment toggle keymap
            block = '<leader>,',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = '<leader>.',
            ---Block-comment keymap
            block = '<leader>,',
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = '<Nop>',
            ---Add comment on the line below
            below = '<Nop>',
            ---Add comment at the end of line
            eol = '<Nop>',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = function(ctx)
            local U = require('Comment.utils')
            -- Check if it's a linewise comment and we are in normal mode
            if ctx.range.srow == ctx.range.erow and ctx.ctype == U.ctype.linewise then
                vim.cmd('normal! j')
            end
        end,
    },
}
