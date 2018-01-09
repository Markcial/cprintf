set start_blink (printf "\e[5m")
set end_bold (printf "\e[22m")
set end_uline (printf "\e[24m")
set end_blink (printf "\e[25m")
set end_fg (printf "\e[39m")
set end_bg (printf "\e[49m")

test "$TESTNAME It should work with empty args"
    "" = (cprintf)
end

test "$TESTNAME It should work with single arg"
  "foo" = (cprintf foo)
end

test "$TESTNAME It should work with string arg"
  "foo bar" = (cprintf "foo %s" "bar")
end

test "$TESTNAME It should work with int arg"
  "foo 12" = (cprintf "foo %d" 12)
end

test "$TESTNAME It should add foreground colors"
  "foo "(set_color red)red(printf $end_fg) = (cprintf "foo <fg:red>%s</fg>" "red")
end

test "$TESTNAME It should add background colors"
  "foo "(set_color -b red)red(printf $end_bg) = (cprintf "foo <bg:red>%s</bg>" "red")
end

test "$TESTNAME It should add foreground and background colors"
  "foo "(set_color -b yellow)(set_color red)"bgyellow fgred"(printf $end_fg)(printf $end_bg) = (cprintf "foo <bg:yellow><fg:red>%s</fg></bg>" 'bgyellow fgred')
end

test "$TESTNAME It should support bold tags"
  "foo "(set_color -o)bold(printf $end_bold) = (cprintf "foo <b>%s</b>" "bold")
end

test "$TESTNAME It should support blinking tags"
  "foo "(printf $start_blink)blinking(printf $end_blink) = (cprintf "foo <bl>%s</bl>" "blinking")
end

test "$TESTNAME It should support nesting bold tags with foreground color"
  "The "(set_color --bold)"bold text has "(set_color yellow)"some yellow"(printf $end_fg)" in it"(printf $end_bold) = (cprintf "The <b>bold text has <fg:yellow>%s</fg> in it</b>" "some yellow")
end

test "$TESTNAME It should support an underlined word amidst colored text"
  (set_color red)"One of the "(set_color -u)red(printf $end_uline)" words are underlined"(printf $end_fg) = (cprintf "<fg:red>One of the <u>red</u> words are %s</fg>" "underlined")
end
