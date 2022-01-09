include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += $(libmysqlclient_CFLAGS)

pkglib_LTLIBRARIES = ulogd_output_MYSQL.la

ulogd_output_MYSQL_la_SOURCES = ulogd_output_MYSQL.c ../../util/db.c
ulogd_output_MYSQL_la_LIBADD  = $(libmysqlclient_LIBS)
ulogd_output_MYSQL_la_LDFLAGS = -avoid-version -module
