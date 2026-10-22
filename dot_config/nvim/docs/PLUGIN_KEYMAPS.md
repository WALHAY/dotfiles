# Локальные бинды плагинов

Снимок действующей конфигурации и версий из `nvim-pack-lock.json` на 2026-10-22.
Личные глобальные бинды: [KEYMAPS.md](../KEYMAPS.md). Здесь указаны все записи таблиц
биндов Neo-tree, Oil, Trouble, Overseer, Octo и используемых Snacks picker.
Действия оставлены с именами из API плагинов, чтобы их легко искать в `:help`.
LocalLeader (`<localleader>`) — `\`. `n/x/o/i/t` — normal / visual / operator-pending / insert / terminal.
Некоторые команды становятся доступными только в соответствующем окне или при наличии данных.
Системные бинды Vim и неиспользуемые виды Snacks picker сюда не входят.

## Neo-tree: общие команды (`?` — справка)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<` | `n` | prev_source |
| `<2-LeftMouse>` | `n` | open |
| `<C-;>` | `n` | clear_selection |
| `<C-b>` | `n` | scroll_preview; direction=10 |
| `<C-f>` | `n` | scroll_preview; direction=-10 |
| `<C-r>` | `n` | clear_clipboard |
| `<C-S-i>` | `n` | invert_selection |
| `<C-s>` | `n` | quick_jump; jump_labels=jfkdlsahgnuvrbytmiceoxwpqz, on_jump=open_or_toggle |
| `<cr>` | `n` | open |
| `<esc>` | `n` | cancel |
| `<space>` | `n` | toggle_node |
| `<Tab>` | `n` | select |
| `>` | `n` | next_source |
| `?` | `n` | show_help |
| `A` | `n` | add_directory |
| `a` | `n` | add; show_path=relative |
| `c` | `n` | copy; show_path=relative |
| `C` | `n` | close_node |
| `d` | `n` | delete |
| `e` | `n` | toggle_auto_expand_width |
| `l` | `n` | focus_preview |
| `m` | `n` | move; show_path=relative |
| `p` | `n` | paste_from_clipboard |
| `P` | `n` | toggle_preview; use_float=true, use_image_nvim=true, use_snacks_image=true |
| `q` | `n` | close_window |
| `r` | `n` | rename; show_path=relative |
| `R` | `n` | refresh |
| `s` | `n` | open_vsplit |
| `S` | `n` | open_split |
| `t` | `n` | open_tabnew |
| `T` | `n` | trash |
| `u` | `n` | undo |
| `U` | `n` | restore_from_trash |
| `w` | `n` | open_with_window_picker |
| `x` | `n` | cut_to_clipboard |
| `y` | `n` | copy_to_clipboard |
| `z` | `n` | close_all_nodes |
| `Z` | `n` | expand_all_subnodes |

## Neo-tree: filesystem (дополняет общие команды)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `#` | `n` | fuzzy_sorter |
| `.` | `n` | set_root |
| `/` | `n` | fuzzy_finder |
| `<` | `n` | prev_source |
| `<2-LeftMouse>` | `n` | open |
| `<bs>` | `n` | navigate_up |
| `<C-;>` | `n` | clear_selection |
| `<C-b>` | `n` | scroll_preview; direction=10 |
| `<C-f>` | `n` | scroll_preview; direction=-10 |
| `<C-r>` | `n` | clear_clipboard |
| `<C-S-i>` | `n` | invert_selection |
| `<C-s>` | `n` | quick_jump; jump_labels=jfkdlsahgnuvrbytmiceoxwpqz, on_jump=open_or_toggle |
| `<C-x>` | `n` | clear_filter |
| `<cr>` | `n` | open |
| `<esc>` | `n` | cancel |
| `<space>` | `n` | toggle_node |
| `<Tab>` | `n` | select |
| `>` | `n` | next_source |
| `?` | `n` | show_help |
| `[g` | `n` | prev_git_modified |
| `]g` | `n` | next_git_modified |
| `A` | `n` | add_directory |
| `a` | `n` | add; show_path=relative |
| `b` | `n` | rename_basename |
| `c` | `n` | copy; show_path=relative |
| `C` | `n` | close_node |
| `D` | `n` | fuzzy_finder_directory |
| `d` | `n` | delete |
| `e` | `n` | toggle_auto_expand_width |
| `f` | `n` | filter_on_submit |
| `H` | `n` | toggle_hidden |
| `i` | `n` | show_file_details |
| `l` | `n` | focus_preview |
| `m` | `n` | move; show_path=relative |
| `o` | `n` | show_help; prefix_key=o, title=Order by |
| `oc` | `n` | order_by_created |
| `od` | `n` | order_by_diagnostics |
| `og` | `n` | order_by_git_status |
| `om` | `n` | order_by_modified |
| `on` | `n` | order_by_name |
| `os` | `n` | order_by_size |
| `ot` | `n` | order_by_type |
| `p` | `n` | paste_from_clipboard |
| `P` | `n` | toggle_preview; use_float=true, use_image_nvim=true, use_snacks_image=true |
| `q` | `n` | close_window |
| `r` | `n` | rename; show_path=relative |
| `R` | `n` | refresh |
| `S` | `n` | open_split |
| `s` | `n` | open_vsplit |
| `t` | `n` | open_tabnew |
| `T` | `n` | trash |
| `u` | `n` | undo |
| `U` | `n` | restore_from_trash |
| `w` | `n` | open_with_window_picker |
| `x` | `n` | cut_to_clipboard |
| `y` | `n` | copy_to_clipboard |
| `z` | `n` | close_all_nodes |
| `Z` | `n` | expand_all_subnodes |

## Neo-tree: buffers (дополняет общие команды)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `.` | `n` | set_root |
| `<` | `n` | prev_source |
| `<2-LeftMouse>` | `n` | open |
| `<bs>` | `n` | navigate_up |
| `<C-;>` | `n` | clear_selection |
| `<C-b>` | `n` | scroll_preview; direction=10 |
| `<C-f>` | `n` | scroll_preview; direction=-10 |
| `<C-r>` | `n` | clear_clipboard |
| `<C-S-i>` | `n` | invert_selection |
| `<C-s>` | `n` | quick_jump; jump_labels=jfkdlsahgnuvrbytmiceoxwpqz, on_jump=open_or_toggle |
| `<cr>` | `n` | open |
| `<esc>` | `n` | cancel |
| `<space>` | `n` | toggle_node |
| `<Tab>` | `n` | select |
| `>` | `n` | next_source |
| `?` | `n` | show_help |
| `A` | `n` | add_directory |
| `a` | `n` | add; show_path=relative |
| `b` | `n` | rename_basename |
| `bd` | `n` | buffer_delete |
| `c` | `n` | copy; show_path=relative |
| `C` | `n` | close_node |
| `d` | `n` | buffer_delete |
| `e` | `n` | toggle_auto_expand_width |
| `i` | `n` | show_file_details |
| `l` | `n` | focus_preview |
| `m` | `n` | move; show_path=relative |
| `o` | `n` | show_help; prefix_key=o, title=Order by |
| `oc` | `n` | order_by_created |
| `od` | `n` | order_by_diagnostics |
| `om` | `n` | order_by_modified |
| `on` | `n` | order_by_name |
| `os` | `n` | order_by_size |
| `ot` | `n` | order_by_type |
| `p` | `n` | paste_from_clipboard |
| `P` | `n` | toggle_preview; use_float=true, use_image_nvim=true, use_snacks_image=true |
| `q` | `n` | close_window |
| `r` | `n` | rename; show_path=relative |
| `R` | `n` | refresh |
| `s` | `n` | open_vsplit |
| `S` | `n` | open_split |
| `t` | `n` | open_tabnew |
| `T` | `n` | trash |
| `u` | `n` | undo |
| `U` | `n` | restore_from_trash |
| `w` | `n` | open_with_window_picker |
| `x` | `n` | cut_to_clipboard |
| `y` | `n` | copy_to_clipboard |
| `z` | `n` | close_all_nodes |
| `Z` | `n` | expand_all_subnodes |

## Neo-tree: git_status (дополняет общие команды)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<` | `n` | prev_source |
| `<2-LeftMouse>` | `n` | open |
| `<C-;>` | `n` | clear_selection |
| `<C-b>` | `n` | scroll_preview; direction=10 |
| `<C-f>` | `n` | scroll_preview; direction=-10 |
| `<C-r>` | `n` | clear_clipboard |
| `<C-S-i>` | `n` | invert_selection |
| `<C-s>` | `n` | quick_jump; jump_labels=jfkdlsahgnuvrbytmiceoxwpqz, on_jump=open_or_toggle |
| `<cr>` | `n` | open |
| `<esc>` | `n` | cancel |
| `<space>` | `n` | toggle_node |
| `<Tab>` | `n` | select |
| `>` | `n` | next_source |
| `?` | `n` | show_help |
| `A` | `n` | git_add_all |
| `a` | `n` | add; show_path=relative |
| `b` | `n` | rename_basename |
| `c` | `n` | copy; show_path=relative |
| `C` | `n` | close_node |
| `d` | `n` | delete |
| `e` | `n` | toggle_auto_expand_width |
| `ga` | `n` | git_add_file |
| `gc` | `n` | git_commit |
| `gg` | `n` | git_commit_and_push |
| `gl` | `n` | git_pull |
| `gp` | `n` | git_push |
| `gr` | `n` | git_revert_file |
| `gt` | `n` | git_toggle_file_stage |
| `gU` | `n` | git_undo_last_commit |
| `gu` | `n` | git_unstage_file |
| `i` | `n` | show_file_details |
| `l` | `n` | focus_preview |
| `m` | `n` | move; show_path=relative |
| `o` | `n` | show_help; prefix_key=o, title=Order by |
| `oc` | `n` | order_by_created |
| `od` | `n` | order_by_diagnostics |
| `om` | `n` | order_by_modified |
| `on` | `n` | order_by_name |
| `os` | `n` | order_by_size |
| `ot` | `n` | order_by_type |
| `p` | `n` | paste_from_clipboard |
| `P` | `n` | toggle_preview; use_float=true, use_image_nvim=true, use_snacks_image=true |
| `q` | `n` | close_window |
| `r` | `n` | rename; show_path=relative |
| `R` | `n` | refresh |
| `S` | `n` | open_split |
| `s` | `n` | open_vsplit |
| `t` | `n` | open_tabnew |
| `T` | `n` | trash |
| `u` | `n` | undo |
| `U` | `n` | restore_from_trash |
| `w` | `n` | open_with_window_picker |
| `x` | `n` | cut_to_clipboard |
| `y` | `n` | copy_to_clipboard |
| `z` | `n` | close_all_nodes |
| `Z` | `n` | expand_all_subnodes |

## Neo-tree: document_symbols (дополняет общие команды)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `/` | `n` | filter |
| `<C-r>` | `n` | noop |
| `<cr>` | `n` | jump_to_symbol |
| `a` | `n` | noop |
| `A` | `n` | noop |
| `c` | `n` | noop |
| `d` | `n` | noop |
| `f` | `n` | filter_on_submit |
| `m` | `n` | noop |
| `o` | `n` | jump_to_symbol |
| `p` | `n` | noop |
| `T` | `n` | noop |
| `u` | `n` | noop |
| `U` | `n` | noop |
| `x` | `n` | noop |
| `y` | `n` | noop |

## Oil (`g?` — справка)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `-` | `n` | actions.parent |
| `<C-c>` | `n` | actions.close |
| `<C-h>` | `n/x/o, если действие не ограничивает режим` | actions.select; horizontal=true |
| `<C-l>` | `n/x/o, если действие не ограничивает режим` | actions.refresh |
| `<C-p>` | `n/x/o, если действие не ограничивает режим` | actions.preview |
| `<C-s>` | `n/x/o, если действие не ограничивает режим` | actions.select; vertical=true |
| `<C-t>` | `n/x/o, если действие не ограничивает режим` | actions.select; tab=true |
| `<CR>` | `n/x/o, если действие не ограничивает режим` | actions.select |
| `_` | `n` | actions.open_cwd |
| ``` | `n` | actions.cd |
| `g.` | `n` | actions.toggle_hidden |
| `g?` | `n` | actions.show_help |
| `g\` | `n` | actions.toggle_trash |
| `gs` | `n` | actions.change_sort |
| `gx` | `n/x/o, если действие не ограничивает режим` | actions.open_external |
| `g~` | `n` | actions.cd; scope=tab |

## Trouble (`?` — справка)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<2-leftmouse>` | `n` | jump |
| `<c-s>` | `n` | jump_split |
| `<c-v>` | `n` | jump_vsplit |
| `<cr>` | `n` | jump |
| `<esc>` | `n` | cancel |
| `?` | `n` | help |
| `[[` | `n` | prev |
| `]]` | `n` | next |
| `d` | `v` | delete |
| `dd` | `n` | delete |
| `gb` | `n` | callback — Toggle Current Buffer Filter |
| `i` | `n` | inspect |
| `o` | `n` | jump_close |
| `P` | `n` | toggle_preview |
| `p` | `n` | preview |
| `q` | `n` | close |
| `r` | `n` | refresh |
| `R` | `n` | toggle_refresh |
| `s` | `n` | callback — Toggle Severity Filter |
| `za` | `n` | fold_toggle |
| `zA` | `n` | fold_toggle_recursive |
| `zc` | `n` | fold_close |
| `zC` | `n` | fold_close_recursive |
| `zi` | `n` | fold_toggle_enable |
| `zm` | `n` | fold_more |
| `zM` | `n` | fold_close_all |
| `zn` | `n` | fold_disable |
| `zN` | `n` | fold_enable |
| `zo` | `n` | fold_open |
| `zO` | `n` | fold_open_recursive |
| `zr` | `n` | fold_reduce |
| `zR` | `n` | fold_open_all |
| `zx` | `n` | fold_update |
| `zX` | `n` | fold_update_all |
| `{` | `n` | prev |
| `}` | `n` | next |

## Overseer: список задач (`?` / `g?` — справка)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-e>` | `n` | keymap.run_action — Edit task; action=edit |
| `<C-f>` | `n` | keymap.open — Open task output in float; dir=float |
| `<C-j>` | `n` | keymap.scroll_output_down |
| `<C-k>` | `n` | keymap.scroll_output_up |
| `<C-q>` | `n` | keymap.run_action — Open task output in the quickfix; action=open output in quickfix |
| `<C-s>` | `n` | keymap.open — Open task output in split; dir=split |
| `<C-t>` | `n` | keymap.open — Open task output in tab; dir=tab |
| `<C-v>` | `n` | keymap.open — Open task output in vsplit; dir=vsplit |
| `<CR>` | `n` | keymap.run_action |
| `?` | `n` | keymap.show_help |
| `dd` | `n` | keymap.run_action — Dispose task; action=dispose |
| `g.` | `n` | keymap.toggle_show_wrapped |
| `g?` | `n` | keymap.show_help |
| `o` | `n` | keymap.open |
| `p` | `n` | keymap.toggle_preview |
| `q` | `n` | <CMD>close<CR> — Close task list |
| `{` | `n` | keymap.prev_task |
| `}` | `n` | keymap.next_task |

## Octo: discussion

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open discussion in browser |
| `<C-y>` | `n` | copy_url — copy url to system clipboard |
| `<CR>` | `n` | discussion_options — show discussion options |
| `\ca` | `n` | add_comment — add comment |
| `\cd` | `n` | delete_comment — delete comment |
| `\ce` | `n` | comment_edits — show comment edit history |
| `\cr` | `n` | add_reply — add reply |
| `\la` | `n` | add_label — add label |
| `\ld` | `n` | remove_label — remove label |
| `\r+` | `n` | react_thumbs_up — add/remove 👍 reaction |
| `\r-` | `n` | react_thumbs_down — add/remove 👎 reaction |
| `\rc` | `n` | react_confused — add/remove 😕 reaction |
| `\re` | `n` | react_eyes — add/remove 👀 reaction |
| `\rh` | `n` | react_heart — add/remove ❤️ reaction |
| `\ri` | `n` | reference_in_new_issue — reference comment in new issue |
| `\rl` | `n` | react_laugh — add/remove 😄 reaction |
| `\rp` | `n` | react_hooray — add/remove 🎉 reaction |
| `\rr` | `n` | react_rocket — add/remove 🚀 reaction |
| `[c` | `n` | prev_comment — go to previous comment |
| `]c` | `n` | next_comment — go to next comment |

## Octo: file_panel

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-c>` | `n` | close_review_tab — close review tab |
| `<cr>` | `n` | select_entry — show selected changed file diffs |
| `\<space>` | `n` | toggle_viewed — toggle viewer viewed state |
| `\C` | `n` | review_commits — review PR commits |
| `\b` | `n` | toggle_files — hide/show changed files panel |
| `\e` | `n` | focus_files — move focus to changed file panel |
| `\vd` | `n` | discard_review — discard review |
| `\vs` | `n` | submit_review — submit review |
| `R` | `n` | refresh_files — refresh changed files panel |
| `[Q` | `n` | select_first_entry — move to first changed file |
| `[q` | `n` | select_prev_entry — move to previous changed file |
| `[u` | `n` | select_prev_unviewed_entry — move to previous unviewed file |
| `]Q` | `n` | select_last_entry — move to last changed file |
| `]q` | `n` | select_next_entry — move to next changed file |
| `]u` | `n` | select_next_unviewed_entry — move to next unviewed file |
| `j` | `n` | next_entry — move to next changed file |
| `k` | `n` | prev_entry — move to previous changed file |

## Octo: issue

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open issue in browser |
| `<C-r>` | `n` | reload — reload issue |
| `<C-y>` | `n` | copy_url — copy url to system clipboard |
| `<CR>` | `n` | issue_options — show issue options |
| `\aa` | `n` | add_assignee — add assignee |
| `\ad` | `n` | remove_assignee — remove assignee |
| `\ca` | `n` | add_comment — add comment |
| `\cd` | `n` | delete_comment — delete comment |
| `\ce` | `n` | comment_edits — show comment edit history |
| `\cr` | `n` | add_reply — add reply |
| `\gi` | `n` | goto_issue — navigate to a local repo issue |
| `\ic` | `n` | close_issue — close issue |
| `\il` | `n` | list_issues — list open issues on same repo |
| `\io` | `n` | reopen_issue — reopen issue |
| `\la` | `n` | add_label — add label |
| `\lc` | `n` | create_label — create label |
| `\ld` | `n` | remove_label — remove label |
| `\r+` | `n` | react_thumbs_up — add/remove 👍 reaction |
| `\r-` | `n` | react_thumbs_down — add/remove 👎 reaction |
| `\rc` | `n` | react_confused — add/remove 😕 reaction |
| `\re` | `n` | react_eyes — add/remove 👀 reaction |
| `\rh` | `n` | react_heart — add/remove ❤️ reaction |
| `\ri` | `n` | reference_in_new_issue — reference comment in new issue |
| `\rl` | `n` | react_laugh — add/remove 😄 reaction |
| `\rp` | `n` | react_hooray — add/remove 🎉 reaction |
| `\rr` | `n` | react_rocket — add/remove 🚀 reaction |
| `[c` | `n` | prev_comment — go to previous comment |
| `]c` | `n` | next_comment — go to next comment |

## Octo: notification

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `\nd` | `n` | done — mark notification as done |
| `\nr` | `n` | read — mark notification as read |
| `\nu` | `n` | unsubscribe — unsubscribe from notifications |

## Octo: pull_request

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open PR in browser |
| `<C-e>` | `n` | copy_sha — copy commit SHA to system clipboard |
| `<C-r>` | `n` | reload — reload PR |
| `<C-y>` | `n` | copy_url — copy url to system clipboard |
| `<CR>` | `n` | pr_options — show PR options |
| `<leader>qa` | `n` | approve_pr — approve PR |
| `\aa` | `n` | add_assignee — add assignee |
| `\ad` | `n` | remove_assignee — remove assignee |
| `\ca` | `n` | add_comment — add comment |
| `\cd` | `n` | delete_comment — delete comment |
| `\ce` | `n` | comment_edits — show comment edit history |
| `\cr` | `n` | add_reply — add reply |
| `\gc` | `n` | goto_check — open the CI check under the cursor |
| `\gi` | `n` | goto_issue — navigate to a local repo issue |
| `\ic` | `n` | close_issue — close PR |
| `\il` | `n` | list_issues — list open issues on same repo |
| `\io` | `n` | reopen_issue — reopen PR |
| `\la` | `n` | add_label — add label |
| `\lc` | `n` | create_label — create label |
| `\ld` | `n` | remove_label — remove label |
| `\pc` | `n` | list_commits — list PR commits |
| `\pd` | `n` | show_pr_diff — show PR diff |
| `\pf` | `n` | list_changed_files — list PR changed files |
| `\pk` | `n` | merge_pr_stack — merge PR stack (this PR and all below it) |
| `\pm` | `n` | merge_pr — merge commit PR |
| `\po` | `n` | checkout_pr — checkout PR |
| `\pq` | `n` | merge_pr_queue — merge commit PR and add to merge queue (Merge queue must be enabled in the repo) |
| `\prm` | `n` | rebase_and_merge_pr — rebase and merge PR |
| `\prq` | `n` | rebase_and_merge_queue — rebase and add to merge queue (Merge queue must be enabled in the repo) |
| `\psm` | `n` | squash_and_merge_pr — squash and merge PR |
| `\psq` | `n` | squash_and_merge_queue — squash and add to merge queue (Merge queue must be enabled in the repo) |
| `\r+` | `n` | react_thumbs_up — add/remove 👍 reaction |
| `\r-` | `n` | react_thumbs_down — add/remove 👎 reaction |
| `\rT` | `n` | unresolve_thread — unresolve PR thread |
| `\rc` | `n` | react_confused — add/remove 😕 reaction |
| `\re` | `n` | react_eyes — add/remove 👀 reaction |
| `\rh` | `n` | react_heart — add/remove ❤️ reaction |
| `\ri` | `n` | reference_in_new_issue — reference comment in new issue |
| `\rl` | `n` | react_laugh — add/remove 😄 reaction |
| `\rp` | `n` | react_hooray — add/remove 🎉 reaction |
| `\rr` | `n` | react_rocket — add/remove 🚀 reaction |
| `\rt` | `n` | resolve_thread — resolve PR thread |
| `\tc` | `n` | toggle_checks — fold or unfold the CI checks list |
| `\va` | `n` | add_reviewer — add reviewer |
| `\vd` | `n` | remove_reviewer — remove reviewer request |
| `\ve` | `n` | review — start or resume a review for the current PR |
| `\vr` | `n` | review_resume — resume a pending review for the current PR |
| `\vs` | `n` | review_start — start a review for the current PR |
| `[c` | `n` | prev_comment — go to previous comment |
| `[s` | `n` | stack_down — open the next PR down the stack |
| `]c` | `n` | next_comment — go to next comment |
| `]s` | `n` | stack_up — open the next PR up the stack |
| `gf` | `n` | goto_file — go to file |

## Octo: release

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open release in browser |

## Octo: repo

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open repo in browser |
| `<CR>` | `n` | repo_options — show repo options |
| `\cg` | `n` | contributing_guidelines — view contributing guidelines |
| `\dc` | `n` | create_discussion — create discussion |
| `\ic` | `n` | create_issue — create issue |

## Octo: review_diff

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-c>` | `n` | close_review_tab — close review tab |
| `<C-e>` | `n` | copy_sha — copy commit SHA to system clipboard |
| `\<space>` | `n` | toggle_viewed — toggle viewer viewed state |
| `\C` | `n` | review_commits — review PR commits |
| `\b` | `n` | toggle_files — hide/show changed files panel |
| `\ca` | `n` | add_review_comment — add a new review comment |
| `\e` | `n` | focus_files — move focus to changed file panel |
| `\sa` | `n` | add_review_suggestion — add a new review suggestion |
| `\vd` | `n` | discard_review — discard review |
| `\vs` | `n` | submit_review — submit review |
| `[Q` | `n` | select_first_entry — move to first changed file |
| `[q` | `n` | select_prev_entry — move to previous changed file |
| `[t` | `n` | prev_thread — move to previous thread |
| `[u` | `n` | select_prev_unviewed_entry — move to previous unviewed file |
| `]Q` | `n` | select_last_entry — move to last changed file |
| `]q` | `n` | select_next_entry — move to next changed file |
| `]t` | `n` | next_thread — move to next thread |
| `]u` | `n` | select_next_unviewed_entry — move to next unviewed file |
| `gf` | `n` | goto_file — go to file |

## Octo: review_thread

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-c>` | `n` | close_review_tab — close review tab |
| `\ca` | `n` | add_comment — add comment |
| `\cd` | `n` | delete_comment — delete comment |
| `\ce` | `n` | comment_edits — show comment edit history |
| `\cr` | `n` | add_reply — add reply |
| `\gi` | `n` | goto_issue — navigate to a local repo issue |
| `\r+` | `n` | react_thumbs_up — add/remove 👍 reaction |
| `\r-` | `n` | react_thumbs_down — add/remove 👎 reaction |
| `\rT` | `n` | unresolve_thread — unresolve PR thread |
| `\rc` | `n` | react_confused — add/remove 😕 reaction |
| `\re` | `n` | react_eyes — add/remove 👀 reaction |
| `\rh` | `n` | react_heart — add/remove ❤️ reaction |
| `\ri` | `n` | reference_in_new_issue — reference comment in new issue |
| `\rl` | `n` | react_laugh — add/remove 😄 reaction |
| `\rp` | `n` | react_hooray — add/remove 🎉 reaction |
| `\rr` | `n` | react_rocket — add/remove 🚀 reaction |
| `\rt` | `n` | resolve_thread — resolve PR thread |
| `\sa` | `n` | add_suggestion — add suggestion |
| `[Q` | `n` | select_first_entry — move to first changed file |
| `[c` | `n` | prev_comment — go to previous comment |
| `[q` | `n` | select_prev_entry — move to previous changed file |
| `[u` | `n` | select_prev_unviewed_entry — move to previous unviewed file |
| `]Q` | `n` | select_last_entry — move to last changed file |
| `]c` | `n` | next_comment — go to next comment |
| `]q` | `n` | select_next_entry — move to next changed file |
| `]u` | `n` | select_next_unviewed_entry — move to next unviewed file |

## Octo: runs

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-b>` | `n` | open_in_browser — open workflow run in browser |
| `<C-f>` | `n` | rerun_failed — rerun failed workflow |
| `<C-o>` | `n` | rerun — rerun workflow |
| `<C-r>` | `n` | refresh — refresh workflow |
| `<C-x>` | `n` | cancel — cancel workflow |
| `<C-y>` | `n` | copy_url — copy url to system clipboard |
| `[j` | `n` | prev_job — previous workflow job |
| `[s` | `n` | prev_step — previous workflow step |
| `]j` | `n` | next_job — next workflow job |
| `]s` | `n` | next_step — next workflow step |
| `o` | `n` | expand_step — expand workflow step |

## Octo: submit_win

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-a>` | `n` | approve_review — approve review |
| `<C-c>` | `n` | close_review_tab — close review tab |
| `<C-m>` | `n` | comment_review — comment review |
| `<C-r>` | `n` | request_changes — request changes review |

## Snacks picker: input (`?` — справка в normal)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `/` | `n` | toggle_focus |
| `<C-A>` | `n, i` | select_all |
| `<C-B>` | `i, n` | preview_scroll_up |
| `<C-C>` | `i` | cancel |
| `<C-D>` | `i, n` | list_scroll_down |
| `<C-Down>` | `i, n` | history_forward |
| `<C-F>` | `i, n` | preview_scroll_down |
| `<C-G>` | `i, n` | toggle_live |
| `<C-J>` | `i, n` | list_down |
| `<C-K>` | `i, n` | list_up |
| `<C-N>` | `i, n` | list_down |
| `<C-P>` | `i, n` | list_up |
| `<C-Q>` | `i, n` | qflist |
| `<C-R>#` | `i` | insert_alt |
| `<C-R>%` | `i` | insert_filename |
| `<C-R><C-A>` | `i` | insert_cWORD |
| `<C-R><C-F>` | `i` | insert_file |
| `<C-R><C-L>` | `i` | insert_line |
| `<C-R><C-P>` | `i` | insert_file_full |
| `<C-R><C-W>` | `i` | insert_cword |
| `<C-S>` | `i, n` | edit_split |
| `<C-T>` | `n, i` | tab |
| `<C-U>` | `i, n` | list_scroll_up |
| `<C-Up>` | `i, n` | history_back |
| `<C-V>` | `i, n` | edit_vsplit |
| `<C-W>` | `i` | <c-s-w> — delete word |
| `<C-W>H` | `n` | layout_left |
| `<C-W>J` | `n` | layout_bottom |
| `<C-W>K` | `n` | layout_top |
| `<C-W>L` | `n` | layout_right |
| `<CR>` | `n, i` | confirm |
| `<Down>` | `i, n` | list_down |
| `<Esc>` | `n` | cancel |
| `<M-d>` | `n, i` | inspect |
| `<M-f>` | `i, n` | toggle_follow |
| `<M-h>` | `i, n` | toggle_hidden |
| `<M-i>` | `i, n` | toggle_ignored |
| `<M-m>` | `i, n` | toggle_maximize |
| `<M-p>` | `i, n` | toggle_preview |
| `<M-r>` | `i, n` | toggle_regex |
| `<M-w>` | `i, n` | cycle_win |
| `<S-CR>` | `n, i` | pick_win, jump |
| `<S-Tab>` | `i, n` | select_and_prev |
| `<Tab>` | `i, n` | select_and_next |
| `<Up>` | `i, n` | list_up |
| `?` | `n` | toggle_help_input |
| `G` | `n` | list_bottom |
| `gg` | `n` | list_top |
| `j` | `n` | list_down |
| `k` | `n` | list_up |
| `q` | `n` | cancel |

## Snacks picker: list (`?` — справка в normal)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `/` | `n` | toggle_focus |
| `<2-LeftMouse>` | `n` | confirm |
| `<C-A>` | `n` | select_all |
| `<C-B>` | `n` | preview_scroll_up |
| `<C-D>` | `n` | list_scroll_down |
| `<C-F>` | `n` | preview_scroll_down |
| `<C-G>` | `n` | print_path |
| `<C-J>` | `n` | list_down |
| `<C-K>` | `n` | list_up |
| `<C-N>` | `n` | list_down |
| `<C-P>` | `n` | list_up |
| `<C-Q>` | `n` | qflist |
| `<C-S>` | `n` | edit_split |
| `<C-T>` | `n` | tab |
| `<C-U>` | `n` | list_scroll_up |
| `<C-V>` | `n` | edit_vsplit |
| `<C-W>H` | `n` | layout_left |
| `<C-W>J` | `n` | layout_bottom |
| `<C-W>K` | `n` | layout_top |
| `<C-W>L` | `n` | layout_right |
| `<CR>` | `n` | confirm |
| `<Down>` | `n` | list_down |
| `<Esc>` | `n` | cancel |
| `<M-d>` | `n` | inspect |
| `<M-f>` | `n` | toggle_follow |
| `<M-h>` | `n` | toggle_hidden |
| `<M-i>` | `n` | toggle_ignored |
| `<M-m>` | `n` | toggle_maximize |
| `<M-p>` | `n` | toggle_preview |
| `<M-w>` | `n` | cycle_win |
| `<S-CR>` | `n` | ['pick_win', 'jump'] |
| `<S-Tab>` | `n, x` | select_and_prev |
| `<Tab>` | `n, x` | select_and_next |
| `<Up>` | `n` | list_up |
| `?` | `n` | toggle_help_list |
| `G` | `n` | list_bottom |
| `gg` | `n` | list_top |
| `i` | `n` | focus_input |
| `j` | `n` | list_down |
| `k` | `n` | list_up |
| `q` | `n` | cancel |
| `zb` | `n` | list_scroll_bottom |
| `zt` | `n` | list_scroll_top |
| `zz` | `n` | list_scroll_center |

## Snacks picker: preview (`?` — справка в normal)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<Esc>` | `n` | cancel |
| `<M-w>` | `n` | cycle_win |
| `i` | `n` | focus_input |
| `q` | `n` | cancel |

## Snacks buffers: list (дополнения)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `dd` | `n` | bufdelete |

## Snacks buffers: input (дополнения)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<C-X>` | `n, i` | bufdelete |

## Snacks keymaps: input (дополнения)

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<M-b>` | `n, i` | toggle_buffer — Toggle Buffer Keymaps |
| `<M-g>` | `n, i` | toggle_global — Toggle Global Keymaps |

## Конфликты Git

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `co` | `n` | Оставить нашу часть |
| `ct` | `n` | Оставить входящую часть |
| `cb` | `n` | Оставить обе части |
| `c0` | `n` | Удалить обе части |
| `[x`, `]x` | `n` | Предыдущий / следующий конфликт |

Бинды создаются локально в буферах с обнаруженными конфликтами.

## MiniStarter

| Клавиши | Режим | Действие |
| --- | --- | --- |
| `<CR>` | `n` | Выполнить выбранный пункт |
| `<Up>`, `<C-p>`, `<M-k>` | `n` | Предыдущий пункт |
| `<Down>`, `<C-n>`, `<M-j>` | `n` | Следующий пункт |
| `a-z`, `0-9`, `_`, `-`, `.` | `n` | Добавить символ к поисковому запросу |
| `<BS>` | `n` | Удалить последний символ запроса |
| `<Esc>` | `n` | Очистить запрос |
| `<C-c>` | `n` | Закрыть стартовый экран |

Единственный результат запускается по Enter (`evaluate_single = false`), как в последнем setup исходного конфига.

## Flash

В конфиге назначены `s` и `S` (см. основную шпаргалку). Flash также расширяет поиск
`f`, `F`, `t`, `T` и повторение `;`, `,` в `n/x/o`, показывая совпадения.
Это включено стандартными настройками Flash; сама функциональность присутствовала и при первом вызове Flash в исходном конфиге.

Gitsigns настроен без `on_attach`; личные `[c` / `]c` назначены в общем файле биндов
и сохраняют стандартные переходы в diff. В окнах Octo их перекрывают локальные переходы по комментариям.
Kotlin, IntelliJ server и Gradle используются через команды и интерфейсы;
личные сочетания для них находятся в основной шпаргалке.
