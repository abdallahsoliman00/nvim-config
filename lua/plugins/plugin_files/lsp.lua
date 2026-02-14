return {
    'mason-org/mason-lspconfig.nvim',
    opts = {
        ensure_installed = { 'lua_ls', 'clangd', 'basedpyright', 'neocmakelsp', 'json-lsp' },
    },
    dependencies = {
        {
            'mason-org/mason.nvim',
            opts = {
                ensure_installed = { 'stylua', 'black', 'clang-format', 'prettier' },
            },
        },
        'neovim/nvim-lspconfig',
        'stevearc/conform.nvim',
    },
    config = function()
        -- Configure diagnostics
        vim.diagnostic.config({
            virtual_text = {
                source = 'if_many',
                spacing = 2,
            },
        })

        -- Setup mason-lspconfig
        require('mason-lspconfig').setup()

        -- Setup conform
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'black' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                json = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
            },
            format_on_save = function(bufnr)
                if not vim.g.autoformat_enabled then
                    return
                end
                local autoformat_fts = { 'lua', 'python', 'json', 'html', 'css' }
                local ft = vim.bo[bufnr].filetype
                if vim.tbl_contains(autoformat_fts, ft) then
                    return {
                        timeout_ms = 500,
                        lsp_fallback = false,
                    }
                end
            end,
        })

        vim.g.autoformat_enabled = false

        vim.api.nvim_create_user_command('ToggleAutoformat', function()
            vim.g.autoformat_enabled = not vim.g.autoformat_enabled
            print('Autoformat ' .. (vim.g.autoformat_enabled and 'enabled' or 'disabled'))
        end, {})

        -- Enable document highlight on hover
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                -- Check if the server supports document highlight
                if client.server_capabilities.documentHighlightProvider then
                    -- Highlight references when cursor is held
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.document_highlight()
                        end,
                    })

                    -- Clear highlights when cursor moves
                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.clear_references()
                        end,
                    })
                end
            end,
        })
        vim.opt.updatetime = 250 -- Trigger after 250ms of inactivity
        vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#3d3d3d' })
        vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#3d3d3d' })
        vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#4d4d3d' })
    end,
}
