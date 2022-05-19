# My Dotfiles


#  brew list
```
  $ brew install cmatrix
  $ brew install lolcat
  $ brew install fortune
  $ brew install cowsay
  $ brew install tmux
  $ brew install tree
  $ brew install ripgrep
  $ brew install awscli
  $ brew install macvim
  $ brew install ruby
  $ brew install ctag
  $ brew install neofetch
  $ brew install alacritty
  $ brew install git
  $ brew install gh
  $ brew install starship
  $ brew install ag
  $ brew install cmake
  $ brew install mono go nodejs
```
#  Vundle settings
```
  $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  # And then on VIM `:PluginInstall`

```

#  YCM settings
```
  $ cd ~/.vim/bundle/YouCompleteMe
  $ python3 install.py --all

```

#  Janus settings
```
  $ curl -L https://bit.ly/janus-bootstrap | bash

```

# Install
```
  $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
  $ \curl -sSL https://get.rvm.io | bash -s stable
```

# Tmuxinator
```
  # Can configure ~/.config/tmuxinator/*.yml
  $ tmuxinator s defualt_view
```

# Nerd Font
```
# Download Nerd Fonts (FiraCode) And install new Fonts
https://www.nerdfonts.com/font-downloads
```

# ASCII Art
```
 Created on https://manytools.org/hacker-tools/convert-images-to-ascii-art/
 Created on https://asciiart.club
```

# Window Management
```

https://github.com/peterklijn/hammerspoon-shiftit

```
 
# TroubleShooting
- E1208 `.vim/janus/vim/tools/tlib/plugin/02tlib.vim`
``` 
command! -nargs=0 -complete=command TBrowseScriptnames call tlib#cmd#TBrowseScriptnames()

TO

"  command! -nargs=0 -complete=command TBrowseScriptnames call tlib#cmd#TBrowseScriptnames()
command! -nargs=0 TBrowseScriptnames call tlib#cmd#TBrowseScriptnames()
```
