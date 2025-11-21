# Neovim LSP & Completion Cheatsheet

## Autocompletion (blink.cmp)

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Open completion menu |
| `Ctrl+n` / `↓` | Next item |
| `Ctrl+p` / `↑` | Previous item |
| `Ctrl+y` | Accept/confirm |
| `Ctrl+e` | Close menu |
| `Ctrl+k` | Toggle signature help (function parameters) |
| `Tab` / `Shift+Tab` | Navigate snippet fields |

## Navigation

| Key | Action | Example Use |
|-----|--------|-------------|
| `grd` | Go to definition | Jump to where function/class is defined |
| `grr` | Find all references | See everywhere a variable is used |
| `gri` | Go to implementation | Jump to concrete implementation of abstract method |
| `grt` | Go to type definition | Jump to class definition from variable |
| `grD` | Go to declaration | Jump to forward declaration (C/C++) |
| `Ctrl+t` | Jump back | Return after jumping |

## Code Actions

| Key | Action | Example Use |
|-----|--------|-------------|
| `grn` | Rename (project-wide) | Rename variable everywhere |
| `gra` | Code actions | Auto-import, extract variable, quick fixes |

## Symbols & Diagnostics

| Key | Action |
|-----|--------|
| `gO` | Document symbols (outline) |
| `gW` | Workspace symbols (search all) |
| `Space+q` | Open diagnostic list |

## REPL (iron.nvim)

### Managing REPL
| Key | Action |
|-----|--------|
| `Space+rs` | Start REPL |
| `Space+rr` | Restart REPL |
| `Space+rf` | Focus REPL window |
| `Space+rh` | Hide REPL window |

### Sending Code
| Key | Action |
|-----|--------|
| `Space+sF` | Send entire file to REPL |
| `Space+sl` | Send current line |
| `Space+sc` | Send visual selection/motion |
| `Space+scip` | Send current paragraph |
| `Space+sq` | Exit REPL |
| `Space+cl` | Clear REPL |

---

# Language-Specific Features

## 🦀 Rust (rustaceanvim)

### Rust-Specific Commands
| Key | Action | Description |
|-----|--------|-------------|
| `Space+rca` | Rust code action | Context-aware actions (implement trait, etc.) |
| `Space+rr` | Runnables | Run/test current module, binary, or test |
| `Space+rd` | Debuggables | Debug with codelldb |
| `Space+re` | Expand macro | See macro expansion |
| `K` | Hover docs | View function documentation |

### Rust Workflow
1. **Start REPL**: `Space+rs` (uses evcxr)
2. **Send file to REPL**: `Space+sF`
3. **Format code**: `Space+f` (uses rustfmt)
4. **Run tests**: `Space+rr` → select test
5. **Lint on save**: Clippy runs automatically

### Features Available
- ✅ Auto-completion with type inference
- ✅ Inlay hints (shows types inline)
- ✅ Clippy linting on save
- ✅ Cargo integration
- ✅ Interactive REPL (evcxr)

---

## 🐍 Python (pyright)

### Python-Specific Commands
| Key | Action | Description |
|-----|--------|-------------|
| `K` | Hover docs | View function/class documentation |
| `grd` | Go to definition | Jump to source |
| `grr` | Find references | Find all usages |

### Python Workflow
1. **Start REPL**: `Space+rs` (uses IPython)
2. **Send file to REPL**: `Space+sF`
3. **Send line**: `Space+sl`
4. **Format code**: `Space+f` (uses isort + black)

### Features Available
- ✅ Auto-completion with type hints
- ✅ Import auto-suggestions
- ✅ Type checking
- ✅ Interactive REPL (IPython)
- ✅ Auto-formatting (isort + black)

### Python REPL Tips
- Test functions quickly: Write function → `Space+sF` → test in REPL
- Iterate fast: Edit code → `Space+sl` to resend changes
- Use IPython magic: `%timeit`, `%debug`, etc.

---

## 💜 Love2D / Lua (lua_ls + love2d.nvim)

### Love2D-Specific Commands
| Key | Action | Description |
|-----|--------|-------------|
| `Space+vv` | Run Love2D | Launch your game |
| `Space+vs` | Stop Love2D | Stop the running game |
| `K` | Hover docs | View Love2D API docs |

### Lua Workflow
1. **Start REPL**: `Space+rs` (uses LuaJIT)
2. **Send code to REPL**: `Space+sF`
3. **Run Love2D game**: `Space+vv`
4. **Edit + Hot reload**: Make changes → `Space+vs` → `Space+vv`

### Features Available
- ✅ Full Love2D API autocomplete (love.graphics, love.audio, etc.)
- ✅ LuaJIT REPL for testing
- ✅ Quick game launch from Neovim
- ✅ Type inference and documentation
- ✅ Auto-completion for all Love2D modules

### Love2D Development Tips
- Type `love.` to see all available modules
- Use `K` on functions like `love.graphics.draw()` for docs
- Quick iteration: `Space+vv` → test → `Space+vs` → edit → repeat

---

## Quick Tips

- **Rename safely**: `grn` renames across entire project
- **Check usage first**: Use `grr` before renaming to see impact
- **Auto-import**: Put cursor on undefined name → `gra` → select import
- **Signature help**: Type `(` after function name, or press `Ctrl+k`
- **Jump back**: Always use `Ctrl+t` to return after `grd`

---

## Common Workflows by Language

### Quick Start Any Language
1. Open file (`.rs`, `.py`, or `.lua`)
2. Press `K` on any function to see docs
3. Press `Space+rs` to start REPL
4. Press `Space+sF` to send entire file

### Language REPLs
| Language | REPL Command | Install |
|----------|-------------|---------|
| Python | `ipython` | `pip install ipython` |
| Rust | `evcxr` | `cargo install evcxr_repl` |
| Lua | `luajit` | System package manager |

### Format Code (Space+f)
| Language | Formatter | Auto-runs on save? |
|----------|-----------|-------------------|
| Python | isort + black | ✅ Yes |
| Rust | rustfmt | ✅ Yes |
| Lua | - | ❌ No |

### Testing & Running
| Language | Command | What it does |
|----------|---------|--------------|
| Rust | `Space+rr` | Run tests/binary via Cargo |
| Python | Use REPL | Send code with `Space+sF` |
| Love2D | `Space+vv` | Launch game window |
