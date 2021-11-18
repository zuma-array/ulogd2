include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += ${LIBNETFILTER_LOG_CFLAGS} ${LIBNETFILTER_CONNTRACK_CFLAGS}

pkglib_LTLIBRARIES = ulogd_inppkt_UNIXSOCK.la

ulogd_inppkt_UNIXSOCK_la_SOURCES = ulogd_inppkt_UNIXSOCK.c
ulogd_inppkt_UNIXSOCK_la_LDFLAGS = -avoid-version -module

if BUILD_ULOG
pkglib_LTLIBRARIES += ulogd_inppkt_ULOG.la

ulogd_inppkt_ULOG_la_SOURCES = ulogd_inppkt_ULOG.c
ulogd_inppkt_ULOG_la_LDFLAGS = -avoid-version -module
ulogd_inppkt_ULOG_la_LIBADD = ../../libipulog/libipulog.la
endif

if BUILD_NFLOG
pkglib_LTLIBRARIES += ulogd_inppkt_NFLOG.la

ulogd_inppkt_NFLOG_la_SOURCES = ulogd_inppkt_NFLOG.c
ulogd_inppkt_NFLOG_la_LDFLAGS = -avoid-version -module
ulogd_inppkt_NFLOG_la_LIBADD  = $(LIBNETFILTER_LOG_LIBS) \
				$(LIBNETFILTER_CONNTRACK_LIBS)
endif
