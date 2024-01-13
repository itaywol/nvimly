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

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Packer updates itself
	use({ "wbthomason/packer.nvim" })

	-- File tree
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

	-- Key maps assistant
	use({ "folke/which-key.nvim" })

	-- Color Schemes
	use({ "loctvl842/monokai-pro.nvim" })

	-- Greeter
	use({ "goolord/alpha-nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	-- Search Utility
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Completion
	use({
		"zbirenbaum/copilot.lua",
	})

	-- Commenting
	use({
		"numToStr/Comment.nvim",
	})

	-- Buffers
	use({
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

	use({
		"moll/vim-bbye",
	})

	-- Toggle terminal
	use({
		"akinsho/toggleterm.nvim",
	})

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
	})

	-- Project management
	use({
		"ahmedkhalf/project.nvim",
	})

	-- CMP and LSP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"zbirenbaum/copilot-cmp",
		},
	})

	use({
		"neovim/nvim-lspconfig",
	})

	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"RRethy/vim-illuminate",
		},
	})

	use({ "lukas-reineke/indent-blankline.nvim", main = "ibl" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
