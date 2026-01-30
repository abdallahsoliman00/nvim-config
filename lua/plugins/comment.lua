return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
		{
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>.",
				---Block-comment toggle keymap
				block = "<leader>,",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<leader>.",
				---Block-comment keymap
				block = "<leader>,",
			},
			---LHS of extra mappings
			extra = {},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = false,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
}
