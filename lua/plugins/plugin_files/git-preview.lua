return {
    'vieitesss/minifugit.nvim',
    cmd = { 'MinifugitStatus' },
    opts = {
    preview = {
            -- Start diff previews with wrapping disabled.
            wrap = false,

            -- Show old/new line numbers in diff previews.
            show_line_numbers = true,

            -- Show git diff metadata rows such as `diff --git`, `index`, `---`,
            -- and `+++`.
            show_metadata = true,

            -- Diff preview layout: 'stacked', 'split', or 'auto'.
            diff_layout = 'split',
        },
    }
}
