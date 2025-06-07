# My Tmux Configuration

![image](https://github.com/user-attachments/assets/55011759-fe6e-4a60-a525-221f663922bc)

This is my custom `tmux` configuration optimized for development workflows.

## Features

### 📊 Status Bar Overview

In the top-right corner of the status bar, you'll find:
- 🔋 **Battery status**
- 🌐 **Network interface** name and real-time network speed
- 📡 **Current IP address**
- 🌀 **Git branch indicator** (only visible when in a Git repository)
  
---

## 🔑 Keybindings

### Basic Tmux Keybinds

| Keybind        | Action                                      |
|----------------|---------------------------------------------|
| `\`           | Horizontal split (same directory)           |
| `-`            | Vertical split (same directory)             |
| `C-h/j/k/l`    | Navigate between panes (vim-style)          |
| `m` (repeatable) | Zoom/unzoom the current pane             |
| `v` (in copy mode) | Begin selection (vi-style)            |
| `y` (in copy mode) | Copy selected text                    |

### Inverted Layout for Window Selection

These keys (shifted symbols) are mapped to select specific windows:
| Key | Window |
|-----|--------|
| `!` | 1      |
| `@` | 2      |
| `#` | 3      |
| `$` | 4      |
| `%` | 5      |
| `^` | 6      |
| `&` | 7      |
| `*` | 8      |
| `(` | 9      |
| `)` | 0      |

---

## 💎 Special Features

### 🔐 SSH Quick Connect
**`Prefix + s`**

This keybinding opens a new window running a fuzzy finder (powered by `fzf`) over your `~/.ssh/config`, allowing you to instantly connect to any known SSH host.

```tmux
bind s new-window "bash ~/.config/scripts/fzf_SSH.zsh; exec zsh"
```

### ⚡ Fuzzy Command Runner
**`Prefix + r`**

Split the current window and launch a fuzzy command selector from your predefined scripts or commands.

```tmux
bind r split-window -h -c "#{pane_current_path}" "bash ~/.config/scripts/fzf_cmd.zsh; exec zsh"
```

### 🔀 Rearrange Windows
**`Prefix + l`**

Quickly reindex window order interactively.

```tmux
bind l movew -r
```

---

### Installed Plugins:
- `tmux-plugins/tpm` - Tmux Plugin Manager
- `christoomey/vim-tmux-navigator` - Seamless pane navigation with Vim
- `janoamaral/tokyo-night-tmux` - Gorgeous Tokyo Night theme with widgets

To install plugins:

```bash
# Inside tmux
prefix + I
```

---

## ⚙️ Terminal & Display Settings

- Uses `tmux-256color` and truecolor settings
- Status bar is moved to the **top**
- Mouse mode enabled
- Window indexing starts at 1
- Copy-mode uses **vi-style** keys

---

## 🧼 Final Notes

Make sure you have:
- A patched Nerd Font to render icons properly.
- `fzf` and `zsh` installed.
- Your `~/.ssh/config` properly configured for the SSH menu.

---
