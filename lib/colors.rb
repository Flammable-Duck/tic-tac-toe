# frozen_string_literal: true

# defines some nice ANSI stuff for colorfull output :)
module Color
  escape = '\e['

  BLACK   = escape + '30m'
  RED     = escape + '31m'
  GREEN   = escape + '32m'
  YELLOW  = escape + '33m'
  BLUE    = escape + '34m'
  MAGENTA = escape + '35m'
  CYAN    = escape + '36m'
  WHITE   = escape + '37m'
  DEFAULT = escape + '39m'
  RESET   = escape + '0m'
end
