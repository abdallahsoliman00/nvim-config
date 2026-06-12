return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'c', 'cpp', 'python', 'html', 'css', 'lua',
            'make', 'cmake', 'yaml', 'json', 'markdown',
            'typescript', 'javascript', 'rust'
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
