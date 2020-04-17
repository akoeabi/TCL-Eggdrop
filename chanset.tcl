bind pub n .set pub:sets
bind msg n set msg:sets

proc pub:sets {nick uhost hand chan arg} {
  if {$arg == ""} { 
    puthelp "PRIVMSG $chan :Syntax: .set <#channel> <mode>"
  }
  if {[string match "*#*" [lindex $arg 0]]} {
    set tgrchan [lindex $arg 0]
    set flag [lindex $arg 1]
    channel set $tgrchan $flag
    putquick "NOTICE $nick :Set $flag for $tgrchan"
  } else {
    set flag [lindex $arg 0] 
    channel set $chan $flag
    putquick "NOTICE $nick :Set $flag for $chan" 
  }
}

proc msg:sets {nick uhost hand rest} {
  if {$rest == ""} { 
    puthelp "NOTICE $nick :Syntax: set <#channel> <mode>"
  }
  if {[string match "*#*" [lindex $rest 0]]} {
    set tgrchan [lindex $rest 0]
    set flag [lindex $rest 1]
    channel set $tgrchan $flag
    putquick "NOTICE $nick :Set $flag for $tgrchan"
  }
}
