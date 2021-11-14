include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += -I$(PQINCPATH)

pkglib_LTLIBRARIES = ulogd_output_PGSQL.la

ulogd_output_PGSQL_la_SOURCES = ulogd_output_PGSQL.c ../../util/db.c
ulogd_output_PGSQL_la_LIBADD  = ${PQLIBS}
ulogd_output_PGSQL_la_LDFLAGS = -avoid-version -module
