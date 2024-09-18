# Dotfiles for MacOS

## keys

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

## other

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false # disable opening animation in chrome
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock # better mission control with aerospace

## Fisher

```sh
jethrokuan/z
jorgebucaran/fisher
patrickf1/fzf.fish
rstacruz/fish-npm-global
catppuccin/fish
IlanCosman/tide@v6

tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='12-hour format' --rainbow_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=Yes --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Sparse --icons='Many icons' --transient=Yes
set tide_os_icon 텀
```

fish_config theme save "Catppuccin Macchiato"
