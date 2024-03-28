local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {
		"angular",
		"arduino",
		"bash",
		"c",
		"c_sharp",
		"css",
		"dockerfile",
		"gdscript",
		"html",
		"java",
		"javascript",
		"json",
		"latex",
		"lua",
		"markdown",
		"python",
		"regex",
		--"pip",
		"rust",
		"scss",
		"sql",
		"tsv",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"yaml"
	},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true
	},
	highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
	ts_context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}
