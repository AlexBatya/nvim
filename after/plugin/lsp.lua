-- Настройки lsp
local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  -- Маппинги для LSP
  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  bufmap('K', vim.lsp.buf.hover)

  -- Команда для форматирования
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ async = true })
  end, {})

  -- Горячие клавиши для навигации по диагностике (ошибки/предупреждения)
  bufmap('[d', vim.diagnostic.goto_prev)  -- Перейти к предыдущей ошибке
  bufmap(']d', vim.diagnostic.goto_next)  -- Перейти к следующей ошибке
  bufmap('<leader>e', vim.diagnostic.open_float)  -- Открыть окно с описанием ошибки
  bufmap('<leader>q', vim.diagnostic.setloclist)  -- Поместить диагностику в список локаций
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Настройка диагностики
vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },  -- Показывать только предупреждения и ошибки
    prefix = '●',  -- Иконка для ошибок (можно заменить на свой символ)
  },
  signs = true,     -- Отображать иконки слева
  underline = true, -- Подчеркивать текст с ошибками
  update_in_insert = false,  -- Не обновлять диагностику при вставке текста
  severity_sort = true,      -- Сортировать по уровню серьезности
})

-- Настройки для Mason и LSP
require("mason").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    -- Lua LSP
    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },  -- Игнорировать глобальные переменные Lua для Neovim
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = { enable = false },
                },
            }
        }
    end
})

-- Настройка отображения иконок для диагностики
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Отключение Treesitter для больших файлов
local function disable_treesitter_for_large_files()
  local max_filesize = 100 * 1024 -- 100 KB
  local buf_name = vim.api.nvim_buf_get_name(0)
  local ok, stats = pcall(vim.loop.fs_stat, buf_name)
  if ok and stats and stats.size > max_filesize then
    vim.cmd("TSBufDisable highlight")
  end
end

vim.api.nvim_create_autocmd({"BufReadPost"}, {
  callback = disable_treesitter_for_large_files,
})

-- Настройка цвета вкладок в зависимости от диагностики
require('bufferline').setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and "" or ""
      return " " .. icon .. count
    end,
    -- Другие настройки bufferline
  },
  highlights = {
    error_diagnostic = {
      guifg = '#ff0000',  -- Красный цвет для ошибок
    },
    warning_diagnostic = {
      guifg = '#ffaa00',  -- Оранжевый цвет для предупреждений
    },
  }
}

-- Применение стилей для курсива в Treesitter
vim.cmd [[
  highlight Function cterm=italic gui=italic
  highlight Keyword cterm=italic gui=italic
  highlight Comment cterm=italic gui=italic
]]

