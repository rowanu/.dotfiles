# Dotfiles

## Install

1. Install [homebrew](https://brew.sh)
1. Clone this repo
1. Change to the repo directory
1. Install stuff with Brew via `brew bundle`
1. Run [Stow](https://www.gnu.org/software/stow/manual/):
  ```
  stow .
  ```
1. Generate a SSH key: `ssh-keygen`
1. Install vim-plug:
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
1. Run `:PlugInstall` in `vim`

### Manual Steps

* Sign in to Chrome with Gmail ID
* Remap caps lock > control
* Iterm profile > use Solarized Dark, set font and colours
* Messages to fix:
  ```
  ./.macos
  Password:
  Password:
  Set: Entry, ":FK_StandardViewSettings:IconViewSettings:showItemInfo", Does Not Exist
  Set: Entry, ":FK_StandardViewSettings:IconViewSettings:arrangeBy", Does Not Exist
  Set: Entry, ":FK_StandardViewSettings:IconViewSettings:gridSpacing", Does Not Exist
  Set: Entry, ":FK_StandardViewSettings:IconViewSettings:iconSize", Does Not Exist
  410:479: execution error: Terminal got an error: The file /Users/rowan/init/Solarized Dark xterm-256color.terminal does not exist. (1)
  Done. Note that some of these changes require a logout/restart to take effect.
  ```

### TBC

1. Update mouse settings (direction, speed, etc)
1. Turn off spelling auto-correction, “smart” quotes

## To Do

* iTerm2 settings: font family/size, colour scheme, applications may access clipboard
* Re-map capslock to ctrl
* Do not show display mirroring options in menubar
* Show battery percentage

## Other

### ESLint

Install globally so that individual package setup not required:

```
npm install -g eslint eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
```
