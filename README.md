# Dotfiles

A simplified, modular ZSH configuration focused on essential development tools.

## What's Included

- **ZSH shell configuration** with modular file structure
- **Git configuration** with essential aliases and pretty log formatting
- **Tmux configuration** with vim-style keybindings
- **AWS CLI tools** with profile switching and info display
- **Development tools** for Node.js and Python
- **Code formatting** with Prettier

## Prerequisites

- macOS (tested on Apple Silicon Macs)
- [Homebrew](https://brew.sh) installed
- Zsh shell (default on macOS Catalina+)

## Installation

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.dotfiles
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
   volta install node@lts
   
   # Install Python (adjust version as needed)
   pyenv install 3.11.0
   pyenv global 3.11.0
   ```

## Configuration Structure

```
~/.dotfiles/
├── .config/zsh/          # Modular ZSH configuration
│   ├── aliases.zsh       # Git and general aliases
│   ├── aws.zsh           # AWS profile management
│   ├── functions.zsh     # Helper functions
│   └── prompt.zsh        # Custom prompt with git/AWS info
├── .gitconfig            # Git configuration and aliases
├── .prettierrc.yaml      # Code formatting rules
├── .tmux.conf           # Terminal multiplexer config
├── .zshrc               # Main shell configuration
└── Brewfile             # Package definitions
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

### Essential Git Aliases
- `ga` - git add
- `gb` - git branch  
- `gc` - git checkout
- `gcb` - git checkout -b
- `gcmm` - git commit -m
- `gd` - git diff
- `gl` - git hist (pretty log)
- `gp` - git push
- `gpu` - git pull
- `gs` - git status
- `gundo` - undo last commit (keeps changes)

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
Update `.gitconfig` with your details:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Migration from Previous Setup

### Removed Features
- **FZF integration** - Use native zsh completion or add back if needed
- **Complex bash prompt** - Simplified to show essential info only  
- **Unused languages** - Removed Go, Lua, Ruby (add back via Brewfile if needed)
- **Redundant git aliases** - Kept only essential ones

### New Improvements
- **Modular configuration** - Easier to maintain and customize
- **Volta for Node.js** - More reliable than nvm
- **Simplified AWS management** - Better profile switching
- **VSCode as default editor** - Matches your current workflow

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
If pyenv or volta commands aren't found, restart your terminal or manually source your shell config.

## Adding New Tools

### New Packages
Add to `Brewfile` and run:
```bash
brew bundle
```

### New Aliases/Functions
Add to appropriate files in `~/.config/zsh/` and restart terminal.

### Per-Project Git Config
The gitconfig includes conditional includes for specific directories. Add new ones as needed:
```gitconfig
[includeIf "gitdir:~/Code/mycompany/"]
    path = /path/to/company-specific/.gitconfig
```

## Backup

Your original configurations are safely stored as `.backup` files. Remove them once you're confident the new setup works:
```bash
rm ~/.zshrc.backup ~/.gitconfig.backup
```