include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += $(DBI_INC)

if HAVE_DBI

pkglib_LTLIBRARIES = ulogd_output_DBI.la

ulogd_output_DBI_la_SOURCES = ulogd_output_DBI.c ../../util/db.c
ulogd_output_DBI_la_LIBADD  = ${DBI_LIB}
ulogd_output_DBI_la_LDFLAGS = -avoid-version -module

endif
