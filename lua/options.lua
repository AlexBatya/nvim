-- Файлик для базовых опций nvim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

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
vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLineCloseOthers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bx', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })

-- Переключение на конкретный буфер
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })

-- Закрытие буфера
vim.api.nvim_set_keymap('n', '<leader>c', ':bdelete<CR>', { noremap = true, silent = true })

-- Настройка горячих клавиш для терминала через nvim-toggleterm.lua
-- Открытие/закрытие терминала
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true }) -- Вертикальный терминал
vim.api.nvim_set_keymap('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true }) -- Горизонтальный терминал

-- Открытие плавающего терминала
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })

-- Открытие нескольких терминалов с определёнными номерами
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t1', ':1ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t2', ':2ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t3', ':3ToggleTerm<CR>', { noremap = true, silent = true })

-- Переключение между терминалами
vim.api.nvim_set_keymap('n', '<leader>tn', ':ToggleTermNext<CR>', { noremap = true, silent = true }) -- Следующий терминал
vim.api.nvim_set_keymap('n', '<leader>tp', ':ToggleTermPrev<CR>', { noremap = true, silent = true }) -- Предыдущий терминал

