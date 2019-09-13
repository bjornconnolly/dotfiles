# Dotfiles

Welcome to my dotfiles. These are a little different than most, I'm trying to get an enviroment up and running to
support a 60% keyboard without arrow keys. So trying to map as much as possible to vi keys. This is a second run at it,
tried to do the same with a HHKB in the early 00's, but I never liked the keys on the HHKB, but now good mechanical
keyboards are available everywhere for little money. Just have to live with the RGB leds everywhere.

Needed packages:
vim (preferably full)
bash (still stuck here because of work)
curl (need to fetch som files)
tmux
git

I'm a network engineer by day, but slowly trying to migrate my knowledge and workload over to more interesting topics.
Please note that my primary focus is usability and overview, so no blinken lichten here, it's about as basic as I can
make/want it.

The layout and most of the scripts are lifted from:
https://github.com/nicknisi/dotfiles.git
I've kept his license and mentions from where he lifted his parts in the relevant files.

## Contents

+ [Initial Setup and Installation](#initial-setup-and-installation)
+ [BASH Setup](#bash-setup)
+ [Prompt](#prompt)
+ [Vim Setup](#vim-setup)
+ [Tmux](#tmux-configuration)

## Initial Setup and Installation

### Backup

First, you may want to backup any existing files that exist so this doesn't overwrite your work.

Run `install/backup.sh` to backup all symlinked files to a `~/dotfiles-backup` directory.

This will not delete any of these files, and the install scripts will not overwrite any existing. After the backup
is complete, you can delete the files from your home directory to continue installation.

### Installation

If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

```bash
➜ xcode-select --install
```

Then, clone the dotfiles repository to your home directory as `~/.dotfiles`. 

```https
➜ git clone https://github.com/bjornconnolly/dotfiles.git ~/.dotfiles
➜ cd ~/.dotfiles
➜ ./install.sh
```

```ssh
➜ git clone git@github.com:bjornconnolly/dotfiles.git ~/.dotfiles
```

`install.sh` will start by initializing the submodules used by this repository (if any). **Read through this file and
comment out anything you don't want installed.** Then, it will install all symbolic links into your home directory. 
Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example,
`vimrc.symlink` will be symlinked in the home directory as `~/.vimrc`. Then, this script will create a `~/tmp` directory
in your home directory, as this is where vim is configured to place its temporary files. 

Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications 
that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).

It will also symlink any scripts in `$DOTFILES/bin` to `~/bin`

## BASH Setup

BASH is configured in the `bashrc.symlink` and `bash_profile.symlink` files, which will be symlinked to the home directory. 
The following occurs in this files:

* set the `EDITOR` to vim
* Set the `CODE_DIR` variable, pointing to the location where the code projects exist for exclusive autocompletion with the `c` command
* Recursively search the `~/.bash/` directory for files ending in .sh and source them use this for per host bash settings
* source a `~/.localrc` if it exists so that additional configurations can be made that won't be kept track of in this dotfiles repo. This is good for things like API keys, etc.
* Add the `~/bin` directory to the path
* And more...

### Prompt

The prompt is meant to be simple while still providing a lot of information to the user, particularly about the status of the 
git project, if the PWD is a git project. The git bash prompt is borrowed/stolen from:
https://github.com/arialdomartini/oh-my-git

#### Git Prompt

The git info shown on the `RPROMPT` displays the current branch name, along with the following symbols.

-  `+` - New files were added
-  `!` - Existing files were modified
-  `?` - Untracked files exist that are not ignored
-  `»` - Current changes include file renaming
-  `✘` - An existing tracked file has been deleted
-  `$` - There are currently stashed files
-  `=` - There are unmerged files
-  `⇡` - Branch is ahead of the remote (indicating a push is needed)
-  `⇣` - Branch is behind the remote (indicating a pull is needed)
-  `⇕` - The branches have diverged (indicating history has changed and maybe a force-push is needed)
-  `✔` - The current working directory is clean

** Legends are not up-to-date with the bash prompt, stille working on styling for it **

## Vim Setup

The vim setup is pretty basic, the `vimrc.symlink` is symlinked to .vimrc. There is also a vimrc.color that provides a
very basic color setup for vim.

During installation the directory `.vim` is created with two subdirectories `autoload` and `plugged`. The install
script downloads plug.vim and installs it into `~/.vim/autoload` directory. 

After this you can install the plugins defined in .vimrc with the command:
➜ vim +PlugInstall
and update them with:
➜ vim +PlugUpdate

## Tmux Configuration

Tmux is a terminal multiplexor which lets you create windows and splits in the terminal that you can attach 
and detach from. I use it to keep multiple projects open in separate windows. Tmux is configured in 
[~/.tmux.conf](tmux/tmux.conf.symlink).

When tmux starts up, [login-shell](bin/login-shell) will be run and if it determines you are running this on macOS, 
it will call reattach-to-user-namespace, to fix the system clipboard for use inside of tmux.
