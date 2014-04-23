#!/bin/sed -f
#  @(#)14apr89/31aug01 expand.sed by Greg Ubben
		t zzset001
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:/	/ !b 

		t zzclr001
		:zzset001
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:/	/ !b 

		:zzclr001
#--------------------------------------------------
/	/ !b 
# Change the text before a tab to
#   text<MARKER>text<TAB><8 blanks><TAB>
#
		t zzset002
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/\\([^	]*\\)	/\\1&        	/g

		t zzclr002
		:zzset002
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/\\([^	]*\\)	/\\1&        	/g

		:zzclr002
#--------------------------------------------------
s/\([^	]*\)	/\1&        	/g
# Reduce the text between the marker and the tab to less
# than eight characters.  We have to put in 8-(length MOD 8)
# blanks, and this effectively does the modulo operation.
		t zzset003
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM::a

		t zzclr003
		:zzset003
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM::a

		:zzclr003
#--------------------------------------------------
:a
		i\
COMM:s/[^	]\\{8\\}/\\a/g
#--------------------------------------------------
s/[^	]\{8\}/\a/g
		t zzset004
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:t a

		t zzclr004
		:zzset004
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:t a

		:zzclr004
#--------------------------------------------------
t a
# The buffer is now:
#   text<MARKER><(length MOD 8) characters><TAB><expansion><extra blanks><TAB>
#               `-----------------------------------------'
# Notice that the expansion is 8-(length MOD 8), so the 
# underlined part is exactly nine characters.  That's how
# we discard the extra blanks and the tabs.
#                	
		i\
COMM:s/\\(.\\{9\\}\\) *	/\\1/g
#--------------------------------------------------
s/\(.\{9\}\) *	/\1/g
# We have now:
#         text<MARKER><(length MOD 8) characters><TAB><expansion>
#
# so we discard everything between the marker and the tab
#
		t zzset005
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/[^	]*	//g

		t zzclr005
		:zzset005
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/[^	]*	//g

		:zzclr005
#--------------------------------------------------
s/[^	]*	//g
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x

# Debugged SED script generated by sedsed-1.1-dev (http://aurelio.net/projects/sedsed/)
