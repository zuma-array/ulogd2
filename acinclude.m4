dnl @synopsis CT_CHECK_POSTGRES_DB
dnl
dnl This macro tries to find the headers and libraries for the
dnl PostgreSQL database to build client applications.
dnl
dnl If includes are found, the variable PQINCPATH will be set. If
dnl libraries are found, the variable PQLIBPATH will be set. if no check
dnl was successful, the script exits with a error message.
dnl
dnl @category InstalledPackages
dnl @author Christian Toepp <c.toepp@gmail.com>
dnl @version 2005-12-30
dnl @license AllPermissive

AC_DEFUN([CT_CHECK_POSTGRES_DB], [

AC_ARG_WITH(pgsql,
	[  --with-pgsql=PREFIX		Prefix of your PostgreSQL installation],
	[pg_prefix=$withval], [pg_prefix=])
AC_ARG_WITH(pgsql-inc,
	[  --with-pgsql-inc=PATH		Path to the include directory of PostgreSQL],
	[pg_inc=$withval], [pg_inc=])
AC_ARG_WITH(pgsql-lib,
	[  --with-pgsql-lib=PATH		Path to the libraries of PostgreSQL],
	[pg_lib=$withval], [pg_lib=])


AC_SUBST(PQINCPATH)
AC_SUBST(PQLIBPATH)
AC_SUBST(PQLIBS)
PQLIBS=-lpq

if test "$pg_prefix" != "no"; then

AC_MSG_CHECKING([for PostgreSQL pg_config program])
for d in $pg_prefix/bin /usr/bin /usr/local/bin /usr/local/pgsql/bin /opt/pgsql/bin /opt/packages/pgsql/bin
do
	if test -x $d/pg_config -a "$cross_compiling" = "no";
	then
		AC_MSG_RESULT(found pg_config in $d)
		PQINCPATH=`$d/pg_config --includedir`
		PQLIBPATH=`$d/pg_config --libdir`
		break
	fi
done

if test "$PQINCPATH" = ""; then
   if test "$pg_prefix" != ""; then
      AC_MSG_CHECKING([for PostgreSQL includes in $pg_prefix/include])
      if test -f "$pg_prefix/include/libpq-fe.h" ; then
         PQINCPATH="-I$pg_prefix/include"
         AC_MSG_RESULT([yes])
      else
         AC_MSG_WARN(libpq-fe.h not found)
      fi
      AC_MSG_CHECKING([for PostgreSQL libraries in $pg_prefix/lib])
      if test -f "$pg_prefix/lib/libpq.so" ; then
         PQLIBPATH="-L$pg_prefix/lib"
         AC_MSG_RESULT([yes])
      else
         AC_MSG_WARN(libpq.so not found)
      fi
   else
     if test "$pg_inc" != ""; then
       AC_MSG_CHECKING([for PostgreSQL includes in $pg_inc])
       if test -f "$pg_inc/libpq-fe.h" ; then
         PQINCPATH="-I$pg_inc"
         AC_MSG_RESULT([yes])
       else
         AC_MSG_WARN(libpq-fe.h not found)
       fi
     fi
     if test "$pg_lib" != ""; then
       AC_MSG_CHECKING([for PostgreSQL libraries in $pg_lib])
       if test -f "$pg_lib/libpq.so" ; then
         PQLIBPATH="-L$pg_lib"
         AC_MSG_RESULT([yes])
       else
         AC_MSG_WARN(libpq.so not found)
       fi
     fi
   fi
fi

if test "$PQINCPATH" = "" ; then
  AC_CHECK_HEADER([libpq-fe.h], [], AC_MSG_WARN(libpq-fe.h not found))
fi
if test "$PQLIBPATH" = "" ; then
  AC_CHECK_LIB(pq, PQconnectdb, [], AC_MSG_WARN(libpq.so not found))
fi

fi

])

dnl @synopsis CT_CHECK_PCAP
dnl
dnl This macro tries to find the headers and libraries for libpcap.
dnl
dnl If includes are found, the variable PCAP_INC will be set. If
dnl libraries are found, the variable PCAP_LIB will be set. if no check
dnl was successful, the script exits with a error message.
dnl
dnl @category InstalledPackages
dnl @author Harald Welte <laforge@gnumonks.org>
dnl @version 2006-01-07
dnl @license AllPermissive

AC_DEFUN([CT_CHECK_PCAP], [

AC_ARG_WITH(pcap,
	[  --with-pcap=PREFIX		Prefix of your libpcap installation],
	[pcap_prefix=$withval], [pcap_prefix=])
AC_ARG_WITH(pcap-inc,
	[  --with-pcap-inc=PATH		Path to the include directory of pcap],
	[pcap_inc=$withval], [pcap_inc=/usr/include])
AC_ARG_WITH(pcap-lib,
	[  --with-pcap-lib=PATH		Path to the libraries of pcap],
	[pcap_lib=$withval], [pcap_lib=/usr/lib])


AC_SUBST(PCAP_INC)
AC_SUBST(PCAP_LIB)
AC_SUBST(HAVE_PCAP_LIB)

if test "$pcap_prefix" != "no"; then

if test "$pcap_prefix" != ""; then
   AC_MSG_CHECKING([for libpcap includes in $pcap_prefix/include])
   if test -f "$pcap_prefix/include/pcap.h" ; then
      PCAP_INC="-I$pcap_prefix/include"
      AC_MSG_RESULT([yes])
   else
      AC_MSG_WARN(pcap.h not found)
   fi
   AC_MSG_CHECKING([for libpcap in $pcap_prefix/lib])
   if test -f "$pcap_prefix/lib/libpcap.so" ; then
      PCAP_LIB="-L$pcap_prefix/lib -lpcap";
      AC_MSG_RESULT([yes])
   else
      AC_MSG_WARN(libpcap.so not found)
   fi
else
  if test "$pcap_inc" != ""; then
    AC_MSG_CHECKING([for libpcap includes in $pcap_inc])
    if test -f "$pcap_inc/pcap.h" ; then
      PCAP_INC="-I$pcap_inc"
      AC_MSG_RESULT([yes])
    else
      AC_MSG_WARN(pcap.h not found)
    fi
  fi
  if test "$pcap_lib" != ""; then
    AC_MSG_CHECKING([for libpcap in $pcap_lib])
    if test -f "$pcap_lib/libpcap.so" ; then
      PCAP_LIB="-L$pcap_lib -lpcap";
      AC_MSG_RESULT([yes])
    else
      AC_MSG_WARN(libpcap.so not found)
    fi
  fi
fi

if test "$PCAP_INC" = "" ; then
  AC_CHECK_HEADER([pcap.h], [], AC_MSG_WARN(pcap.h not found))
fi
if test "$PCAP_LIB" = "" ; then
  AC_CHECK_LIB(pcap, pcap_close, [HAVE_PCAP_LIB="yes"], AC_MSG_WARN(libpcap.so not found))
fi

fi

])

