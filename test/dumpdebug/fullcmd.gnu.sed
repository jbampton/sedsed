# GNU sed extras: /address/I and s///i
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:\\,addr1,I,// !s/a/./igpww .out1
		\,addr1,y/!/!/
#--------------------------------------------------
\,addr1,I,// !s/a/./igpww .out1
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x

# Debugged SED script generated by sedsed-1.1-dev (http://aurelio.net/projects/sedsed/)