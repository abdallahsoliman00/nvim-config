return {
    'tiagovla/tokyodark.nvim',
    opts = {
        custom_palette = function(palette)
            return {
                diff_blue = '#68d6da',
            }
        end,
        custom_highlights = function(highlights, palette)
            return {
                Visual = { bg = "#353945" },
                ["@lsp.type.selfParameter.python"] = { fg = "#FFFFFF", bold = true },
            }
        end,
        terminal_colors = false,
    },
    -- config = function(_, opts)
    --     require('tokyodark').setup(opts)
    --     vim.g.terminal_color_8 = "#5d618f"
    -- end,
}
