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
    vim.lsp.buf.format()
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
    severity = vim.diagnostic.severity.ERROR,  -- Показывать только ошибки
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
                    workspace = { checkThirdParty = false },
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

