function cprintf -a text -d "Printf with colors"
  set -l text (echo $text | awk -F "[<|>]" '{ for(i=1;i<=NF;i++){print $i} }')
  set -e argv[1]
  set -l pieces (
    set -l color
    for a in $text
      switch $a
        case fg:\*
          set color (echo $a | cut -d: -f 2)
          set_color $color
        case bg:\*
          set color (echo $a | cut -d: -f 2)
          set_color -b $color
        case /bg
          set_color normal
        case /fg
          set_color normal
        case \*
          echo -n $a
      end
    end
  )
  printf "$pieces"\n $argv
end
