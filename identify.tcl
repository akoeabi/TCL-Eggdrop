set nickname "kurs"
set nickpass "kY8^pv"
set nickserv "nickserv@services.dal.net"
set chanserv "chanserv@services.dal.net"
set memoserv "memoserv@services.dal.net"

set init-server {
putserv "privmsg $nickserv :identify $nickpass"
putserv "mode $botnick +iwrs"
}

bind notc - "*This nick is owned by someone else*" ident_nickserv
bind notc - "*Password accepted for*" op_chanserv
bind notc - "*You have*" rm_memos
bind dcc o rop op_chanserv
bind dcc o identify dcc_identify

proc ident_nickserv { nick uhost hand args } {
 global botnick nickpass nickserv    
    putserv "privmsg $nickserv :identify $nickpass"    
  }

proc dcc_identify { hand idx mascara } {
 global nickserv botnick nickpass 
 putserv "privmsg $nickserv :identify $nickpass"
 }

proc op_chanserv { nick uhost hand args } {
   global botnick chanserv channame     
     foreach channame [channels] {
     putserv "privmsg $chanserv :op $channame $botnick" }
}

proc rm_memos { nick uhost hand args } {
   global botnick memoserv     
     putserv "privmsg $memoserv :del all"     
}

bind pub m .kursrelease do_release

proc do_release {nick host handle chan text} {
global nickname password
putquick "privmsg nickserv@services.dal.net :release $nickname $password"
}

bind pub m .kursghost do_ghost

proc do_ghost {nick host handle chan text} {
global nickname password
putquick "privmsg nickserv@services.dal.net :ghost $nickname $password"
}