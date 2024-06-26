local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use {'iamcco/markdown-preview.nvim',run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim" -- Easily comment stuff
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
	use "akinsho/bufferline.nvim"
	use "akinsho/toggleterm.nvim"

  -- Colorschemes
	use "ellisonleao/gruvbox.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- the completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- Snippets
	use "L3MON4D3/LuaSnip" -- snippet engine
	use "rafamadriz/friendly-snippets" -- collection of snippets in various languages

	-- LSP - Language Server Protocol
	use "neovim/nvim-lspconfig" -- enable lsp
	use "williamboman/mason.nvim" -- simple to use lsp installer
	use "williamboman/mason-lspconfig.nvim" -- lsp installer
	use "jose-elias-alvarez/null-ls.nvim" -- lsp diagnostics and code actions

  -- Telescope
	use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "HiPhish/nvim-ts-rainbow2"
  use "nvim-treesitter/playground"
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins:
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
