-- Подключаем XML синтаксис как основу
vim.cmd("runtime! syntax/xml.vim")

-- Расширенные ключевые слова XAML
vim.cmd([[
  " Основные контейнеры
  syntax keyword xamlContainer Grid StackPanel DockPanel WrapPanel Canvas ScrollViewer TabControl
  " Окна и страницы
  syntax keyword xamlWindow Window Page UserControl ResourceDictionary
  " Контролы
  syntax keyword xamlControl Button TextBox ComboBox ListView ListBox DataGrid Label CheckBox RadioButton Slider
  syntax keyword xamlControl Menu MenuItem ContextMenu ToolBar StatusBar
  " Стили и шаблоны
  syntax keyword xamlStyle Template Style Setter Trigger DataTemplate ControlTemplate
  " Привязки и команды
  syntax keyword xamlBinding Binding RelativeSource ElementName Path Source Converter
  syntax region xamlBinding start=+{Binding+ end=+}+ contains=xmlAttrib,xmlString

  " Атрибуты стандартные и WPF
  syntax keyword xamlAttrib x:Name x:Key x:Class Grid.Row Grid.Column Margin Padding Width Height HorizontalAlignment VerticalAlignment

  " Подсветка ссылок на ресурсы
  syntax match xamlResource "StaticResource\|DynamicResource"

  " Подсветка комментариев XML уже есть через xml.vim
]])

-- Настройка цветов
vim.cmd([[
  highlight def link xamlContainer Type
  highlight def link xamlWindow Structure
  highlight def link xamlControl Identifier
  highlight def link xamlStyle Keyword
  highlight def link xamlBinding Special
  highlight def link xamlAttrib Constant
  highlight def link xamlResource PreProc
]])

