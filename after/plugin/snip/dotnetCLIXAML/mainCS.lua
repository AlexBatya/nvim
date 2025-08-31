local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local wpf_csharp = {}

function wpf_csharp.add_snip()
    -- 📦 ОСНОВНЫЕ КЛАССЫ WPF
    ls.add_snippets("cs", {
        -- Window class - класс окна
        s("wclass", fmt(
        [[
using System.Windows;

namespace {} {{
  public partial class {} : Window {{
    public {}() {{
      InitializeComponent();
      {}
    }}
    {}
  }}
}}
]], { i(1, "YourNamespace"), i(2, "MainWindow"), rep(2), i(3), i(0) })
        ),

        -- Page class - класс страницы
        s("pclass", fmt(
        [[
using System.Windows.Controls;

namespace {} {{
  public partial class {} : Page {{
    public {}() {{
      InitializeComponent();
      {}
    }}
    {}
  }}
}}
]], { i(1, "YourNamespace"), i(2, "MainPage"), rep(2), i(3), i(0) })
        ),

        -- UserControl class - пользовательский контрол
        s("ucclass", fmt(
        [[
using System.Windows.Controls;

namespace {} {{
  public partial class {} : UserControl {{
    public {}() {{
      InitializeComponent();
      {}
    }}
    {}
  }}
}}
]], { i(1, "YourNamespace"), i(2, "MyUserControl"), rep(2), i(3), i(0) })
        ),

        -- ViewModel class - MVVM ViewModel
        s("vmclass", fmt(
        [[
using System.ComponentModel;

namespace {}.ViewModels {{
  public class {}ViewModel : INotifyPropertyChanged {{
    public event PropertyChangedEventHandler PropertyChanged;

    public {}ViewModel() {{
      {}
    }}

    protected virtual void OnPropertyChanged(string propertyName) {{
      PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }}
    {}
  }}
}}
]], { i(1, "YourNamespace"), i(2, "Main"), rep(2), i(3), i(0) })
        )
    })

    -- 🎯 ОБРАБОТЧИКИ СОБЫТИЙ WPF
    ls.add_snippets("cs", {
        -- Click handler - обработчик клика
        s("click", fmt(
        [[
private void {}_Click(object sender, RoutedEventArgs e) {{
  {}
}}
]], { i(1, "Button"), i(0) })
        ),

        -- Loaded handler - обработчик загрузки
        s("loaded", fmt(
        [[
private void {}_Loaded(object sender, RoutedEventArgs e) {{
  {}
}}
]], { i(1, "Window"), i(0) })
        ),

        -- Closing handler - обработчик закрытия
        s("closing", fmt(
        [[
private void {}_Closing(object sender, CancelEventArgs e) {{
  {}
}}
]], { i(1, "Window"), i(0) })
        ),

        -- SelectionChanged handler - изменение выбора
        s("selectchange", fmt(
        [[
private void {}_SelectionChanged(object sender, SelectionChangedEventArgs e) {{
  {}
}}
]], { i(1, "ComboBox"), i(0) })
        ),

        -- TextChanged handler - изменение текста
        s("textchange", fmt(
        [[
private void {}_TextChanged(object sender, TextChangedEventArgs e) {{
  {}
}}
]], { i(1, "TextBox"), i(0) })
        ),

        -- Checked/Unchecked handlers - флажки
        s("checked", fmt(
        [[
private void {}_Checked(object sender, RoutedEventArgs e) {{
  {}
}}
]], { i(1, "CheckBox"), i(0) })
        ),

        s("unchecked", fmt(
        [[
private void {}_Unchecked(object sender, RoutedEventArgs e) {{
  {}
}}
]], { i(1, "CheckBox"), i(0) })
        )
    })

    -- ⚡ MVVM СВОЙСТВА И КОМАНДЫ
    ls.add_snippets("cs", {
        -- Simple property - простое свойство
        s("prop", fmt(
        [[
public {} {} {{ get; set; }}
]], { i(1, "string"), i(2, "Name") })
        ),

        -- Full property - полное свойство
        s("fprop", fmt(
        [[
private {} {};
public {} {} {{
  get => {};
  set => {} = value;
}}
]], { i(1, "string"), i(2, "_name"), i(3, "string"), i(4, "Name"), rep(2), rep(2) })
        ),

        -- ICommand property - команда
        s("command", fmt(
        [[
private ICommand {};
public ICommand {} {{
  get => {};
  set {{
    {} = value;
    OnPropertyChanged(nameof({}));
  }}
}}
]], { i(1, "_myCommand"), i(2, "MyCommand"), rep(1), rep(1), rep(2) })
        ),

        -- RelayCommand implementation - реализация команды
        s("relay", fmt(
        [[
public class RelayCommand : ICommand {{
  private readonly Action _execute;
  private readonly Func<bool> _canExecute;

  public RelayCommand(Action execute, Func<bool> canExecute = null) {{
    _execute = execute ?? throw new ArgumentNullException(nameof(execute));
    _canExecute = canExecute;
  }}

  public bool CanExecute(object parameter) => _canExecute?.Invoke() ?? true;

  public void Execute(object parameter) => _execute();

  public event EventHandler CanExecuteChanged {{
    add => CommandManager.RequerySuggested += value;
    remove => CommandManager.RequerySuggested -= value;
  }}
}}
]], {})
        )
    })

    -- 🎨 DI И СЕРВИСЫ
    ls.add_snippets("cs", {
        -- Dependency Property - свойство зависимости
        s("dprop", fmt(
        [[
public static readonly DependencyProperty {}Property =
  DependencyProperty.Register("{}", typeof({}), typeof({}), new PropertyMetadata({}));

public {} {} {{
  get => ({})GetValue({}Property);
  set => SetValue({}Property, value);
}}
]], { i(1, "Text"), rep(1), i(2, "string"), i(3, "MyControl"), i(4, "null"), rep(2), rep(1), rep(2), rep(1), rep(1) })
        ),

        -- INotifyPropertyChanged implementation
        s("inotify", fmt(
        [[
public event PropertyChangedEventHandler PropertyChanged;

protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null) {{
  PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
}}

protected bool SetField<T>(ref T field, T value, [CallerMemberName] string propertyName = null) {{
  if (EqualityComparer<T>.Default.Equals(field, value)) return false;
  field = value;
  OnPropertyChanged(propertyName);
  return true;
}}
]], {})
        )
    })

    -- 📊 DATA BINDING И КОЛЛЕКЦИИ
    ls.add_snippets("cs", {
        -- ObservableCollection - наблюдаемая коллекция
        s("obs", fmt(
        [[
private ObservableCollection<{}> {} = new ObservableCollection<{}>();
public ObservableCollection<{}> {} => {};
]], { i(1, "string"), i(2, "_items"), rep(1), rep(1), i(3, "Items"), rep(2) })
        ),

        -- Binding setup - настройка привязки
        s("bind", fmt(
        [[
var binding = new Binding("{}") {{
  Source = {},
  Mode = BindingMode.{},
  UpdateSourceTrigger = UpdateSourceTrigger.{}
}};
{}.SetBinding({}.{}Property, binding);
]], { i(1, "PropertyName"), i(2, "this"), i(3, "TwoWay"), i(4, "PropertyChanged"), i(5, "MyControl"), i(6, "TextBox"), i(7, "Text") })
        )
    })

    -- 🎭 СООБЩЕНИЯ И ДИАЛОГИ
    ls.add_snippets("cs", {
        -- MessageBox - сообщение
        s("msg", fmt(
        [[
MessageBox.Show("{}", "{}", MessageBoxButton.{}, MessageBoxImage.{});
]], { i(1, "Сообщение"), i(2, "Заголовок"), i(3, "OK"), i(4, "Information") })
        ),

        -- OpenFileDialog - диалог открытия файла
        s("openfile", fmt(
        [[
var dialog = new OpenFileDialog {{
  Title = "{}",
  Filter = "{}",
  DefaultExt = "{}"
}};

if (dialog.ShowDialog() == true) {{
  {}
}}
]], { i(1, "Выберите файл"), i(2, "Все файлы|*.*"), i(3, "txt"), i(0) })
        ),

        -- SaveFileDialog - диалог сохранения файла
        s("savefile", fmt(
        [[
var dialog = new SaveFileDialog {{
  Title = "{}",
  Filter = "{}",
  DefaultExt = "{}"
}};

if (dialog.ShowDialog() == true) {{
  {}
}}
]], { i(1, "Сохранить файл"), i(2, "Текстовые файлы|*.txt"), i(3, "txt"), i(0) })
        )
    })

    -- 🔧 УТИЛИТЫ И ХЕЛПЕРЫ
    ls.add_snippets("cs", {
        -- Dispatcher invoke - вызов в UI потоке
        s("dispatch", fmt(
        [[
Application.Current.Dispatcher.Invoke(() => {{
  {}
}});
]], { i(0) })
        ),

        -- Async method - асинхронный метод
        s("async", fmt(
        [[
private async Task {}Async() {{
  {}
}}
]], { i(1, "LoadData"), i(0) })
        ),

        -- Try-catch block - обработка исключений
        s("try", fmt(
        [[
try {{
  {}
}}
catch (Exception ex) {{
  MessageBox.Show($"Ошибка: {{ex.Message}}");
}}
]], { i(0) })
        ),

        -- Using statement - использование ресурсов
        s("using", fmt(
        [[
using (var {} = new {}()) {{
  {}
}}
]], { i(1, "stream"), i(2, "FileStream"), i(0) })
        ),

        -- Region directive - регион
        s("region", fmt(
        [[
#region {}
{}
#endregion
]], { i(1, "Properties"), i(0) })
        ),

        -- Constructor - конструктор
        s("ctor", fmt(
        [[
public {}() {{
  {}
}}
]], { i(1, "MyClass"), i(0) })
        ),

        -- Property changed call - вызов изменения свойства
        s("propchange", fmt(
        [[
OnPropertyChanged(nameof({}));
]], { i(1, "PropertyName") })
        )
    })

    -- 🎪 WPF СПЕЦИФИЧНЫЕ МЕТОДЫ
    ls.add_snippets("cs", {
        -- FindName поиск элемента
        s("find", fmt(
        [[
var {} = ({})FindName("{}");
if ({} != null) {{
  {}
}}
]], { i(1, "control"), i(2, "Button"), i(3, "myButton"), rep(1), i(0) })
        ),

        -- DataContext приведение
        s("dcast", fmt(
        [[
var viewModel = ({})DataContext;
if (viewModel != null) {{
  {}
}}
]], { i(1, "MainViewModel"), i(0) })
        ),

        -- Resource получение
        s("resource", fmt(
        [[
var {} = ({})FindResource("{}");
]], { i(1, "resource"), i(2, "Brush"), i(3, "MyBrush") })
        )
    })

    -- 📝 АТРИБУТЫ И КОММЕНТАРИИ
    ls.add_snippets("cs", {
        -- XML комментарий
        s("xmlcom", fmt(
        [[
/// <summary>
/// {}
/// </summary>
/// <param name="{}">{}</param>
/// <returns>{}</returns>
]], { i(1, "Описание метода"), i(2, "parameter"), i(3, "Описание параметра"), i(4, "Описание возвращаемого значения") })
        ),

        -- Attribute - атрибут
        s("attr", fmt(
        [[
[{}]
]], { i(1, "Serializable") })
        )
    })
end

-- 📋 КРАТКАЯ ШПАРГАЛКА ПО C# СНИППЕТАМ:
-- wclass     - Класс окна WPF
-- pclass     - Класс страницы WPF  
-- ucclass    - Класс пользовательского контрола
-- vmclass    - ViewModel класс (MVVM)
-- click      - Обработчик клика
-- loaded     - Обработчик загрузки
-- mvvmprop   - MVVM свойство с уведомлением
-- prop       - Простое свойство
-- command    - ICommand свойство
-- relay      - RelayCommand реализация
-- dprop      - Dependency Property
-- inotify    - INotifyPropertyChanged
-- obs        - ObservableCollection
-- msg        - MessageBox показать
-- openfile   - OpenFileDialog диалог
-- savefile   - SaveFileDialog диалог
-- dispatch   - Dispatcher invoke
-- async      - Асинхронный метод
-- try        - Try-catch блок
-- region     - Region директива
-- ctor       - Конструктор
-- find       - FindName поиск элемента
-- dcast      - DataContext приведение
-- xmlcom     - XML комментарий

return wpf_csharp

-- 📋 КРАТКАЯ ШПАРГАЛКА ПО C# СНИППЕТАМ:
-- wclass     - Класс окна WPF
-- pclass     - Класс страницы WPF  
-- ucclass    - Класс пользовательского контрола
-- vmclass    - ViewModel класс (MVVM)
-- click      - Обработчик клика
-- loaded     - Обработчик загрузки
-- mvvmprop   - MVVM свойство с уведомлением
-- prop       - Простое свойство
-- command    - ICommand свойство
-- relay      - RelayCommand реализация
-- dprop      - Dependency Property
-- inotify    - INotifyPropertyChanged
-- obs        - ObservableCollection
-- msg        - MessageBox показать
-- openfile   - OpenFileDialog диалог
-- savefile   - SaveFileDialog диалог
-- dispatch   - Dispatcher invoke
-- async      - Асинхронный метод
-- try        - Try-catch блок
-- region     - Region директива
-- ctor       - Конструктор
-- find       - FindName поиск элемента
-- dcast      - DataContext приведение
-- xmlcom     - XML комментарий
