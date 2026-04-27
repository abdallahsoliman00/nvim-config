local envparser = require('utis.envparser')
local env = envparser.load_env(vim.fn.stdpath('config') .. '/.env')

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

        -- C/C++ CHANGE DEPENDING ON THE DEVICE
        -- See: https://codeberg.org/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
        -- See: https://codeberg.org/mfussenegger/nvim-dap/wiki/C-CPP-Rust-%28via-codelldb%29
        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = 'C:\\Users\\' .. env.WINDOWS_PROFILE_NAME .. '\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
            options = {
                detached = false,
            },
        }

        dap.adapters.codelldb = {
            type = 'server',
            port = '${port}',
            executable = {
                command = 'C:\\Users\\' .. env.WINDOWS_PROFILE_NAME .. '\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe',
                args = { '--port', '${port}' },

                -- On windows you may have to uncomment this:
                detached = false,
            },
        }

        dap.configurations.cpp = {
            {
                name = 'Launch file (GCC)',
                type = 'cppdbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
                end,
                miDebuggerPath = 'C:\\msys64\\mingw64\\bin\\gdb.exe',
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Launch file (MSVC)',
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        require('dapui').setup({})
        require('nvim-dap-virtual-text').setup({
            commented = true, -- Show virtual text alongside comment
        })

        dap_python.setup('python')

        vim.fn.sign_define('DapBreakpoint', {
            text = '',
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = '',
        })

        vim.fn.sign_define('DapBreakpointRejected', {
            text = '', -- or "❌"
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = '',
        })

        vim.fn.sign_define('DapStopped', {
            text = '', -- or "→"
            texthl = 'DiagnosticSignWarn',
            linehl = 'Visual',
            numhl = 'DiagnosticSignWarn',
        })

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end

        vim.api.nvim_create_user_command('DapUiToggle', function()
            dapui.toggle()
        end, { desc = 'Toggle Dap UI' })

    end,
}
