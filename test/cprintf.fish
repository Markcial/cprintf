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
  "foo "(set_color red)red(set_color normal) = (cprintf "foo <fg:red>%s</fg>" "red")
end

test "$TESTNAME It should add background colors"
  "foo "(set_color -b red)red(set_color normal) = (cprintf "foo <bg:red>%s</bg>" "red")
end

test "$TESTNAME It should add foreground and background colors"
  "foo "(set_color -b yellow)(set_color red)"bgyellow fgred"(set_color normal)(set_color normal) = (cprintf "foo <bg:yellow><fg:red>%s</fg></bg>" 'bgyellow fgred')
end
