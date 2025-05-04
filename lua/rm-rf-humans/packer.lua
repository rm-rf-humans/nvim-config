vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }

	use {
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = function()
			-- Set the color scheme
			vim.cmd('colorscheme tokyonight-moon')
		end
	}

	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'williamboman/mason-lspconfig.nvim'})
	use({'williamboman/mason.nvim'})
	use({'hrsh7th/cmp-nvim-lsp'})
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

	use {'nvim-lualine/lualine.nvim',
	requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	
	use {
		'lervag/vimtex',
		ft = { 'tex' },  -- Lazy load only for TeX files
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope.nvim"
	}

	use({
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<Tab>",            -- Accept suggestion
						next = "<M-]>",              -- Next suggestion
						prev = "<M-[>",              -- Previous suggestion
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },    -- Disable side panel (optional)
			})
		end,
	})

	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
end)

