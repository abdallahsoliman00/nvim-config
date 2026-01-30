return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'darker',
            colors = {
                bg0 = "#181a1f",
                green = "#81cf5a",
                purple = "#aa5dfd",
                rich_orange = "#f47344",
                teal = "#35b093",
                var = "#d0404f",
                yellow = "#f4c244",
                cmnt = "#c7cca0",
            },
            highlights = {
                ["@lsp.type.keyword"] = { fg = "$purple" },
                ["@lsp.type.property"] = { fg = "$cyan" },
                ["@lsp.type.parameter"] = { fg = "$rich_orange", fmt = 'italic' },
                ["@lsp.type.variable"] = { fg = "$var" },
                ["@lsp.type.comment"] = { fg = "$cmnt" },
            }
        }
        require('onedark').load()
    end
}
