include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += ${LIBNETFILTER_CONNTRACK_CFLAGS}

pkglib_LTLIBRARIES = ulogd_inpflow_NFCT.la

ulogd_inpflow_NFCT_la_SOURCES = ulogd_inpflow_NFCT.c
ulogd_inpflow_NFCT_la_LDFLAGS = -avoid-version -module
ulogd_inpflow_NFCT_la_LIBADD  = $(LIBNETFILTER_CONNTRACK_LIBS)
