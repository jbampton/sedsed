#n
#! /bin/sed -f
# remove all trailing /s
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/\\/*$//
#--------------------------------------------------
s/\/*$//
# add ./ if there are no path, only filename
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:/\\// !s/^/.\\//
#--------------------------------------------------
/\// !s/^/.\//
# save path+filename
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:h
#--------------------------------------------------
h
# remove path
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/.*\\///
#--------------------------------------------------
s/.*\///
# do conversion only on filename
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/
#--------------------------------------------------
y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/
# swap, now line contains original path+file, hold space contains conv filename
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:x
#--------------------------------------------------
x
# add converted file name to line, which now contains something like
# path/file-name\nconverted-file-name
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:G
#--------------------------------------------------
G
# check if converted file name is equal to original file name, if it is, do
# not print nothing
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:/^.*\\/\\(.*\\)\\n\\1/ b
#--------------------------------------------------
/^.*\/\(.*\)\n\1/ b
# now, transform path/fromfile\ntofile, into mv path/fromfile path/tofile
# and print it
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x
		i\
COMM:s/^\\(.*\\/\\)\\(.*\\)\\n\\(.*\\)$/mv \\1\\2 \\1\\3/p
#--------------------------------------------------
s/^\(.*\/\)\(.*\)\n\(.*\)$/mv \1\2 \1\3/p
		s/^/PATT:/
		l
		s/^PATT://
		x
		s/^/HOLD:/
		l
		s/^HOLD://
		x

# Debugged SED script generated by sedsed (https://aurelio.net/projects/sedsed/)
