[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# cprintf

Printf with colors

## Install

With [fisherman]

```
fisher cprintf
```

## Usage

```fish
cprintf "template" $array
```
cprintf is intended to work as a normal [printf]().
But with a nifty plus, it can accept a special format for coloring.

For foreground colors use the open `fg:color` tag and close it with its corresponding `fg`.

![Foreground format][fg-styling]

For background colors use the open `bg:color` and end the coloring with its `bg` ending tag

![Background format][bg-styling]

It can be combined too used as a regular printf with params

![Combined format][combined-styling]

[travis-link]: https://travis-ci.org/fisherman/cprintf
[travis-badge]: https://img.shields.io/travis/fisherman/cprintf.svg
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman

[fg-styling]: docs/fg_styling.png
[bg-styling]: docs/bg_styling.png
[combined-styling]: docs/combined_styling.png
