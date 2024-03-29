My Personal Configuration
==========================

Many of the configuration are inspired from [rwxrob](https://github.com/rwxrob) and [Luke Smith](https://github.com/Lukesmithxyz).

- Directory structure

```
.
├── bash
├── dunst
├── fontconfig
├── gh
├── git
├── lynx
├── scripts
├── sxiv
│   └── exec
├── tmux
├── vim
└── x11
```

How to use this config?
-----------------------

Just using the [setup](/setup) script should do the trick.

New Found Knowledge
-------------------

(dated May 09 2022) I found a new knowledge today that bash can debug a script without running it by giving the flags `-x` to bash and it will give a plus sign if the script runs fine and errors if not.
- The + and - to the `x` flag will evaluate a block of the script with negative being first and plus being later.

(dated May 18 2022) So the problem was that I wanted to know if my bash script is not giving any errors. And I found out about the `-n` flag which is used to check the syntax validity of the bash script. And this will give me a heads up which is great.
- Run scripts with the `-n` flag to check syntax validity.

(dated July 06 2022) While using colors on the terminal I found `printf` to be more reliable as because in very rare cases
a Linux system could not have the command `echo`, which is not the case in any of the distros I have used so far.
Also, found out that `printf` has another data type? something which is `%b` which is an argument as a string with `\` escapes
interpreted, except that octal escapes are of the form \0 or \0NNN.
- Using `%b` in `printf` will do colors in bash scripts.

(dated July 07 2022) While using conditional statements I found out on how to check if a file is a symlink or not with the `-L` flag.
This flag inside a squared brackets checks if a file exists and is a symlink. Very useful with other flags such as the `-f` and `-d` flag.
The `-f` flag check a file exists and is a regular file and the `-d` flag checks if a directory exists or not.
- Use the `-L` flag to check if a file exist and is a symlink.

(dated Dec 15 2022) To print values with awk having delimiter the option `-F` should be used. The awk command is very simple and easy to use. Today I only found out about how to print a set of values with awk. I also found out about the `tr` command which translates the output with the desired characters.

```bash
# The awk command
awk -F\" '{ print $2 }' # taking delimiter " and printing the second value
# the tr command
tr ' ' '\n'             # replace empty space with newline
```

- With `awk` to use it with a delimiter the option `-F` should be used.


TODO
----

- [x] Write a script to shutdown,reboot and sleep. (for Arch based distros and debian based distros)
- [x] Figure out why in `Artix Linux` in the `openrc` init system, vim does not show ascii characters and the above directory structure does not show the beautiful lines in in `Artix Linux` edition of vim.
- [x] Add a `README` to the new directories and explain about them.
- [x] Remove the need to run credential store cache commnad and implement to the [config](./git/config) file.
- [x] Update README.md file in directories.
- [x] Write a script to shutdown,reboot and sleep. (for Arch based distros and debian based distros)
- [x] Figure out why in `Artix Linux` in the `openrc` init system, vim does not show ascii characters and the above directory structure does not show the beautiful lines in in `Artix Linux` edition of vim.
- [x] Add a `README` to the new directories and explain about them.
- [x] Remove the need to run credential store cache commnad and implement to the [config](./git/config) file.
- [x] Update README.md file in directories.

Legal
-----

Copyright 2023 [Kunal Munda](https://github.com/ryukamish) <br>
Released under Apache-2.0 Licence
