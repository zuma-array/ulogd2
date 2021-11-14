if HAVE_PCAP
  OPT_SUBDIR_PCAP = pcap
endif

if HAVE_MYSQL
  OPT_SUBDIR_MYSQL = mysql
endif

if HAVE_PGSQL
  OPT_SUBDIR_PGSQL = pgsql
endif

if HAVE_SQLITE3
  OPT_SUBDIR_SQLITE3 = sqlite3
endif

if HAVE_DBI
  OPT_SUBDIR_DBI = dbi
endif

SUBDIRS = $(OPT_SUBDIR_PCAP) \
	  $(OPT_SUBDIR_MYSQL) \
	  $(OPT_SUBDIR_PGSQL) \
	  $(OPT_SUBDIR_SQLITE3) \
	  $(OPT_SUBDIR_DBI) \
	  ipfix

include $(top_srcdir)/Make_global.am

AM_CPPFLAGS += ${LIBNETFILTER_ACCT_CFLAGS} \
	       ${LIBNETFILTER_CONNTRACK_CFLAGS} \
	       ${LIBNETFILTER_LOG_CFLAGS}

pkglib_LTLIBRARIES = ulogd_output_LOGEMU.la ulogd_output_SYSLOG.la \
			 ulogd_output_OPRINT.la ulogd_output_GPRINT.la \
			 ulogd_output_NACCT.la ulogd_output_XML.la \
			 ulogd_output_GRAPHITE.la

if HAVE_JANSSON
pkglib_LTLIBRARIES += ulogd_output_JSON.la
endif

ulogd_output_GPRINT_la_SOURCES = ulogd_output_GPRINT.c
ulogd_output_GPRINT_la_LDFLAGS = -avoid-version -module

ulogd_output_LOGEMU_la_SOURCES = ulogd_output_LOGEMU.c
ulogd_output_LOGEMU_la_LDFLAGS = -avoid-version -module

ulogd_output_SYSLOG_la_SOURCES = ulogd_output_SYSLOG.c
ulogd_output_SYSLOG_la_LDFLAGS = -avoid-version -module

ulogd_output_OPRINT_la_SOURCES = ulogd_output_OPRINT.c
ulogd_output_OPRINT_la_LDFLAGS = -avoid-version -module

ulogd_output_NACCT_la_SOURCES = ulogd_output_NACCT.c
ulogd_output_NACCT_la_LDFLAGS = -avoid-version -module

ulogd_output_XML_la_SOURCES = ulogd_output_XML.c
ulogd_output_XML_la_LIBADD  = ${LIBNETFILTER_LOG_LIBS} \
			      ${LIBNETFILTER_CONNTRACK_LIBS} \
			      ${LIBNETFILTER_ACCT_LIBS}
ulogd_output_XML_la_LDFLAGS = -avoid-version -module

ulogd_output_GRAPHITE_la_SOURCES = ulogd_output_GRAPHITE.c
ulogd_output_GRAPHITE_la_LDFLAGS = -avoid-version -module

if HAVE_JANSSON
ulogd_output_JSON_la_SOURCES = ulogd_output_JSON.c
ulogd_output_JSON_la_LIBADD  = ${libjansson_LIBS}
ulogd_output_JSON_la_LDFLAGS = -avoid-version -module
endif
