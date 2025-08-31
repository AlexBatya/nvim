-- Файл настроек 
require "options"
require "plugins"

-- Автоопределение XAML файлов
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.xaml",
    callback = function()
        vim.bo.filetype = "xaml"
    end
})
