My Personal Configuration
==========================

Many of the configuration are inspired from [rwxrob](https://github.com/rwxrob) and [Luke Smith](https://github.com/Lukesmithxyz).

- Directory structure

```
.
├── bash
├── dunst
├── fonts
│   ├── hack
│   ├── IBM-Plex-Sans
│   └── IBM-Plex-Serif
├── lynx
├── scripts
├── sxiv
│   └── exec
├── tmux
├── vim
└── x11
```

New Found Knowledge
-------------------

(dated May 09 2022) I found a new knowledge today that bash can debug a script without running it by giving the flags `-x` to bash and it will give a plus sign if the script runs fine and errors if not.
- The + and - to the `x` flag will evaluate a block of the script with negative being first and plus being later.

(dated May 18 2022) So the problem was that I wanted to know if my bash script is not giving any errors. And I found out about the `-n` flag which is used to check the syntax validity of the bash script. And this will give me a heads up which is great.
- Run scripts with the `-n` flag to check syntax validity.


TODO
----

(DONE) - Write a script to shutdown,reboot and sleep. (for Arch based distros and debian based distros)
(DONE) - Figure out why in `Artix Linux` in the `openrc` init system, vim does not show ascii characters and the above directory structure does not show the beautiful lines in in `Artix Linux` edition of vim.
(DONE) - Add a `README` to the new directories and explain about them.
- Remove the need to run credential store cache commnad and implement to the [config](./git/config) file.

Legal
-----

Copyright 2022 [Kunal Munda](https://github.com/ryukamish) <br>
Released under Apache-2.0 Licence
