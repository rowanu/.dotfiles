# Dotfiles

A simplified, modular ZSH configuration focused on essential development tools.

## What's Included

- **ZSH shell configuration** with modular file structure
- **Git configuration** with grouped aliases, safer defaults, and pretty log formatting
- **Tmux configuration** with vim-style keybindings
- **AWS CLI tools** with profile switching and info display
- **Development tools** for Node.js and Python
- **Code formatting** with Prettier

## Prerequisites

- macOS (tested on Apple Silicon Macs)
- [Homebrew](https://brew.sh) installed
- Zsh shell (default on macOS Catalina+)
- Git

## Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/rowanu/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install packages with Homebrew:**
   ```bash
   brew bundle
   ```

3. **Create symlinks with Stow:**
   ```bash
   stow .
   ```

4. **Switch to Zsh (if needed):**
   ```bash
   chsh -s $(which zsh)
   ```

5. **Restart your terminal or source the config:**
   ```bash
   source ~/.zshrc
   ```

6. **Install Node.js and Python versions:**
   ```bash
   # Install latest LTS Node.js
   fnm install --lts
   
   # Install Python (adjust version as needed)
   pyenv install 3.11.0
   pyenv global 3.11.0
   ```

## Key Features

### AWS Profile Management
```bash
# Switch AWS profiles
awsp my-profile

# Show current profile and list available ones
awsp

# Display current AWS info (profile, region, account)
awsinfo
```

#### Populating Profiles from IAM Identity Center

[`granted`](https://docs.commonfate.io/granted) writes an `~/.aws/config`
profile for every account and role you can reach via SSO:

```bash
granted sso populate \
  --sso-region <sso-region> \
  --profile-template="<prefix>.{{ .AccountName }}.{{ .RoleName }}" \
  https://<your-sso-subdomain>.awsapps.com/start
```

`--sso-region` is where your Identity Center instance lives, not where you
work. Re-run when your access changes, with `--prune` to drop profiles you've
lost. The results work with `awsp` and `assume`.

### Essential Git Aliases

Git aliases are defined in `.gitconfig` rather than as shell aliases, so they work
from any shell and from tools that shell out to git. The only shell alias is `g='git'`,
which makes them short to type (`g st`, `g cm "message"`).

**Staging and committing**

| Alias | Command | Notes |
| --- | --- | --- |
| `a` | `add` | |
| `ap` | `add -p` | stage interactively, hunk by hunk |
| `cm` | `commit -m` | |
| `ca` | `commit -a -m` | stages tracked files first |
| `wip` | `commit -am "wip"` | quick checkpoint commit |
| `amend` | `commit --amend` | |
| `cane` | `commit --amend --no-edit` | amend, keeping the message |
| `fixup` | `commit --fixup` | takes a commit ref; auto-squashes on rebase |
| `undo` | `reset --soft HEAD~1` | undo last commit, keeps changes |
| `unstage` | `restore --staged` | unstage a path, keeps changes |
| `discard` | `restore` | throw away unstaged changes to a path |

**Branches**

| Alias | Command | Notes |
| --- | --- | --- |
| `b` | `branch` | |
| `ba` | `branch -a` | includes remotes |
| `bd` | `branch -d` | delete if merged |
| `bdd` | `branch -D` | force delete |
| `co` | `checkout` | |
| `cob` | `checkout -b` | |
| `sw` | `switch` | modern `checkout` for branches |
| `swc` | `switch -c` | modern `checkout -b` |
| `recent` | `branch --sort=-committerdate` | branches newest first, with relative dates |

**Rebasing and cherry-picking**

| Alias | Command | Notes |
| --- | --- | --- |
| `ri` | `rebase -i` | |
| `rc` | `rebase --continue` | |
| `ra` | `rebase --abort` | |
| `cp` | `cherry-pick` | |

**Syncing**

| Alias | Command | Notes |
| --- | --- | --- |
| `f` | `fetch` | |
| `p` | `push` | |
| `pf` | `push --force-with-lease` | refuses to clobber commits you haven't fetched |
| `pl` | `pull` | rebases, per `[pull] rebase = true` |

**Stashing**

| Alias | Command | Notes |
| --- | --- | --- |
| `ss` | `stash` | |
| `sa` | `stash apply` | keeps the stash entry |
| `sl` | `stash list` | |
| `sp` | `stash pop` | applies and drops the entry |

**Inspecting**

| Alias | Command | Notes |
| --- | --- | --- |
| `st` | `status` | |
| `d` | `diff` | |
| `dc` | `diff --cached` | staged changes |
| `ds` | `diff --stat` | summary of what changed |
| `dw` | `diff --ignore-space-change` | |
| `conflicts` | `diff --name-only --diff-filter=U` | files still conflicted |
| `hist` / `l` | pretty graph log | `l` is shorthand for `hist` |
| `last` | `log -1 --stat` | the most recent commit |
| `pick` | `log --all --source -S` | pickaxe: `g pick 'someString'` finds commits touching it |
| `bl` | `blame -w -CCC` | ignores whitespace, follows moved code |
| `who` | `shortlog -sn --no-merges` | commit counts per author |

**Meta**

| Alias | Command | Notes |
| --- | --- | --- |
| `aliases` | `config --get-regexp ^alias\.` | list every alias |
| `root` | `rev-parse --show-toplevel` | path to the repo root |

Alias names are case-insensitive to Git, so `bd` and `bD` would be the same
alias. Hence `bdd` for the force delete.

### Git Behaviour Defaults

`.gitconfig` also sets a few non-default behaviours worth knowing about:

| Setting | Effect |
| --- | --- |
| `push.autoSetupRemote` | first `git push` on a new branch sets upstream automatically |
| `pull.rebase` | `git pull` rebases instead of creating a merge commit |
| `rebase.autosquash` | `fixup!` commits are squashed automatically during `rebase -i` |
| `rebase.autostash` | uncommitted changes are stashed and restored around a rebase |
| `rerere.enabled` | conflict resolutions are remembered and replayed on later rebases |
| `merge.conflictstyle = zdiff3` | conflict markers include the common ancestor |
| `diff.algorithm = histogram` | clearer diffs than the default Myers algorithm |
| `diff.colorMoved = zebra` | moved lines are coloured differently from added/removed |

### Helper Functions
```bash
# Search command history
hgrep searchterm

# Search running processes  
psgrep processname

# Tmux session management
tm                    # Attach to existing or create 'main' session
tm session-name       # Create new named session
```

### Custom Prompt
Shows: `username@hostname current-directory (git-branch) ☁️ aws-profile`

## Customization

### Machine-Specific Configuration
Create `~/.config/zsh/local.zsh` for machine-specific settings:
```bash
# Example local.zsh
export CUSTOM_VAR="value"
alias myalias="custom command"
```

### Git Configuration
Identity lives in `~/.gitconfig.local`, which is untracked so it never gets
committed. Create it with your details:
```gitconfig
[user]
    name = Your Name
    email = your.email@example.com
    signingkey = ~/.ssh/id_rsa.pub
```
Avoid `git config --global user.name ...`: `~/.gitconfig` is a symlink into this
repo, so it would write your identity into a tracked file.

## Migration from Previous Setup

### Removed Features
- **FZF integration** - Use native zsh completion or add back if needed
- **Complex bash prompt** - Simplified to show essential info only  
- **Unused languages** - Removed Go, Lua, Ruby (add back via Brewfile if needed)
- **Redundant git aliases** - Kept only essential ones

### New Improvements
- **Modular configuration** - Easier to maintain and customize
- **fnm for Node.js** - Fast, with automatic version switching on `cd`
- **Simplified AWS management** - Better profile switching
- **Neovim as default editor** - Set via `$EDITOR` and `$VISUAL`

## Troubleshooting

### Stow Conflicts
If stow reports conflicts with existing files:
```bash
# Backup existing files
mv ~/.zshrc ~/.zshrc.backup
mv ~/.gitconfig ~/.gitconfig.backup

# Then run stow again
stow .
```

### Zsh Not Loading Config
Make sure you're actually using zsh:
```bash
echo $SHELL
# Should show: /bin/zsh or /usr/local/bin/zsh
```

### AWS CLI Not Working
Ensure AWS CLI is properly installed and configured:
```bash
aws configure list
```

### Python/Node Issues
If pyenv or fnm commands aren't found, restart your terminal or manually source your shell config.

## Adding New Tools

### New Packages
Add to `Brewfile` and run:
```bash
brew bundle
```

### New Aliases/Functions
Add shell aliases and functions to the appropriate files in `~/.config/zsh/` and
restart your terminal. Git aliases belong in the `[alias]` section of `.gitconfig`.

### Per-Project Git Config
`.gitconfig` pulls in `~/.gitconfig.local` (untracked) for machine-local identity.
For per-directory overrides, add a conditional include there:
```gitconfig
[includeIf "gitdir:~/Code/mycompany/"]
    path = ~/Code/mycompany/.gitconfig
```

## Backup

Your original configurations are safely stored as `.backup` files. Remove them once you're confident the new setup works:
```bash
rm ~/.zshrc.backup ~/.gitconfig.backup
```