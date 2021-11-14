SUBDIRS = include libipulog src input filter output

ACLOCAL_AMFLAGS = -I m4

dist_man_MANS = ulogd.8

EXTRA_DIST = ulogd.conf.in doc

noinst_DATA = ulogd.conf

edit = sed \
	-e 's,@pkglibdir\@,${pkglibdir},g'

ulogd.conf: Makefile $(srcdir)/ulogd.conf.in
	$(edit) $(srcdir)/ulogd.conf.in >ulogd.conf

dist-hook:
	rm -f ulogd.conf
