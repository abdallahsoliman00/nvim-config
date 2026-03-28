local home = vim.env.HOME or vim.env.USERPROFILE
local data_path = vim.fn.stdpath('data')

local jdtls = require('jdtls')

-- Project / workspace
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fs.joinpath(home, 'jdtls-workspace', project_name)

-- OS detection
local system_os = 'linux'

if vim.fn.has('mac') == 1 then
    system_os = 'mac'
elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    system_os = 'win'
end

-- Mason paths
local mason_path = vim.fs.joinpath(data_path, 'mason')
local jdtls_path = vim.fs.joinpath(mason_path, 'packages', 'jdtls')

-- Launcher jar (dynamic version lookup)
local launcher_jar = vim.fn.glob(
    vim.fs.joinpath(jdtls_path, 'plugins', 'org.eclipse.equinox.launcher_*.jar')
)

-- Lombok
local lombok_jar = vim.fs.joinpath(jdtls_path, 'lombok.jar')

-- Debug bundles
local bundles = {
    vim.fn.glob(
        vim.fs.joinpath(
            mason_path,
            'share',
            'java-debug-adapter',
            'com.microsoft.java.debug.plugin.jar'
        )
    ),
}

-- Test bundles
vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(vim.fs.joinpath(mason_path, 'share', 'java-test', '*.jar')),
        '\n'
    )
)

-- Java runtime path
local java_home = ''

if system_os == 'win' then
    java_home = 'C:/Program Files/Java/jdk-26'
else
    java_home = '/usr/lib/jvm/java-21-openjdk-amd64'
end

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_jar,
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', launcher_jar,
        '-configuration', vim.fs.joinpath(jdtls_path, 'config_' .. system_os),
        '-data', workspace_dir,
    },

    root_dir = require('jdtls.setup').find_root({
        '.git',
        'mvnw',
        'pom.xml',
        'build.gradle',
    }),

    settings = {
        java = {
            home = java_home,

            eclipse = {
                downloadSources = true,
            },

            configuration = {
                updateBuildConfiguration = 'interactive',
                runtimes = {
                    {
                        name = 'JavaSE-21',
                        path = java_home,
                    },
                },
            },

            maven = {
                downloadSources = true,
            },

            implementationsCodeLens = {
                enabled = true,
            },

            referencesCodeLens = {
                enabled = true,
            },

            references = {
                includeDecompiledSources = true,
            },

            signatureHelp = {
                enabled = true,
            },

            format = {
                enabled = true,
            },

            completion = {
                favoriteStaticMembers = {
                    'org.hamcrest.MatcherAssert.assertThat',
                    'org.hamcrest.Matchers.*',
                    'org.hamcrest.CoreMatchers.*',
                    'org.junit.jupiter.api.Assertions.*',
                    'java.util.Objects.requireNonNull',
                    'java.util.Objects.requireNonNullElse',
                    'org.mockito.Mockito.*',
                },

                importOrder = {
                    'java',
                    'javax',
                    'com',
                    'org',
                },
            },

            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },

            codeGeneration = {
                toString = {
                    template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
                },
                useBlocks = true,
            },
        },
    },

    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    flags = {
        allow_incremental_sync = true,
    },

    init_options = {
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

config.on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)
