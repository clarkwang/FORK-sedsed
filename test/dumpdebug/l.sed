		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:l
#--------------------------------------------------
l
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x

# Debugged SED script generated by sedsed-1.1-dev (http://aurelio.net/projects/sedsed/)
