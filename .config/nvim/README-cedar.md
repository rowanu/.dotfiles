# nvim-cedar

Regex-based syntax highlighting and ftplugin settings for the Cedar policy
language (Cedar 4.x) and the human-readable Cedar schema format.

Self-contained: no tree-sitter parser, no external plugin dependency.

## Layout

```
syntax/cedar.vim            policy highlighting (.cedar)
syntax/cedarschema.vim      schema highlighting (.cedarschema)
ftplugin/cedar.vim          comments, indent, iskeyword
ftplugin/cedarschema.vim    same, 2-space indent
lua/ft/cedar.lua            filetype detection (preferred, Neovim)
ftdetect/cedar.vim          filetype detection (Vimscript fallback)
```

## Install

### Option A: drop into your config

Copy `syntax/`, `ftplugin/`, and `lua/` into `~/.config/nvim/`, then add to
`init.lua`:

```lua
require("ft.cedar")
```

Do not also copy `ftdetect/cedar.vim` if you use the Lua detection.

### Option B: treat as a local plugin

```lua
-- lazy.nvim
{ dir = "~/path/to/nvim-cedar", ft = { "cedar", "cedarschema" } }
```

Keep `ftdetect/cedar.vim` in this case (lazy.nvim sources ftdetect eagerly) and
drop `lua/ft/cedar.lua`.

## Optional: validate on write

Requires the Cedar CLI on `$PATH`.

```lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.cedar",
  callback = function(ev)
    vim.fn.jobstart(
      { "cedar", "validate",
        "--schema", "schema.cedarschema",
        "--policies", ev.file },
      {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, d)
          local out = table.concat(d or {}, "\n")
          if #vim.trim(out) > 0 then vim.notify(out) end
        end,
        on_stderr = function(_, d)
          local out = table.concat(d or {}, "\n")
          if #vim.trim(out) > 0 then vim.notify(out, vim.log.levels.WARN) end
        end,
      }
    )
  end,
})
```

## Alternative: tree-sitter

A community grammar exists (`chrnorm/tree-sitter-cedar`) but is small and
appears unmaintained. If you use it, pin the revision rather than tracking HEAD.

```lua
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").cedar = {
      install_info = {
        url = "https://github.com/chrnorm/tree-sitter-cedar",
        revision = "<pin a sha>",
        queries = "queries",
      },
    }
  end,
})
```

Then `:TSInstall cedar` and call `vim.treesitter.start()` on the `cedar`
filetype. Expect gaps for newer Cedar 4.x constructs.

## Caveats

- Highlighting is not validation. `isEmpty`, entity tags (`getTag` / `hasTag`),
  and the `datetime` / `duration` extension are recent Cedar 4.x additions.
  These highlight as valid even if your AVP policy store is pinned to an older
  Cedar version that rejects them. Keep the CLI or `cedar-wasm` as the
  authoritative parse/validate oracle.
- The `cedarEntityType` rule matches capitalised identifiers anywhere,
  including inside comments in some edge cases. Tighten the pattern if that is
  distracting.
- JSON-format schemas and entity files are routed to the `json` filetype.
  No special handling is provided for them.
