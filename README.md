# vindi - vim IDE in docker

<!-- vim-markdown-toc GFM -->

* [Why](#why)
* [Requirements for best experience](#requirements-for-best-experience)
* [Install](#install)
* [Run](#run)
  * [Security](#security)
  * [Keybindings](#keybindings)
    * [gitgutter](#gitgutter)
    * [easymotion](#easymotion)
    * [NERDTree](#nerdtree)
    * [tmux-navigator](#tmux-navigator)
    * [repeat](#repeat)
    * [surround](#surround)
    * [coc/LSP](#coclsp)
  * [Customization](#customization)
* [BUGS](#bugs)
* [TODO](#todo)

<!-- vim-markdown-toc -->

## Why

Allows for minimal or no vim at all on host system, whilst
having a fully-fledged IDE capable vim, with its config
and setup isolated into a docker container.

Also can give familiar vim experience on servers with docker,
by simply pulling the image, you're good to go with a fully
setup and pre-configured neovim.

Additionally, you can play with the config and settings,
and don't have to worry about messing up or resetting a config.
Unhappy with some plugin you've added, restart the container.
If you want it to be persistent, just add it to the init.vim
config file and rebuild.

## Requirements for best experience

* Docker (with root ns remapped)
* Powerline patched font (for airline theme)
* Pywal (for dynamic color theme based on bg image)
* Terminal with unicode support

## Install

Clone this repository.

`$ git clone https://github.com/D-Nice/vindi.git`

Simply run the shell install script with 2 prompts.

`$ ./install.sh`

vindi supports 2 configurations, a full local build, or remote.

If you're fine with the default build, you can skip the local build
step, and the binary will pull the latest image from the dnice/vindi
repo on <https://hub.docker.com>.

It will require sudo if you wish to
install the binary to `/usr/local/bin`. You may choose to place it
manually somewhere in your PATH as well, in which case deny the prompt.

## Run

Run vindi just as you would run vim.

`$ vindi`

or

`$ vindi ./helloworld.txt`

Do note, it will only have access to the
current dir and subdirs, so make sure you run it from at least your
project root for best results. Avoid absolute paths!

### Security

The shell script to launch vindi runs xhost, and maps your X
server to the container, for host<->container clipboard access.
Reprecussions of running the xhost command are to be explored by you.
Any feedback on this is appreciated.

The container runs as root, therefore it's highly recommended to use
unprivileged containers via `userns-remap`, which you SHOULD be doing
on any single user systems, and remapping to a user that can read
and edit your code but no important or system files...
<https://docs.docker.com/engine/security/userns-remap/>

### Keybindings

Give a Woman a Fish, and You Feed Her for a Day.
Teach a Woman To Fish, and You Feed Her for a Lifetime.

It's best to check `etc/init/.config/nvim/init.vim` for most up-to-date custom
keymaps. By using `:map` and `:imap` is the best way to get an exhaustive list
of all keymaps, or look up specific keymaps via `:h <plugin name here>`

Regardless, here are various plugin specific keybindings to get you started
that I often find myself using.

`<space>` is remapped to `<leader>`

#### gitgutter

* `<leader>hp` - Shows git difference of hunk in preview.

#### easymotion

* `<leader><leader>s` - Move cursor to specific character in active visible buffer.

#### NERDTree

* `<F8>` - Toggles NERDTree nav window.

* `<ctrl>n` - Opens new tab.

* `<shift>j/k` - Switch between open tabs.

#### tmux-navigator

* `<ctrl>h/j/k/l` - Nav between split buffers or tmux'd sessions.

#### repeat

* `.` - Repeats last native OR plugin action.

#### surround

* `ysiw"` - Surrounds current cursor'd inner word with double quotes.

#### coc/LSP

Availability of these depends on LSP in question for filetype.

* `]e` - Go to next error (use `[` for prev).

* `gd` - Open cursor'd definition in new window
(use `<ctrl>o/i` to jump back and forth or use `:jumps`)

* `<tab>/<shift><tab>` - Cycle through suggestions.

* `<ctrl><tab>` - Auto-complete suggestion or snippet.

### Customization

Edit config files to your liking in `etc/`.
`etc/init/.config/nvim/init.vim` holds the default config and plugins.
`etc/patch/` copies those files over following plugin installs, allowing
you to patch plugins or their configs as needed.

Once done with your configs, simply rebuild using the install script.
It's a good measure to run `docker system prune` if doing this often...

When it comes to snippet plugins, you can even use VS Code plugins,
with `https://github.com/xabikos/vscode-javascript` in the current config being
an example.

## BUGS

* [ ] switching between NERDTree tabs causes diagnostics to disappear until
reswitch or save. Appears specific to markdown.
* [ ] Syntastic error when trying to save file, while NERDTree is open.

## TODO

* [x] Change workdir to vindi
* [x] Add bashrc alias guidance (did better, just made install script with
executable sh script as bin)
* [x] Add my defaults in, and provide guidance on how to override defaults or use
own profile.
* [x] ensure pywal profile applies... or look into what it'll take
* [ ] find something more elegant than the 2 minute wait for the coc extension
install to complete.
One way is to use CocInstall sync, but then the extensions need to be
explicitly declared in the
Dockerfile instead of the init.vim
OR read/ping stdout from nvim, and if no output after x time, consider it done?
or wait for expected last message to show up and continue
* [x] Look into minifying the docker image (try node:lts-slim ??)
* [x] Add NERDTree tab patch to re-use exisitng tab window instead of opening a
new one
* [x] Turn this into a table
* [x] Due to bad coloring for errors, either change their colour, or change
from floating windows - fixed for pywal
* [ ] Never leave it on the NERDTree window when tabbing through...
* [x] Look into solving apt install just failing on bad connection,
but silently (maybe multiple layers...). Used multiple layers.
* [x] fix coc-settings not showing wanted text signs
* [x] add keybindings to cycle through any found lsp issues
* [x] Populate some useful key list per plugin
* [x] Note that VS Code snippets can be added as plugins
* [x] Update docs with latest changes
* [x] Upload built image to Docker, ideally CI this process via GH actions
* [ ] Have install script check if vindi bin already exists, and ask for update instead?
* [ ] Minify in CI with docker-slim
* [ ] Use nicer icons for nerdtree-git-plugin if possibru?
* [ ] Look into persistence for some of the auto complete features or snippets
* [ ] Persist command history between container and host
* [ ] If too ugly, move out BUGS/TODO
* [x] Make vindi usable with local build or remote image pull
* [ ] As of e7ecdb074c9015abf28f70ac874ff8445d6c1766 there were instances where a CocUpdate seems to occur, when starting vindi, a reinstall fixes this so something occurs during building (seems to have had non-zero exit, while trying to clear npm cache folder... could check what it looks like on a clean install and use it as an indicator whether to continue waiting or wut
