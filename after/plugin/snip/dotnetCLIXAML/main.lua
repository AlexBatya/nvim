local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- 📋 КРАТКАЯ ШПАРГАЛКА ПО КОМАНДАМ
-- win       - Окно приложения
-- page      - Страница навигации
-- grid      - Табличная компоновка
-- stack     - Вертикальное/горизонтальное расположение
-- dock      - Прикрепление к краям
-- border    - Рамка вокруг содержимого
-- scroll    - Прокрутка содержимого
-- btn       - Кнопка
-- txt       - Поле ввода текста
-- label     - Метка
-- textblock - Текстовый блок
-- check     - Флажок
-- radio     - Радиокнопка
-- combo     - Выпадающий список
-- list      - Список элементов
-- slider    - Ползунок
-- progress  - Индикатор прогресса
-- image     - Изображение
-- menu      - Главное меню
-- menuitem  - Пункт меню
-- mclick    - Пункт меню с обработчиком
-- msep      - Разделитель в меню
-- context   - Контекстное меню
-- toolbar   - Панель инструментов
-- datagrid  - Таблица данных
-- template  - Шаблон данных
-- style     - Стиль элементов
-- bind      - Привязка данных
-- static    - Статический ресурс
-- rotate    - Вращение
-- scale     - Масштабирование
-- translate - Перемещение
-- blur      - Размытие
-- shadow    - Тень
-- storyboard- Контейнер анимаций
-- dblanim   - Анимация чисел
-- coloranim - Анимация цвета
-- rectangle - Прямоугольник
-- ellipse   - Эллипс/круг
-- line      - Линия
-- polygon   - Многоугольник
-- flow      - Потоковый документ
-- paragraph - Параграф текста
-- bold      - Жирный текст
-- italic    - Курсив
-- margin    - Внешние отступы
-- padding   - Внутренние отступы
-- width     - Ширина
-- height    - Высота
-- background- Фон
-- foreground- Цвет текста
-- fontsize  - Размер шрифта
-- visibility- Видимость
-- date      - Выбор даты
-- calendar  - Календарь
-- media     - Медиапроигрыватель
-- web       - Веб-браузер

local wpf_xaml_full = {}

function wpf_xaml_full.add_snip()
    -- Основные контейнеры
    ls.add_snippets("xaml", {
        s("win", fmt(
        [[
<Window x:Class="{}"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="{}" Height="{}" Width="{}">
    {}
</Window>
]], { i(1, "Namespace.MainWindow"), i(2, "Заголовок"), i(3, "450"), i(4, "800"), i(0) })
        ),

        s("page", fmt(
        [[
<Page x:Class="{}"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      Title="{}">
    {}
</Page>
]], { i(1, "Namespace.MainPage"), i(2, "Заголовок"), i(0) })
        ),

        s("usercontrol", fmt(
        [[
<UserControl x:Class="{}"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
    {}
</UserControl>
]], { i(1, "Namespace.MyUserControl"), i(0) })
        ),

        s("resource", fmt(
        [[
<ResourceDictionary
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
    {}
</ResourceDictionary>
]], { i(0) })
        )
    })

    -- Панели компоновки
    ls.add_snippets("xaml", {
        s("grid", fmt(
        [[
<Grid>
    {}
</Grid>
]], { i(0) })
        ),

        s("stack", fmt(
        [[
<StackPanel>
    {}
</StackPanel>
]], { i(0) })
        ),

        s("dock", fmt(
        [[
<DockPanel>
    {}
</DockPanel>
]], { i(0) })
        ),

        s("wrap", fmt(
        [[
<WrapPanel>
    {}
</WrapPanel>
]], { i(0) })
        ),

        s("canvas", fmt(
        [[
<Canvas>
    {}
</Canvas>
]], { i(0) })
        ),

        s("uniform", fmt(
        [[
<UniformGrid>
    {}
</UniformGrid>
]], { i(0) })
        ),

        s("viewbox", fmt(
        [[
<Viewbox>
    {}
</Viewbox>
]], { i(0) })
        ),

        s("border", fmt(
        [[
<Border>
    {}
</Border>
]], { i(0) })
        ),

        s("scroll", fmt(
        [[
<ScrollViewer>
    {}
</ScrollViewer>
]], { i(0) })
        ),

        s("group", fmt(
        [[
<GroupBox Header="{}">
    {}
</GroupBox>
]], { i(1, "Заголовок"), i(0) })
        )
    })

    -- Элементы управления
    ls.add_snippets("xaml", {
        s("btn", fmt(
        [[
<Button Content="{}" Click="{}"/>
]], { i(1, "Кнопка"), i(2, "Button_Click") })
        ),

        s("txt", fmt(
        [[
<TextBox Text="{}" Width="{}"/>
]], { i(1, "Текст"), i(2, "200") })
        ),

        s("label", fmt(
        [[
<Label Content="{}"/>
]], { i(1, "Метка") })
        ),

        s("textblock", fmt(
        [[
<TextBlock Text="{}"/>
]], { i(1, "Текст") })
        ),

        s("check", fmt(
        [[
<CheckBox Content="{}" IsChecked="{}"/>
]], { i(1, "Чекбокс"), i(2, "False") })
        ),

        s("radio", fmt(
        [[
<RadioButton Content="{}" GroupName="{}"/>
]], { i(1, "Радиокнопка"), i(2, "Group1") })
        ),

        s("combo", fmt(
        [[
<ComboBox>
    {}
</ComboBox>
]], { i(0) })
        ),

        s("list", fmt(
        [[
<ListBox>
    {}
</ListBox>
]], { i(0) })
        ),

        s("listview", fmt(
        [[
<ListView>
    {}
</ListView>
]], { i(0) })
        ),

        s("tree", fmt(
        [[
<TreeView>
    {}
</TreeView>
]], { i(0) })
        ),

        s("slider", fmt(
        [[
<Slider Minimum="{}" Maximum="{}" Value="{}"/>
]], { i(1, "0"), i(2, "100"), i(3, "50") })
        ),

        s("progress", fmt(
        [[
<ProgressBar Value="{}" Minimum="{}" Maximum="{}"/>
]], { i(1, "50"), i(2, "0"), i(3, "100") })
        ),

        s("image", fmt(
        [[
<Image Source="{}" Width="{}" Height="{}"/>
]], { i(1, "image.png"), i(2, "100"), i(3, "100") })
        ),

        s("media", fmt(
        [[
<MediaElement Source="{}"/>
]], { i(1, "video.wmv") })
        ),

        s("date", fmt(
        [[
<DatePicker/>
]], {})
        ),

        s("calendar", fmt(
        [[
<Calendar/>
]], {})
        )
    })

    -- Menu и Toolbar
    ls.add_snippets("xaml", {
        s("menu", fmt(
        [[
<Menu>
    {}
</Menu>
]], { i(0) })
        ),

        s("menuitem", fmt(
        [[
<MenuItem Header="{}">
    {}
</MenuItem>
]], { i(1, "Пункт меню"), i(0) })
        ),

        s("mclick", fmt(
        [[
<MenuItem Header="{}" Click="{}"/>
]], { i(1, "Пункт меню"), i(2, "MenuItem_Click") })
        ),

        s("msep", t('<Separator/>')),

        s("micon", fmt(
        [[
<MenuItem Header="{}">
    <MenuItem.Icon>
        <Image Source="{}" Width="16" Height="16"/>
    </MenuItem.Icon>
</MenuItem>
]], { i(1, "Пункт меню"), i(2, "icon.png") })
        ),

        s("toolbar", fmt(
        [[
<ToolBar>
    {}
</ToolBar>
]], { i(0) })
        ),

        s("toolbartray", fmt(
        [[
<ToolBarTray>
    {}
</ToolBarTray>
]], { i(0) })
        ),

        s("context", fmt(
        [[
<ContextMenu>
    {}
</ContextMenu>
]], { i(0) })
        )
    })

    -- Data-related элементы
    ls.add_snippets("xaml", {
        s("datagrid", fmt(
        [[
<DataGrid>
    {}
</DataGrid>
]], { i(0) })
        ),

        s("itemscontrol", fmt(
        [[
<ItemsControl>
    {}
</ItemsControl>
]], { i(0) })
        ),

        s("content", fmt(
        [[
<ContentControl Content="{}"/>
]], { i(1, "Содержимое") })
        ),

        s("items", fmt(
        [[
<ItemsControl ItemsSource="{{Binding {}}}">
    {}
</ItemsControl>
]], { i(1, "Items"), i(0) })
        ),

        s("template", fmt(
        [[
<DataTemplate>
    {}
</DataTemplate>
]], { i(0) })
        ),

        s("style", fmt(
        [[
<Style TargetType="{}">
    {}
</Style>
]], { i(1, "Button"), i(0) })
        ),

        s("binding", fmt(
        [[
Binding {{}} {}
]], { i(0) })
        ),

        s("bind", fmt(
        [[
{{Binding {}}}
]], { i(1, "PropertyName") })
        ),

        s("bindpath", fmt(
        [[
{{Binding Path={}}}
]], { i(1, "PropertyName") })
        ),

        s("static", fmt(
        [[
{{StaticResource {}}}
]], { i(1, "ResourceKey") })
        ),

        s("dynamic", fmt(
        [[
{{DynamicResource {}}}
]], { i(1, "ResourceKey") })
        )
    })

    -- Декораторы и эффекты
    ls.add_snippets("xaml", {
        s("transform", fmt(
        [[
<{}.RenderTransform>
    {}
</{}.RenderTransform>
]], { i(1, "UIElement"), i(0), rep(1) })
        ),

        s("rotate", fmt(
        [[
<RotateTransform Angle="{}"/>
]], { i(1, "0") })
        ),

        s("scale", fmt(
        [[
<ScaleTransform ScaleX="{}" ScaleY="{}"/>
]], { i(1, "1"), i(2, "1") })
        ),

        s("translate", fmt(
        [[
<TranslateTransform X="{}" Y="{}"/>
]], { i(1, "0"), i(2, "0") })
        ),

        s("skew", fmt(
        [[
<SkewTransform AngleX="{}" AngleY="{}"/>
]], { i(1, "0"), i(2, "0") })
        ),

        s("transformgroup", fmt(
        [[
<TransformGroup>
    {}
</TransformGroup>
]], { i(0) })
        ),

        s("effect", fmt(
        [[
<{}.Effect>
    {}
</{}.Effect>
]], { i(1, "UIElement"), i(0), rep(1) })
        ),

        s("blur", fmt(
        [[
<BlurEffect Radius="{}"/>
]], { i(1, "5") })
        ),

        s("shadow", fmt(
        [[
<DropShadowEffect BlurRadius="{}" ShadowDepth="{}"/>
]], { i(1, "5"), i(2, "3") })
        )
    })

    -- Анимации
    ls.add_snippets("xaml", {
        s("storyboard", fmt(
        [[
<Storyboard>
    {}
</Storyboard>
]], { i(0) })
        ),

        s("dblanim", fmt(
        [[
<DoubleAnimation Storyboard.TargetProperty="{}"
                 From="{}" To="{}" Duration="0:0:{}"/>
]], { i(1, "Opacity"), i(2, "0"), i(3, "1"), i(4, "1") })
        ),

        s("coloranim", fmt(
        [[
<ColorAnimation Storyboard.TargetProperty="{}"
                From="{}" To="{}" Duration="0:0:{}"/>
]], { i(1, "Background.Color"), i(2, "Red"), i(3, "Blue"), i(4, "1") })
        ),

        s("pointanim", fmt(
        [[
<PointAnimation Storyboard.TargetProperty="{}"
                From="{}" To="{}" Duration="0:0:{}"/>
]], { i(1, "RenderTransformOrigin"), i(2, "0,0"), i(3, "1,1"), i(4, "1") })
        )
    })

    -- Триггеры
    ls.add_snippets("xaml", {
        s("trigger", fmt(
        [[
<Trigger Property="{}" Value="{}">
    {}
</Trigger>
]], { i(1, "IsMouseOver"), i(2, "True"), i(0) })
        ),

        s("datatrigger", fmt(
        [[
<DataTrigger Binding="{{Binding {}}}" Value="{}">
    {}
</DataTrigger>
]], { i(1, "PropertyName"), i(2, "Value"), i(0) })
        ),

        s("eventtrigger", fmt(
        [[
<EventTrigger RoutedEvent="{}">
    {}
</EventTrigger>
]], { i(1, "MouseEnter"), i(0) })
        ),

        s("multitrigger", fmt(
        [[
<MultiTrigger>
    {}
</MultiTrigger>
]], { i(0) })
        ),

        s("multidatatrigger", fmt(
        [[
<MultiDataTrigger>
    {}
</MultiDataTrigger>
]], { i(0) })
        )
    })

    -- Shapes и Brushes
    ls.add_snippets("xaml", {
        s("rectangle", fmt(
        [[
<Rectangle Width="{}" Height="{}" Fill="{}"/>
]], { i(1, "100"), i(2, "50"), i(3, "Red") })
        ),

        s("ellipse", fmt(
        [[
<Ellipse Width="{}" Height="{}" Fill="{}"/>
]], { i(1, "100"), i(2, "100"), i(3, "Blue") })
        ),

        s("line", fmt(
        [[
<Line X1="{}" Y1="{}" X2="{}" Y2="{}" Stroke="{}"/>
]], { i(1, "0"), i(2, "0"), i(3, "100"), i(4, "100"), i(5, "Black") })
        ),

        s("polygon", fmt(
        [[
<Polygon Points="{}" Fill="{}"/>
]], { i(1, "0,0 100,0 50,100"), i(2, "Green") })
        ),

        s("path", fmt(
        [[
<Path Data="{}" Fill="{}"/>
]], { i(1, "M0,0 L100,0 L50,100 Z"), i(2, "Yellow") })
        ),

        s("solid", fmt(
        [[
<SolidColorBrush Color="{}"/>
]], { i(1, "Red") })
        ),

        s("linear", fmt(
        [[
<LinearGradientBrush>
    {}
</LinearGradientBrush>
]], { i(0) })
        ),

        s("radial", fmt(
        [[
<RadialGradientBrush>
    {}
</RadialGradientBrush>
]], { i(0) })
        ),

        s("gradientstop", fmt(
        [[
<GradientStop Offset="{}" Color="{}"/>
]], { i(1, "0"), i(2, "Red") })
        )
    })

    -- Документы
    ls.add_snippets("xaml", {
        s("flow", fmt(
        [[
<FlowDocument>
    {}
</FlowDocument>
]], { i(0) })
        ),

        s("fixed", fmt(
        [[
<FixedDocument>
    {}
</FixedDocument>
]], { i(0) })
        ),

        s("paragraph", fmt(
        [[
<Paragraph>
    {}
</Paragraph>
]], { i(0) })
        ),

        s("run", fmt(
        [[
<Run Text="{}"/>
]], { i(1, "Текст") })
        ),

        s("span", fmt(
        [[
<Span>
    {}
</Span>
]], { i(0) })
        ),

        s("bold", fmt(
        [[
<Bold>
    {}
</Bold>
]], { i(0) })
        ),

        s("italic", fmt(
        [[
<Italic>
    {}
</Italic>
]], { i(0) })
        ),

        s("underline", fmt(
        [[
<Underline>
    {}
</Underline>
]], { i(0) })
        )
    })

    -- 3D элементы
    ls.add_snippets("xaml", {
        s("viewport3d", fmt(
        [[
<Viewport3D>
    {}
</Viewport3D>
]], { i(0) })
        ),

        s("modelvisual3d", fmt(
        [[
<ModelVisual3D>
    {}
</ModelVisual3D>
]], { i(0) })
        ),

        s("geometrymodel3d", fmt(
        [[
<GeometryModel3D>
    {}
</GeometryModel3D>
]], { i(0) })
        ),

        s("meshgeometry3d", fmt(
        [[
<MeshGeometry3D Positions="{}" TriangleIndices="{}"/>
]], { i(1, "-1,-1,0 1,-1,0 -1,1,0 1,1,0"), i(2, "0,1,2 1,3,2") })
        ),

        s("directional", fmt(
        [[
<DirectionalLight Color="{}" Direction="{}"/>
]], { i(1, "White"), i(2, "-1,-1,-1") })
        )
    })

    -- Windows Forms integration
    ls.add_snippets("xaml", {
        s("winform", fmt(
        [[
<WindowsFormsHost>
    {}
</WindowsFormsHost>
]], { i(0) })
        ),

        s("wfh", fmt(
        [[
<WindowsFormsHost Name="{}">
    {}
</WindowsFormsHost>
]], { i(1, "windowsFormsHost1"), i(0) })
        )
    })

    -- Common properties
    ls.add_snippets("xaml", {
        s("margin", fmt(
        [[
Margin="{}"
]], { i(1, "5") })
        ),

        s("padding", fmt(
        [[
Padding="{}"
]], { i(1, "5") })
        ),

        s("width", fmt(
        [[
Width="{}"
]], { i(1, "100") })
        ),

        s("height", fmt(
        [[
Height="{}"
]], { i(1, "100") })
        ),

        s("horizontal", fmt(
        [[
HorizontalAlignment="{}"
]], { i(1, "Left") })
        ),

        s("vertical", fmt(
        [[
VerticalAlignment="{}"
]], { i(1, "Top") })
        ),

        s("background", fmt(
        [[
Background="{}"
]], { i(1, "White") })
        ),

        s("foreground", fmt(
        [[
Foreground="{}"
]], { i(1, "Black") })
        ),

        s("fontsize", fmt(
        [[
FontSize="{}"
]], { i(1, "12") })
        ),

        s("fontweight", fmt(
        [[
FontWeight="{}"
]], { i(1, "Normal") })
        ),

        s("visibility", fmt(
        [[
Visibility="{}"
]], { i(1, "Visible") })
        ),

        s("isenabled", fmt(
        [[
IsEnabled="{}"
]], { i(1, "True") })
        )
    })
end

return wpf_xaml_full
