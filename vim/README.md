# vim configuration

vimrc management is performed modularly, with features being added or removed
through curation of the `vimrc.d/` directory.  Plugin management is performed
using [vim-plug](https://github.com/junegunn/vim-plug).

## Plugins

The following plugins are currently deployed:

* [NERDTree](#markdown-header-nerdtree)
* [syntastic](#markdown-header-syntastic)
* [tagbar](#markdown-header-tagbar)
* [YouCompleteMe](#markdown-header-youcompleteme)
* [vim-airlilne](#markdown-header-vim-airline)
* [vim-fugative](#markdown-header-vim-fugative)
* [vim-gitgutter](#markdown-header-vim-gitgutter)
* [vim-indent-guides](#markdown-header-vim-indent-guides)
* [vim-sensible](#markdown-header-vim-sensible)

### NERDTree

[NERDTree](https://github.com/scrooloose/nerdtree) allows you to explore your
filesystem and to open files and directories. It presents the filesystem to
you in the form of a tree which you manipulate with the keyboard and/or mouse.
It also allows you to perform simple filesystem operations.

#### Keybindings 
* `C-n` - toggle NERDTree (right side)


### syntastic

[syntastic](https://github.com/scrooloose/syntastic)


### tagbar

[tagbar](https://github.com/majutsushi/tagbar)

#### Keybindings 
* `T` - toggle tagbar (left side)



### YouCompleteMe

[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

#### Keybindings 
* `<leader>d` - diagnostic information

### vim-airline

[vim-airlilne](https://github.com/bling/vim-airline)


### vim-fugative

[vim-fugative](https://github.com/tpope/vim-fugitive)

#### Commands
* `:Gedit`, `:Gsplit`, `:Gvsplit`, `:Gtabedit` - View any blob, tree, commit,
   or tag in the repository -- write file to stage.

* `:Gdiff` - bring up the staged version of the file side by side with the
  working tree version

* `:Gstatus` - shows Git status.  Press `-` to `add/reset` a file's changes.
  Press `p` to `add/reset --patch`

* `:Gcommit` - perform commit

* `:Gblame` brings up an interactive vertical split with git blame output.
  Press `enter` on a line to edit the commit where the line changed, or `o` to
  open it in a split. When you're done, use `:Gedit` in the historic buffer to
  go back to the work tree version.

* `:Gmove` does a `git mv` on a file and simultaneously renames the buffer.

* `:Gremove` does a `git rm` on a file and simultaneously deletes the buffer.

* `:Ggrep` searchs the work tree (or any arbitrary commit) with `git grep`,
  skipping over that which is not tracked in the repository. 

* `:Glog` loads all previous revisions of a file into the quickfix list so you
  can iterate over them and watch the file evolve!

* `:Gread` is a variant of `git checkout` -- filename that operates on the
  buffer rather than the filename. This means you can use `u` to undo it and
  you never get any warnings about the file changing outside Vim.

* `:Gwrite` writes to both the work tree and index versions of a file, making it
  like `git add` when called from a work tree file and like `git checkout` when
  called from the index or a blob in history.

* `:Git` can be used to run any arbitrary command

* `:Git!` can be use to open the output of a command in a temp file.

### vim-gitgutter

[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

#### Keybindings 
* `<leader>hs` - stage hunk
* `<leader>hr` - revert hunk
* `<leader>hp` - preview hunk

### vim-indent-guides

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

#### Keybindings 
* `<leader>ig` - toggle indent guides
* `<leader>ie` - enable indent guides
* `<leader>id` - disable indent guides

### vim-sensible

[vim-sensible](https://github.com/tpope/vim-sensible)

