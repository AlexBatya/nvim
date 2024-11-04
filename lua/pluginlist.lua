return {
  -- LSP и Mason для настройки автокомплита и LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- Укажите необходимые LSP серверы
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Здесь можно подключить настройку LSP
    end
  },

  -- Буферные вкладки (bufferline)
  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require('bufferline').setup {
        options = {
          numbers = "none",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = (level:match("error") and " " or " ")
            return " " .. icon .. count
          end,
          offsets = {{ filetype = "NvimTree", text = "File Explorer", text_align = "center" }},
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "thin",
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
        },
        highlights = {
          buffer_selected = {
            guifg = '#ffffff',
            guibg = '#5f87d7',
            gui = 'bold',
          },
          diagnostic_selected = {
            guifg = '#ff5f5f',
            gui = 'bold,italic',
          },
          error_diagnostic_selected = {
            guifg = '#ff0000',
            gui = 'bold,italic',
          },
          warning_diagnostic_selected = {
            guifg = '#ffaa00',
            gui = 'bold,italic',
          },
          info_diagnostic_selected = {
            guifg = '#00afff',
            gui = 'bold,italic',
          },
          modified = {
            guifg = '#00ff00',
            gui = 'bold',
          }
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

  -- Плагин для терминала
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("toggleterm").setup{
        size = 20,
        open_mapping = [[<C-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
          width = 120,
          height = 30,
          winblend = 3,
        }
      }
    end
  },

  -- Treesitter для улучшенной подсветки синтаксиса
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  --   config = function()
  --     require'nvim-treesitter.configs'.setup {
  --       highlight = {
  --         enable = true,
  --         additional_vim_regex_highlighting = false,
  --       },
  --       ensure_installed = {
  --         "javascript", "typescript", "tsx", "html", "css", "lua", "python", "rust"
  --       }
  --     }
  --
  --     -- Отключение Treesitter для больших файлов
  --     local function disable_treesitter_for_large_files()
  --       local max_filesize = 1024 * 100 -- 100 KB
  --       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
  --       if ok and stats and stats.size > max_filesize then
  --         vim.cmd("TSBufDisable highlight")
  --       end
  --     end
  --
  --     vim.api.nvim_create_autocmd({"BufReadPost"}, {
  --       callback = disable_treesitter_for_large_files,
  --     })
  --
  --     -- Поддержка курсива для функций, ключевых слов и комментариев
  --     vim.cmd [[
  --       highlight Function cterm=italic gui=italic
  --       highlight Keyword cterm=italic gui=italic
  --       highlight Comment cterm=italic gui=italic
  --     ]]
  --   end
  -- },

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

  -- Дерево файлов (NeoTree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
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
            symbol = "",
            highlight = "NeoTreeModified",
          },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "",
              renamed = "",
              untracked = "★",
              ignored = "",
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
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.cmd("let g:mkdp_auto_start = 0")
    end
  }
}

