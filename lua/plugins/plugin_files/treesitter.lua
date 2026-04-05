return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'c', 'cpp', 'python', 'html', 'css', 'lua',
            'make', 'cmake', 'yaml', 'json', 'markdown',
            'typescript', 'javascript', 'rust'
        })
    end,
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
    },
}
