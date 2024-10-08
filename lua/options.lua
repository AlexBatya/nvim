-- Файлик для базовых опций nvim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Копирование в системный буфер обмена
vim.o.clipboard = 'unnamedplus'

-- Включение нумерации строк
vim.o.number = true
vim.o.relativenumber = true 

-- Колонка для знаков (например, для диагностики LSP)
vim.o.signcolumn = 'yes'

-- Настройки табуляции
vim.o.tabstop = 2        -- ширина табуляции (в пробелах)
vim.o.shiftwidth = 2     -- число пробелов для сдвига (например, при автоотступах)
vim.o.expandtab = true   -- использовать пробелы вместо табуляций

-- Время обновления для автокоманд (снижение для большей отзывчивости)
vim.o.updatetime = 300

-- Поддержка 24-bit цветов
vim.o.termguicolors = true

-- Разрешить использование мыши
vim.o.mouse = 'a'

-- Кодировка
vim.o.encoding = 'utf8'

-- Отключаем вертикальные линии из indentLine
vim.cmd("let g:indentLine_enabled=0")

-- Переключение между вкладками (буферами)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Переключение на конкретный буфер
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })

-- Закрытие буфера
vim.api.nvim_set_keymap('n', '<leader>c', ':bdelete<CR>', { noremap = true, silent = true })

