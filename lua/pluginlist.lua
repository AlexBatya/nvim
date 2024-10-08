return {
  -- LSP и Mason для настройки автокомплита и LSP
  "williamboman/mason.nvim", 
  "williamboman/mason-lspconfig.nvim", 
  "neovim/nvim-lspconfig", 

  -- Буферные вкладки
  {
    "akinsho/nvim-bufferline.lua", 
    config = function()
      require('bufferline').setup {
        options = {
          numbers = "none",
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "thin",
        }
      }
    end
  },

  -- Темы и статусная строка
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_c = {
            { 'filename', file_status = true },
          }
        }
      }
    end
  },

  -- Темная тема aquarium
  {
    "FrenzyExists/aquarium-vim",
    config = function()
      vim.cmd("set background=dark")
      vim.cmd("colorscheme aquarium")
    end
  },

  -- Airline для нижней панели и её темы
  "vim-airline/vim-airline",
  {
    "vim-airline/vim-airline-themes",
    config = function()
      vim.cmd("let g:airline_theme='onedark'")
      vim.cmd("set showtabline=2")
      vim.cmd("set noshowmode")
    end
  },

  -- Терминал
  {
    "rebelot/terminal.nvim",
    config = function()
      require("terminal").setup({
        layout = { open_cmd = "botright new" },
        cmd = { vim.o.shell },
        autoclose = false,
      })
      vim.cmd("map <C-m> :TermRun<CR>")
    end
  },

  -- Автозакрытие скобок
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end
  },

  -- Автокомплит и сниппеты
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path"
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' }
        })
      }
    end
  },

  -- Поддержка Markdown
  {
    "plasticboy/vim-markdown", -- Улучшенная поддержка синтаксиса Markdown
    config = function()
      vim.g.vim_markdown_folding_disabled = 1 -- Отключаем сворачивание секций в Markdown
    end
  },

  -- Предпросмотр Markdown
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1  -- Автоматически запускать предпросмотр при открытии .md файлов
      vim.g.mkdp_auto_close = 1  -- Закрывать предпросмотр при выходе из .md файла
    end
  },

  -- Поддержка LaTeX через vimtex
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = 'general'  -- Используем SumatraPDF на Windows
      vim.g.vimtex_view_general_viewer = 'C:/Users/User/AppData/Local/SumatraPDF/SumatraPDF.exe'  -- Путь до SumatraPDF
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      vim.g.vimtex_compiler_method = 'latexmk'  -- Компиляция через latexmk
      vim.g.tex_flavor = 'latex'
    end
  },

  -- Дерево файлов (NeoTree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "ryanoasis/vim-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          git_status = {
            symbols = {
              added = "✚",
              modified = "",
              deleted = "✖",
              renamed = "➜",
              untracked = "★",
              ignored = "◌",
            }
          }
        },
        window = {
          position = "left",
          width = 35,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["l"] = "open",
            ["h"] = "close_node",
            ["a"] = "add",
            ["r"] = "rename",
            ["d"] = "delete",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
          }
        },
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = { "node_modules" },
            never_show = { ".DS_Store", "thumbs.db" },
          },
        },
      })
      vim.cmd("map <C-p> :Neotree toggle<CR>")
    end
  },

  -- Комментарии
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Линия отступов
  {
    "Yggdroot/indentLine",
    config = function()
      vim.g.indentLine_enabled = 1
      vim.g.indentLine_char = '┊'
      vim.g.indentLine_color_gui = '#AAAAAA'
      vim.g.indent_blankline_enabled = true
    end
  },

  -- Surround плагин
  {
    "tpope/vim-surround"
  },

  -- Множественное выделение
  {
    "mg979/vim-visual-multi"
  },

  -- Плагины для работы с базами данных
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion'
    },
    config = function()
      vim.g.db_ui_save_location = '~/.config/nvim/db_ui'
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_auto_execute_table_helpers = 1
    end
  }
}

