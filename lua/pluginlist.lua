return {
  "williamboman/mason.nvim", --Плагины для LSP и Mason :Mason
  "williamboman/mason-lspconfig.nvim", --
  "neovim/nvim-lspconfig", --
  "vim-airline/vim-airline", -- Настройка нижней понели
  {
		"vim-airline/vim-airline-themes", --Темы для нижней понели
		config = function ()
			vim.cmd("let g:airline_theme='onedark'")
			vim.cmd("set showtabline=2")
			vim.cmd("set noshowmode")
		end
  },
  
  {
	"rebelot/terminal.nvim", --Настройка терминала :TermRun 		
		config = function ()
			require("terminal").setup({
				layout = { open_cmd = "botright new" },
				cmd = { vim.o.shell },
				autoclose = false,
			})
			vim.cmd("map <C-m> :TermRun<CR>") -- Теперь я могу запускать команлу ctrl + m
		end
  },
 
  {
	 "m4xshen/autoclose.nvim",
	 config = function () 
	 	require("autoclose").setup()
	 end 
  },
 
  {
	 'hrsh7th/nvim-cmp', -- Настройка автокомплита
	 dependencies = {
	 	"L3MON4D3/LuaSnip", -- Настройка снипетов автокомплита
	 	"saadparwaiz1/cmp_luasnip",
	 	"rafamadriz/friendly-snippets",
 
	 	"hrsh7th/cmp-nvim-lsp"
	 }
  },
 
  {
	 "nvim-neo-tree/neo-tree.nvim", -- Настройка nerdtree для дерева
	 branch = "v3.x",
	 dependencies = {
	 	"nvim-lua/plenary.nvim",
	 	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	 	"ryanoasis/vim-devicons",	-- icons
	 	"MunifTanjim/nui.nvim",
	 },
	 config = function () 
	 	require("neo-tree").setup({
	 		filesystem = {
	 			follow_current_file = true,
	 			filtered_items = {
	 				visible = true,
	 				show_hidden_count = true,
	 				-- hide_dotfiles = false,
	 				hide_gitignore = false
	 			}
	 		}
	 	})
	 	vim.cmd("map <C-n> :Neotree<CR>")
	 end
  },
 
  {
	 "numToStr/Comment.nvim", -- Настройка коментирования
	 config = function() 
	 	require("Comment").setup()
	 end
  },
 
  {
	 "Yggdroot/indentLine",
	 config = function ()
	 	vim.cmd("let g:indentLine_enabled=1")
	 	vim.cmd("let g:indentLine_color_gui='#FFFFFF'")
	 	vim.cmd("let g:indentLine_setColors=1")
	 end
 	},
 
  { 
	 "rose-pine/neovim", -- Пиздатая тема для nvim 
	 name = "rose-pine", -- можно ещё rose-pine-moon
	 config = function ()
	 	vim.cmd("colorscheme rose-pine")
	 end
  },

	

}
