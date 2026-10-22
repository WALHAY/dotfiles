# Neovim

Конфигурация для **Neovim 0.12+** с встроенным менеджером `vim.pack`.
Основные языки: Java, Kotlin, C, C++, Lua, Bash, SQL.
Шпаргалка: [KEYMAPS.md](KEYMAPS.md); локальные команды плагинов: [PLUGIN_KEYMAPS.md](docs/PLUGIN_KEYMAPS.md).

## Структура

```text
init.lua                       Leader и последовательность загрузки
lua/config/options.lua         Общие опции редактора
lua/config/packages.lua        Единственный список плагинов и очистка пакетов
lua/config/keymaps.lua         Все личные сочетания с описаниями
lua/plugins/init.lua           Явный порядок setup модулей
lua/plugins/ui/                Тема, Noice, Notify, статус, стартовый экран, Discord
lua/plugins/navigation/        Snacks, Neo-tree, Oil, Flash
lua/plugins/editor/            Blink, Tabout, Treesitter, Conform, Trouble
lua/plugins/lsp/               Mason, общие LSP, Java, Kotlin
lua/plugins/git/               Gitsigns, конфликты, Octo
lua/plugins/tasks/             Overseer, Gradle
lua/plugins/sessions.lua       Сессии и сохранение
lua/overseer/template/gradle/   Собственные Gradle-шаблоны
lsp/lua_ls.lua                 Настройки Lua language server
scripts/generate-keymaps.lua   Обновление Markdown-таблицы личных биндов
nvim-pack-lock.json            Закреплённые версии плагинов
.stylua.toml                   Единый стиль Lua
```

В `plugin/` раньше находились автоматически загружаемые настройки с неявным порядком.
Теперь `init.lua` регистрирует зависимости, затем вызывает setup модулей в порядке из
`lua/plugins/init.lua` и назначает личные бинды. Новый модуль добавляется в этот список;
новый плагин — в `lua/config/packages.lua`. `lua/options.lua` и `lua/binds.lua` — совместимые
ссылки на новые модули для старых `require`.

## Языковые инструменты

| Язык | LSP | Форматтер Conform |
| --- | --- | --- |
| Java | `intellij-server.nvim` → IntelliJ server | `palantir-java-format` |
| Kotlin | `kotlin.nvim` → IntelliJ/Kotlin LSP | `ktlint` |
| C, C++ | `clangd` | `clang-format` |
| Lua | `lua_ls` | `stylua` |
| Bash / sh | `bashls` | `shfmt` |
| SQL | Пока не настроен | `sqruff` |

Mason обеспечивает PATH для установленных через него программ. В `ensure_installed` указаны
`lua_ls`, `clangd`, `bashls`, `kotlin_lsp`. Java/Kotlin настраиваются своими плагинами;
Mason не включает конкурирующие JVM-серверы автоматически. Возможности Blink назначаются
перед включением LSP. SQL-сервер не выбран автоматически: его настройка зависит от используемой базы.

Во время проверки доступны `clangd` и `intellij-server` в Mason. `lua-language-server`,
`bash-language-server`, `stylua`, `sqruff`, `palantir-java-format`, `ktlint`, `clang-format`,
`shfmt` в проверенном PATH отсутствуют. Открыть `:Mason` и установить нужные инструменты;
`palantir-java-format` может потребовать отдельной установки. Форматтеры не запускаются при сохранении:
форматирование остаётся ручным, на `<Space>bf`. Диагностика форматтеров — `:ConformInfo`.

Для Kotlin установленный IntelliJ server также может использоваться плагином; проверять
конкретный проект через `:KotlinHealth`. Для Java нужен настроенный IntelliJ server и его окружение.
Для поиска нужен `rg`, для Octo — `gh` с авторизацией (`gh auth login`).
Для иконок рекомендуется Nerd Font. Treesitter устанавливает недостающие парсеры при обычном
интерактивном запуске; нужны `tree-sitter` CLI и C-компилятор, подробности — `:checkhealth nvim-treesitter`.

## Что исправлено

- Один setup MiniStarter, MiniSessions и Trouble, без глобальных функций `setup` / `setup_sessions`.
- Noice отвечает за сообщения и командную строку; приватный `vim._core.ui2` убран.
  Уведомления ведёт `nvim-notify`; второй backend Snacks notifier выключен.
- Winbar настраивается через Lualine; конкурирующий setup Breadcrumbs убран,
  сам плагин оставлен в списке. Опции Navic перенесены на правильный уровень.
- Размер окна Snacks исправлен по текущему API. Неиспользуемые поля конфигурации убраны.
- Blink и Tabout согласованы для Tab и Shift-Tab; выбор дополнений по Enter сохранён.
- Gradle-шаблоны запускаются от корня найденного `gradlew`; `build --continuous` передаёт
  отдельные аргументы. Исправлены параметры quickfix-компонента и настройки окон Overseer.
- Очистка буферов сохраняет несохранённые и сообщает о пропущенных.
  Выбор удаления сессии использует актуальный список MiniSessions.
- Добавлены постоянная история undo, форматирование Bash и парсеры SQL/Markdown.
- Личные бинды собраны в одном файле; полный перечень изменений — в [KEYMAPS.md](KEYMAPS.md).
- Добавлены переходы между окнами (в том числе из терминала), движение по экранным строкам,
  LSP-переходы `gd` / `gD`, переходы по Git-изменениям и только ошибкам, поиск меток,
  недавних файлов и символов проекта. Встроенные переходы не назначаются повторно;
  дубль поиска файлов `<Space>ff` удалён, поиск остаётся на `<C-p>`.
- Runic удалён вместе с Codeforces и его биндами. Он автоматически выбирал запуск проекта
  или файла и обеспечивал отдельный процесс для Codeforces. Теперь задачи выполняются через Overseer,
  Gradle доступен через свои панели и шаблоны. Запуск: `<Space>rj`, список: `<Space>rr`,
  действия и повторный запуск: `<Space>ra`, произвольная команда: `:OverseerShell`.

Тема Citruszest с прозрачностью, отступы в 4 позиции, wrap, диагностика, ручной folding,
авточтение и автозапись сессий сохранены. Закреплённые ревизии остальных плагинов сохранены.
Spring Boot, Telescope и Breadcrumbs остаются доступными, хотя отдельный setup для них не вызывается.

## Проверка и обслуживание

```vim
:checkhealth vim.lsp mason blink.cmp nvim-treesitter conform which-key
:ConformInfo
:KotlinHealth
:lua vim.pack.update()
```

`<Space>pc` показывает неактивные плагины и просит подтверждение удаления.
`nvim-pack-lock.json` стоит хранить в Git. `.gitignore` исключает лог и локальные файлы сессий.

```sh
nvim --clean --headless -l scripts/generate-keymaps.lua
stylua --check init.lua lua lsp scripts
```

Проверены синтаксис Lua, загрузка Neovim 0.12.5, регистрация личных биндов и команд,
размер Snacks picker, создание всех Gradle-шаблонов из вложенной папки и сохранность изменённых буферов.
В проверке загрузки отключались сетевое обновление Mason, установка парсеров и Discord-интеграция.
Подключение LSP к реальным проектам, сборка Gradle и GitHub/Discord требуют отдельной проверки в рабочем окружении.

После расширения навигации проверены отсутствие повторных назначений личных биндов,
сохранность встроенных биндов, движение по перенесённым строкам и с числовым счётчиком,
движения после оператора, переходы только по ошибкам и переключение окон из normal / terminal.
На временном Git-репозитории проверены переходы Gitsigns, числовой счётчик и стандартное движение в diff.
Полная загрузка конфигурации и команды Overseer/Gradle проверены с отключённым обновлением Mason,
чтением/записью сессий и Discord; Runic больше не загружается.

## Резервная копия

Исходный конфиг сохранён в `../nvim-backups/20261022-200439`.
Версия перед добавлением навигации и удалением Runic — `../nvim-backups/20261022-203804-before-navigation`.
Для отката закрыть Neovim, сохранить новую версию отдельно и заменить каталог `nvim`
этой резервной копией.
