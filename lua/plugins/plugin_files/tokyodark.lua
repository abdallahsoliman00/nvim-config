return {
    'tiagovla/tokyodark.nvim',
    opts = {
        custom_palette = function(palette)
            return {
                diff_blue = '#39d5e3', -- brighter blue
            }
        end,
        terminal_colors = false,
    },
    -- config = function(_, opts)
    --     require('tokyodark').setup(opts)
    --     vim.g.terminal_color_8 = "#5d618f"
    -- end,
}
