# Shackleford's dotfiles

I am currently in the process of designing my dotfile system from the ground
up.  Focus is placed on building a core infrastructure that largely allows for
configuration manipulation and expansion without the need to modify the
framework code.  Simply write up and drop a module into the dotfiles framework
and watch it integrate automatically.  Modules are simple bash scripts (for
system stuff) or vim scripts (for vim stuff).

## Configurations

* [fonts](fonts) -- Powerline fonts.  Installed to `$HOME/.fonts`

* [git](git) -- `gitconfig` and `gitignore_global` get symlinked into `$HOME`

* [latex](latex) -- `chktexrc` gets symlinked into `$HOME`

* [tmux](tmux) -- `tmux.conf` gets symlinked into `$HOME`

* [vim](vim) -- vimrc management is performed modularly, with features being
  added or removed through curation of the `vimrc.d/` directory.  Plugin
  management is performed using
  [vim-plug](https://github.com/junegunn/vim-plug).

* [zsh](zsh) -- disabled (total garbage).  I'm still migrating away from
  [.oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
