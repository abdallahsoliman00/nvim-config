local mason_path = vim.fn.stdpath('data') .. '/mason'

return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'mfussenegger/nvim-dap-python',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local dap_python = require('dap-python')

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = mason_path .. '/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
            options = {
                detached = false,
            },
        }

        dap.adapters.codelldb = {
            type = 'server',
            port = '${port}',
            executable = {
                command = mason_path .. '/packages/codelldb/extension/adapter/codelldb',
                args = { '--port', '${port}' },
                detached = false,
            },
        }

        dap.configurations.cpp = {
            {
                name = 'Launch file (GDB)',
                type = 'cppdbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Launch file (CodeLLDB)',
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        require('dapui').setup({})
        require('nvim-dap-virtual-text').setup({
            commented = true,
        })

        dap_python.setup('python')

        vim.fn.sign_define('DapBreakpoint', {
            text = '',
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = '',
        })

        vim.fn.sign_define('DapBreakpointRejected', {
            text = '',
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = '',
        })

        vim.fn.sign_define('DapStopped', {
            text = '',
            texthl = 'DiagnosticSignWarn',
            linehl = 'Visual',
            numhl = 'DiagnosticSignWarn',
        })

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end

        vim.api.nvim_create_user_command('DapUiToggle', function()
            dapui.toggle()
        end, { desc = 'Toggle Dap UI' })

    end,
}
