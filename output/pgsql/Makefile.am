include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += $(libpq_CFLAGS)

pkglib_LTLIBRARIES = ulogd_output_PGSQL.la

ulogd_output_PGSQL_la_SOURCES = ulogd_output_PGSQL.c ../../util/db.c
ulogd_output_PGSQL_la_LIBADD  = $(libpq_LIBS)
ulogd_output_PGSQL_la_LDFLAGS = -avoid-version -module
