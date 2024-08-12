# Dotfiles for MacOS

## keys

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

## other

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false # disable opening animation in chrome
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock # better mission control with aerospace

## Fisher

```sh
h-matsuo/fish-color-scheme-switcher
jethrokuan/z
jorgebucaran/fisher
lewisacidic/fish-git-abbr
patrickf1/fzf.fish
rstacruz/fish-npm-global
```
