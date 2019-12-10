# vindi - RTG vim IDE in docker

## IN EARLY DEVELOPMENT

already usable but still needs some more work and ironing out

### Notes

#### Building

`docker build --compress -t vindi .`

#### For copy between host/container to work

On host, to be able to access clipboard from docker run
`xhost local:root`
and run the docker instance with args
`docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix`

and set clipboard to
set clipboard^=unnamed,unnamedplus

#### Current run command

for clipboard support run with

`docker run -e DISPLAY --rm -v $PWD:/opt/nvim
  -v /tmp/.X11-unix:/tmp/.X11-unix -it vindi .`

or if no clipboard

`docker run -v $PWD:/opt/nvim -it vindi .`

from the dir you wish opened and editable

#### Security

Reprecussions of running the xhost command are to be explored by you.
Likely no significant risk for a single user system. 

The container runs as root, therefore it's highly recommended to use
unprivileged containers via `userns-remap`, which you SHOULD be doing
on any single user systems, and remapping to a user that can read
and edit your code but no important or system files... 
https://docs.docker.com/engine/security/userns-remap/

### TODO

- [ ] Change workdir to vindi
- [ ] Add bashrc alias guidance
- [ ] Add my defaults in, and provide guidance on how to override defaults or use
own profile.

- [ ] ensure pywal profile applies... or look into what it'll take

- [ ] find something more elegant than the 2 minute wait for the coc extension
install to complete.
One way is to use CocInstall sync, but then the extensions need to be
explicitly declared in the
Dockerfile instead of the init.vim

- [ ] Look into minifying the docker image
