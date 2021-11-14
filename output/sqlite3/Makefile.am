include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += ${libsqlite3_CFLAGS}

if HAVE_SQLITE3

pkglib_LTLIBRARIES = ulogd_output_SQLITE3.la

ulogd_output_SQLITE3_la_SOURCES = ulogd_output_SQLITE3.c ../../util/db.c
ulogd_output_SQLITE3_la_LIBADD  = ${libsqlite3_LIBS}
ulogd_output_SQLITE3_la_LDFLAGS = -avoid-version -module

endif
