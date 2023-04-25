# List of toolings

## jq

jq is a lightweight and flexible command-line JSON processor.

install: `sudo apt-get install jq`

ex: `curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'`

## tldr pages

The TLDR (stands for “Too Long; Didn’t Read“. ) pages are summarized practical usage examples of commands on different operating systems including Linux. It is one of the most commonly used and reliable ways of getting help under Unix-like systems is via man pages. Man pages are the standard documentation for every Unix-like system and they correspond to online manuals for programs, functions, libraries, system calls, formal standards and conventions, file formats and so on

install sudo npm install -g tldr

ex tldr jq

## locate

## bat

A cat(1) clone with syntax highlighting and Git integration.

https://github.com/sharkdp/bat

```
sudo apt install bat
```

Important: If you install bat this way, please note that the executable may be installed as batcat instead of bat (due to a name clash with another package). You can set up a bat -> batcat symlink or alias to prevent any issues that may come up because of this and to be consistent with other distributions:

```
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```
