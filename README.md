# vindi - RTG vim IDE in docker

## IN EARLY DEVELOPMENT

already usable but still needs some more work and ironing out

### Install

Simply run the shell install script. It will require sudo if you wish to
install the binary to `/usr/local/bin`. You may choose to place it
manually somewhere in your PATH as well by simply choosing no.

`$ ./install.sh`

### Run

Run vindi as you would run vim.

`$ vindi`

Do note, it will only have access to the
current dir and subdirs, so make sure you run it from at least your
project root for best results>

#### Security

The shell script to launch vindi runs xhost, and maps your X
server to the container, for host<->container clipboard access.
Reprecussions of running the xhost command are to be explored by you.
Any feedback on this is appreciated.

The container runs as root, therefore it's highly recommended to use
unprivileged containers via `userns-remap`, which you SHOULD be doing
on any single user systems, and remapping to a user that can read
and edit your code but no important or system files...
https://docs.docker.com/engine/security/userns-remap/

#### Notes

- needs Powerline patched font

#### Keys

Give a man a fish, feed him for a day, teach a man to fish, feed him for a lifetime

some basic keybindings to get you started with each of the plugins, for more info, do :h plugin name...
Check vimrc for plugins currently used

`:map` and `:imap` have potential plugin keybindings in use as well.

##### gitgutter

`<leader>hp`

### TODO

- [x] Change workdir to vindi
- [x] Add bashrc alias guidance (did better, just made install script with executable sh script as bin)
- [ ] Add my defaults in, and provide guidance on how to override defaults or use
own profile.
- [x] ensure pywal profile applies... or look into what it'll take
- [ ] find something more elegant than the 2 minute wait for the coc extension
install to complete.
One way is to use CocInstall sync, but then the extensions need to be
explicitly declared in the
Dockerfile instead of the init.vim
- [ ] Look into minifying the docker image (try node:lts-slim ??)
- [x] Add NERDTREE tab patch to re-use exisitng tab window instead of opening a new one
- [ ] Turn this into a table
- [x] Due to bad coloring for errors, either change their colour, or change 
from floating windows - fixed for pywal
- [ ] Never leave it on the NERDTree window when tabbing through...
- [ ] Persist command history between container and host
- [ ] Look into solving apt install just failing on bad connection, but silently (maybe multiple layers...)
- [x] fix coc-settings not showing wanted text signs
- [x] add keybindings to cycle through any found lsp issues
- [ ] Populate some useful key list per plugin
- [ ] Note that VS Code snippets can be added as plugins
- [ ] Update docs with latest changes
- [ ] Upload built image to Docker, ideally CI this process via GH actions
- [ ] Have install script check if vindi bin already exists, and ask for update instead?
