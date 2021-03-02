#################################
# $Id: Makefile.mk.in 616396 2020-09-15 18:22:00Z ivanov $
# Author:  Denis Vakatov (vakatov@ncbi.nlm.nih.gov)
#################################
#
# This template must be "configure"d and included in the very beginning
# of all underlying configurable NCBI project makefiles exactly this way:
#
# srcdir = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/build-system
# include /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/build/Makefile.mk
#
#################################


### Make sure to use a right command shell

SHELL=/bin/bash

### Configurable paths

top_srcdir     = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++
abs_top_srcdir = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++
build_root     = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT
builddir       = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/build
status_dir     = /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/status


### Other paths
### includedir0 is reserved; user makefiles should only use includedir.

includedir0 = $(top_srcdir)/include
includedir  = $(includedir0)
incdir      = $(build_root)/inc
libdir      = $(build_root)/lib
bindir      = $(build_root)/bin
runpath     = -Wl,-rpath,$(libdir)

# Destination root for exported headers (overridden by import_project.sh)
incdest     = $(incdir)

### Optional top-level project groups

OPT_GROUPS = 


### Header dirs to include

STD_INCLUDE = -I$(incdir) -I$(includedir0) $(OPT_GROUPS:%=-I$(includedir0)/%)


### Auxiliary commands, filters

RM       = /bin/rm -f
RMDIR    = /bin/rm -rf
COPY     = /bin/cp -p
BINCOPY  = /bin/bash $(top_srcdir)/scripts/common/impl/if_diff.sh "/bin/ln -f"
TOUCH    = /bin/touch
MKDIR    = /bin/mkdir
BINTOUCH = $(TOUCH)
LN_S     = /bin/ln -s
GREP     = /bin/grep
LDD_R    = /usr/bin/ldd -r
SED      = /bin/sed

### filters for screening out bogus messages
CC_FILTER    = 
CXX_FILTER   = 
AR_FILTER    = 
LINK_FILTER  = 

### wrappers (ccache, purify, etc.)
CC_WRAPPER   = 
CXX_WRAPPER  = 
AR_WRAPPER   = 
LINK_WRAPPER = 

CHECK_ARG = 


### Configurable compiler/librarian/linker binaries and options
### (CONF-Set:  not to be alternated or used anywhere in the user makefiles!)

CONF_CC     = /usr/bin/gcc  -msse4.2 -std=gnu11 -fgnu89-inline
CONF_CXX    = /usr/bin/g++  -std=gnu++14 -msse4.2
CONF_CPP    = gcc -E
CONF_CXXCPP = /usr/bin/g++  -std=gnu++14 -msse4.2 -E
CONF_AR     = ar cr
CONF_RANLIB = ranlib
CONF_LINK   = $(CXX)
CONF_C_LINK = $(CC)
CONF_STRIP  = strip

CONF_CFLAGS   =  -Wall -Wno-format-y2k  -pthread -fopenmp -O2 -fPIC 
CONF_CXXFLAGS =  -Wall -Wno-format-y2k  -pthread -fopenmp -O2 -fPIC 
CONF_CPPFLAGS = -DNDEBUG -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE   -D_MT -D_REENTRANT -D_THREAD_SAFE $(STD_INCLUDE)
CONF_DEPFLAGS = -M
CONF_DEPFLAGS_POST = 
CONF_LDFLAGS  =  -Wl,--enable-new-dtags -Wl,-export-dynamic  -pthread -fopenmp   -O2
CONF_APP_LDFLAGS = 
CONF_DLL_LDFLAGS =  -fPIC $(DLL_UNDEF_FLAGS)
CONF_LIBS     =   -ldl -lm  -lpthread
CONF_C_LIBS   = -lm  -lpthread

# Settings for building tools that shouldn't be cross-compiled, even
# if everything else is.
#
# NB: Code using these settings should not attempt to use any
# third-party packages, or even rely on settings from ncbiconf.h.
# Also, it should require unix and -XCODE, since these macros are
# otherwise undefined at the moment.

CC_FOR_BUILD       = gcc
CPP_FOR_BUILD      = gcc -E
CFLAGS_FOR_BUILD   = -g -O2
CPPFLAGS_FOR_BUILD = 
LDFLAGS_FOR_BUILD  = 

### Configurable compiler/librarian/linker binaries and options
### (ORIG-Set:  not to be alternated, but can be used in the user makefiles
### to alternate the value of relevant flags, e.g. CXX = $(ORIG_CXX) -DFOO_BAR)

ORIG_CC     = $(CONF_CC)
ORIG_CXX    = $(CONF_CXX)
ORIG_CPP    = $(CONF_CPP)
ORIG_CXXCPP = $(CONF_CXXCPP)
ORIG_AR     = $(CONF_AR)
ORIG_RANLIB = $(CONF_RANLIB)
ORIG_LINK   = $(CONF_LINK)
ORIG_C_LINK = $(CONF_C_LINK)
ORIG_STRIP  = $(CONF_STRIP)

ORIG_CFLAGS   = $(CONF_CFLAGS)
ORIG_CXXFLAGS = $(CONF_CXXFLAGS)
ORIG_CPPFLAGS = $(CONF_CPPFLAGS)
ORIG_DEPFLAGS = $(CONF_DEPFLAGS)
ORIG_DEPFLAGS_POST = $(CONF_DEPFLAGS_POST)
ORIG_LDFLAGS  = $(CONF_LDFLAGS)
ORIG_APP_LDFLAGS = $(CONF_APP_LDFLAGS)
ORIG_DLL_LDFLAGS = $(CONF_DLL_LDFLAGS)
ORIG_LIBS     = $(CONF_LIBS)
ORIG_C_LIBS   = $(CONF_C_LIBS)


### Configurable compiler/librarian/linker binaries and options
### (WORK-Set:  to be used by standard build rules;
###             can be modified to meet a particular project requirements)

CC     = $(CONF_CC)
CXX    = $(CONF_CXX)
CPP    = $(CONF_CPP)
CXXCPP = $(CONF_CXXCPP)
AR     = $(CONF_AR)
RANLIB = $(CONF_RANLIB)
LINK   = $(CONF_LINK)
# Linker for pure-C programs
C_LINK = $(CONF_C_LINK)
STRIP  = $(CONF_STRIP)

CFLAGS   = $(CONF_CFLAGS)
CXXFLAGS = $(CONF_CXXFLAGS)
CPPFLAGS = $(CONF_CPPFLAGS)
DEPFLAGS = $(CONF_DEPFLAGS)
DEPFLAGS_POST = $(CONF_DEPFLAGS_POST)
LDFLAGS  = $(CONF_LDFLAGS)
APP_LDFLAGS = $(CONF_APP_LDFLAGS)
DLL_LDFLAGS = $(CONF_DLL_LDFLAGS)
LIBS     = $(CONF_LIBS)
# Libraries for pure-C programs
C_LIBS   = $(CONF_C_LIBS)
PRE_LIBS =

# To add directory /foo to the list to search at runtime, you can add
# $(RUNPATH_FLAG)/foo to your LDFLAGS.
RUNPATH_FLAG = -Wl,-rpath,
# Special case: add the searcher's current location (only works on
# Linux and Solaris)
RUNPATH_ORIGIN = -Wl,-rpath,'$$ORIGIN'

### Debug/release suffixes
# "Debug" for debugging, "Release" for release
DEBUG_SFX = Release
# 'd' for debugging, empty for release
D_SFX=

### Muli-thread suffix
# "MT" if multi-thread,  "" if single-thread
MT_SFX = MT

### Whether to build apps
APP_OR_NULL = app

### DLL specifics
# whether to build the lib as static or dynamic; valid settings
# are lib, dll, both, $(USUAL_AND_DLL), and $(USUAL_AND_LIB).
ORIG_LIB_OR_DLL = lib
LIB_OR_DLL    = $(ORIG_LIB_OR_DLL)
USUAL_AND_DLL = both
USUAL_AND_LIB = lib

# Library name suffix; either "-dll" or empty.  Normally EMPTY for
# --with-dll configurations, which can simply exploit the linker's
# general preference for dynamic libraries.
DLL          = -dll
# Library name suffix; either "-static" or empty.
STATIC       = -static
# Hard-coded; use only for "LIB_OR_DLL = both" libraries!
FORCE_STATIC = -static

LINK_DLL      = $(CXX)  -shared -o
LINK_LOADABLE = 
CFLAGS_DLL    = 
CXXFLAGS_DLL  = 

dll_ext      = .so
loadable_ext = .so

# For various reasons, we traditionally allow shared libraries to have
# undefined symbols; however, it's also possible to ask the linker to
# be stricter by switching DLL_UNDEF_FLAGS to $(FORBID_UNDEF).
ALLOW_UNDEF     = 
FORBID_UNDEF    = -Wl,--no-undefined -Wl,--no-allow-shlib-undefined
DLL_UNDEF_FLAGS = $(ALLOW_UNDEF)
LDFLAGS_DLL     = $(LDFLAGS)

# Alternate DLL_LIB setting to use when configured --with-dll.
DLL_DLIB = $(DLL_LIB)
# Alternate LIB and LIBS settings to use when configured --without-dll.
STATIC_LIB = $(LIB)
STATIC_LIBS = $(LIBS)

### To enable extra, potentially unsafe, optimization, use these flags
### INSTEAD of $(ORIG_*FLAGS).
### Note: If you have compiled any files with $(FAST_CXXFLAGS), you
### should pass $(FAST_LDFLAGS) to the linker for consistency.
FAST_CFLAGS   =   -Wall -Wno-format-y2k  -pthread -fopenmp -fPIC   -O3 -finline-functions -fstrict-aliasing -fomit-frame-pointer
FAST_CXXFLAGS =   -Wall -Wno-format-y2k  -pthread -fopenmp -fPIC   -O3 -finline-functions -fstrict-aliasing -fomit-frame-pointer
FAST_LDFLAGS  =   -Wl,--enable-new-dtags -Wl,-export-dynamic  -pthread -fopenmp    -O3 -finline-functions -fstrict-aliasing -fomit-frame-pointer

UNSAFE_MATH_FLAG = -funsafe-math-optimizations
SSE4_1_FLAG      = -msse4.1
AES_FLAG         = -maes

COLOR_DIAGNOSTICS = -fdiagnostics-color=always

# Refrain from optimizations that assume no aliasing.
NO_STRICT_ALIASING = -fno-strict-aliasing

# Do/do not discard shared libraries that appear unnecessary.
AS_NEEDED    = -Wl,--as-needed
NO_AS_NEEDED = -Wl,--no-as-needed

# Do/do not link static archives in their entirety, even if some portions
# appear unnecessary.
WHOLE_ARCHIVE    = -Wl,--whole-archive
NO_WHOLE_ARCHIVE = -Wl,--no-whole-archive

### For platform-specific includes
COMPILER = gcc
OSTYPE   = linux

### Pointer size
NCBI_PLATFORM_BITS = 64

### Support for Objective C++ (needed to use some Mac OS X APIs)
OBJCXX_CXXFLAGS = 
OBJCXX_LIBS     = 
FOUNDATION_LIBS = 

### Support for OpenMP
OPENMP_FLAGS = 

### Post-link command (empty by default, historically needed for
### graphical apps on Mac OS X)
POST_LINK = @:

### Configuration summary
signature = GCC_750-ReleaseMT64--x86_64-unknown-linux5.4.0-gnu2.27-tiagotcc_VirtualBox

### Do not use any default suffix rules
.SUFFIXES:

### Use automatic auto-dependencies (SunOS make, .KEEP_STATE:)

### "rules"/"rules_with_autodep" (whether to build auto-deps for GNU make)
Rules=rules_with_autodep
### Kludge module to workaround an RTTI bug (Sun WorkShop only)
serial_ws50_rtti_kludge=
### Special object file needed for atomic counters
ncbicntr=
### Holds Java Native Interface glue in --with-jni builds
ncbi_java=

#################################
# Some platform-specific system libs that can be linked eventually
THREAD_LIBS  = -lpthread
NETWORK_LIBS =   
MATH_LIBS    = -lm
KSTAT_LIBS   = 
RPCSVC_LIBS  = 
CRYPT_LIBS   = -lcrypt
DL_LIBS      = -ldl
RT_LIBS      = 
DEMANGLE_LIBS= 
ICONV_LIBS   = 
UUID_LIBS    = 

# libconnect now uses NCBI_SwapPointers, which conditionally requires
# LIB to include xncbi (depending on certain configuration details);
# this macro always expands to the right value.
NCBIATOMIC_LIB = 

# This is a temporary workaround for Solaris/Intel platforms where
# we had to do a kludgy patch to work around a faulty Sybase "tli" lib.
# One can use this instead of $(NETWORK_LIBS) (which has the patch built in)
# if he is not using Sybase libs (and maybe even does not have them installed).
NETWORK_PURE_LIBS =   

# Extra name-resolution libraries; $(NETWORK[_PURE]_LIBS) should normally
# suffice, but in some specialized cases you may need to prepend
# $(RESOLVER_LIBS).
RESOLVER_LIBS = -lresolv

# Specialized call stack examination library; normally added to
# baseline LIBS if present for the sake of corelib, but potentially
# still useful with C_LIBS.
LIBUNWIND_INCLUDE = 
LIBUNWIND_LIBS    = 

# Library for examining DWARF debugging info; normally added to
# baseline LIBS if present for the sake of corelib, but potentially
# still useful with C_LIBS.
LIBDW_INCLUDE = 
LIBDW_LIBS    = 

# Library for producing prettier stack traces; LIBS here just arranges
# for automatic stack traces on most fatal errors.
BACKWARD_CPP_INCLUDE = 
BACKWARD_CPP_LIBS    = 

#################################
# Optional variables that may be needed to build some projects
# (see in "configure.ac" for the pre-set defaults)
#

# --with-local-lbsm:  --->  src/connect/Makefile.[x]connect.lib
LOCAL_LBSM = ncbi_lbsmd_stub
# --with-ncbi-crypt:  --->  src/connect/ext/Makefile.connext.lib
NCBI_CRYPT = ncbi_crypt_stub

# non-public (X)CONNECT extensions
CONNEXT  = 
XCONNEXT = 

# NCBI C++ API for BerkeleyDB
BDB_LIB       = 
BDB_CACHE_LIB = 

# NCBI C++ API for SQLite 3.x
SQLITE3_WRAPPER = 

# Possibly absent DBAPI drivers (depending on whether the relevant
# 3rd-party libraries are present, and whether DBAPI was disabled altogether)
DBAPI_DRIVER  = dbapi_driver
DBAPI_CTLIB   = 
DBAPI_FTDS    = ncbi_xdbapi_ftds
DBAPI_FTDS95  = ncbi_xdbapi_ftds95
DBAPI_FTDS100 = ncbi_xdbapi_ftds100
DBAPI_MYSQL   = 
DBAPI_ODBC    = 

# Compression libraries; the LIBS version goes in LIBS, and the LIB
# version goes in LIB.
Z_INCLUDE   = -I$(includedir)/util/compress/zlib -I$(includedir0)/util/compress/zlib
Z_LIBS      = 
Z_LIB       = z
BZ2_INCLUDE = -I$(includedir)/util/compress/bzip2 -I$(includedir0)/util/compress/bzip2
BZ2_LIBS    = 
BZ2_LIB     = bz2
LZO_INCLUDE = 
LZO_LIBS    = 
ZSTD_INCLUDE= 
ZSTD_LIBS   = 

CMPRS_INCLUDE = $(Z_INCLUDE) $(BZ2_INCLUDE) $(LZO_INCLUDE)
CMPRS_LIBS    = $(Z_LIBS) $(BZ2_LIBS) $(LZO_LIBS)
CMPRS_LIB     = $(Z_LIB) $(BZ2_LIB)

# Perl-Compatible Regular Expressions
# For historical reasons, the bundled (LIB) version contains the POSIX
# wrapper and goes by the name "regexp".
PCRE_INCLUDE   = -I$(includedir)/util/regexp -I$(includedir0)/util/regexp
PCRE_LIBS      = 
PCREPOSIX_LIBS = 
PCRE_LIB       = regexp

# mbedTLS, OpenSSL, GNUTLS, and potential supporting packages: headers and libs.
# TLS_* covers *both* GNUTLS and mbedTLS.
MBEDTLS_INCLUDE = 
MBEDTLS_LIBS    = 
GMP_INCLUDE     = 
GMP_LIBS        = 
GCRYPT_INCLUDE  = 
GCRYPT_LIBS     = 
NETTLE_INCLUDE  = 
NETTLE_LIBS     = 
GNUTLS_INCLUDE  = 
GNUTLS_LIBS     = 
OPENSSL_INCLUDE = 
OPENSSL_LIBS    = 
OPENSSL_STATIC_LIBS = 
TLS_INCLUDE     = $(GNUTLS_INCLUDE) $(MBEDTLS_INCLUDE)
TLS_LIBS        = $(GNUTLS_LIBS) $(MBEDTLS_LIBS)

# Kerberos 5 (via GSSAPI)
KRB5_INCLUDE = 
KRB5_LIBS    = 

# Sybase:  headers and libs
SYBASE_INCLUDE = 
SYBASE_LIBS    = 
SYBASE_DLLS    = 
SYBASE_DBLIBS  = 

# FreeTDS -- specific bundled versions, default
FTDS95_CTLIB_LIBS    = 
FTDS95_CTLIB_LIB     = 
FTDS95_CTLIB_INCLUDE = 
FTDS95_LIBS          = 
FTDS95_LIB           = 
FTDS95_INCLUDE       = 

FTDS100_CTLIB_LIBS    = 
FTDS100_CTLIB_LIB     = 
FTDS100_CTLIB_INCLUDE = 
FTDS100_LIBS          = 
FTDS100_LIB           = 
FTDS100_INCLUDE       = 

FTDS_LIBS    = 
FTDS_LIB     = 
FTDS_INCLUDE = 

# MySQL: headers and libs
MYSQL_INCLUDE = 
MYSQL_LIBS    = 

# Berkeley DB: headers and libs
BERKELEYDB_INCLUDE         = 
BERKELEYDB_STATIC_LIBS     = 
BERKELEYDB_LIBS            = 
BERKELEYDB_CXX_STATIC_LIBS = 
BERKELEYDB_CXX_LIBS        = 

# ODBC: headers and libs
ODBC_INCLUDE = -I$(includedir)/dbapi/driver/odbc/unix_odbc -I$(includedir0)/dbapi/driver/odbc/unix_odbc
ODBC_LIBS    = 

# PYTHON: headers and libs (default + specific versions)
PYTHON_INCLUDE   = 
PYTHON_LIBS      = 
PYTHON25_INCLUDE = 
PYTHON25_LIBS    = 
PYTHON26_INCLUDE = 
PYTHON26_LIBS    = 
PYTHON27_INCLUDE = 
PYTHON27_LIBS    = 
PYTHON3_INCLUDE  = 
PYTHON3_LIBS     = 

# Perl: executable, headers and libs
PERL         = /usr/bin/perl
PERL_INCLUDE = 
PERL_LIBS    = 

# Java: headers and installation root
JDK_INCLUDE = 
JDK_PATH    = 

# Boost: headers and libs [use as $(BOOST_LIBPATH) $(BOOST_*_LIBS) $(RT_LIBS)]
BOOST_INCLUDE              =  -Wno-unused-local-typedefs
BOOST_LIBPATH              = 
BOOST_TAG                  = -gcc75-mt--64
BOOST_CHRONO_LIBS          = 
BOOST_CHRONO_STATIC_LIBS   = 
BOOST_FILESYSTEM_LIBS      = 
BOOST_FILESYSTEM_STATIC_LIBS = 
BOOST_IOSTREAMS_LIBS       = 
BOOST_IOSTREAMS_STATIC_LIBS = 
BOOST_PROGRAM_OPTIONS_LIBS = 
BOOST_PROGRAM_OPTIONS_STATIC_LIBS = 
BOOST_REGEX_LIBS           = 
BOOST_REGEX_STATIC_LIBS    = 
BOOST_SERIALIZATION_LIBS   = 
BOOST_SERIALIZATION_STATIC_LIBS = 
BOOST_SYSTEM_LIBS          = 
BOOST_SYSTEM_STATIC_LIBS   = 
BOOST_TEST_PEM_LIBS        = 
BOOST_TEST_PEM_STATIC_LIBS = 
BOOST_TEST_TEM_LIBS        = 
BOOST_TEST_TEM_STATIC_LIBS = 
BOOST_TEST_UTF_LIBS        = 
BOOST_TEST_UTF_STATIC_LIBS = 
BOOST_THREAD_LIBS          = 
BOOST_THREAD_STATIC_LIBS   = 
BOOST_TEST_LIBS            = $(BOOST_LIBPATH) $(BOOST_TEST_UTF_LIBS)
BOOST_TEST_STATIC_LIBS     = $(BOOST_LIBPATH) $(BOOST_TEST_UTF_STATIC_LIBS)
# Temporary, for backward compatibility, to be removed later:
BOOST_LIBS            = $(BOOST_TEST_LIBS)
BOOST_STATIC_LIBS     = $(BOOST_TEST_STATIC_LIBS)

# NCBI C Toolkit:  headers and libs
NCBI_C_INCLUDE = 
NCBI_C_LIBPATH = 
NCBI_C_ncbi = 

# OpenGL: headers and libs (including core X dependencies) for code
# not using other toolkits.  (The wxWidgets variables already include
# these as appropriate.)
OPENGL_INCLUDE     = 
OPENGL_LIBS        = 
OPENGL_STATIC_LIBS = 
OSMESA_INCLUDE     = 
OSMESA_LIBS        = 
OSMESA_STATIC_LIBS = 
GLUT_INCLUDE       = 
GLUT_LIBS          = 
GLEW_INCLUDE       = 
GLEW_LIBS          = 
GLEW_STATIC_LIBS   = 
GL2PS_INCLUDE      = 
GL2PS_LIBS         = 
GL2PS_STATIC_LIBS  = 
# Macro indicating optional use of GL2PS, for the sake of project_tree_builder.
GL2PS_OPT          = OpenGL

# wxWidgets (2.6 or newer):  headers and libs
WXWIDGETS_INCLUDE        = 
WXWIDGETS_LIBS           = 
WXWIDGETS_STATIC_LIBS    = 
WXWIDGETS_GL_LIBS        = 
WXWIDGETS_GL_STATIC_LIBS = 
# Assign WXWIDGETS_POST_LINK to POST_LINK when building WX apps.
WXWIDGETS_POST_LINK      = :

# Fast-CGI lib:  headers and libs
FASTCGI_INCLUDE = 
FASTCGI_LIBS    = 
# Fast-CGI lib:  (module to add to the "xcgi" library)
FASTCGI_OBJS    = 

# NCBI SSS:  headers, library path, libraries
NCBI_SSS_INCLUDE = 
NCBI_SSS_LIBPATH = 
LIBSSSUTILS      = 
LIBSSSDB         = 
sssutils         = 
NCBILS2_LIB      = ncbils2_cli ncbils2_asn ncbils2_cmn
NCBILS_LIB       = $(NCBILS2_LIB)

# NCBI SRA/VDB Toolkit
VDB_INCLUDE     = 
VDB_LIBS        = 
VDB_STATIC_LIBS = 
VDB_REQ         = VDB
VDB_POST_LINK   = :
bamread               = 
sraread               = 
ncbi_id2proc_snp      = 
ncbi_id2proc_wgs      = 
ncbi_xloader_bam      = 
ncbi_xloader_csra     = 
ncbi_xloader_snp      = 
ncbi_xloader_sra      = 
ncbi_xloader_vdbgraph = 
ncbi_xloader_wgs      = 

# NCBI NGS SDK
NGS_INCLUDE     = 
NGS_LIBS        = 
NGS_STATIC_LIBS = 

# SP:  headers, libraries
SP_INCLUDE = 
SP_LIBS    = 

# ORBacus CORBA headers, library path, libraries
ORBACUS_INCLUDE = 
ORBACUS_LIBPATH = 
LIBOB           = 
# LIBIMR should be empty for single-threaded builds
LIBIMR          = 

# IBM's International Components for Unicode
ICU_CONFIG      = /icu-config
ICU_INCLUDE     = 
ICU_LIBS        = 
ICU_STATIC_LIBS = 

# XML/XSL support:
EXPAT_INCLUDE      = 
EXPAT_LIBS         = 
EXPAT_STATIC_LIBS  = 
SABLOT_INCLUDE     = 
SABLOT_LIBS        = 
SABLOT_STATIC_LIBS = 
LIBXML_INCLUDE     = 
LIBXML_LIBS        = 
LIBXML_STATIC_LIBS = 
LIBXSLT_INCLUDE    = 
LIBXSLT_MAIN_LIBS  = 
LIBXSLT_MAIN_STATIC_LIBS = 
XSLTPROC           = :
LIBEXSLT_INCLUDE   = 
LIBEXSLT_LIBS      = 
LIBEXSLT_STATIC_LIBS=
LIBXSLT_LIBS       = $(LIBEXSLT_LIBS) $(LIBXSLT_MAIN_LIBS)
LIBXSLT_STATIC_LIBS= $(LIBEXSLT_STATIC_LIBS) $(LIBXSLT_MAIN_STATIC_LIBS)
XERCES_INCLUDE     = 
XERCES_LIBS        = 
XERCES_STATIC_LIBS = 
XALAN_INCLUDE      = 
XALAN_LIBS         = 
XALAN_STATIC_LIBS  = 
ZORBA_INCLUDE      = 
ZORBA_LIBS         = 
ZORBA_STATIC_LIBS  = 

# OpenEye OEChem library:
OECHEM_INCLUDE = 
OECHEM_LIBS    = 

# Sun Grid Engine (libdrmaa):
SGE_INCLUDE = 
SGE_LIBS    = 

# muParser
MUPARSER_INCLUDE = 
MUPARSER_LIBS    = 

# HDF5
HDF5_INCLUDE = 
HDF5_LIBS    = 

# SQLite 3.x
SQLITE3_INCLUDE     = 
SQLITE3_LIBS        = 
SQLITE3_STATIC_LIBS = 

# Various image-format libraries
JPEG_INCLUDE  = 
JPEG_LIBS     = 
PNG_INCLUDE   = 
PNG_LIBS      = 
TIFF_INCLUDE  = 
TIFF_LIBS     = 
GIF_INCLUDE   = 
GIF_LIBS      = 
UNGIF_INCLUDE = 
UNGIF_LIBS    = 
XPM_INCLUDE   = 
XPM_LIBS      = 

IMAGE_LIBS    = $(TIFF_LIBS) $(JPEG_LIBS) $(PNG_LIBS) $(GIF_LIBS) $(XPM_LIBS)

# FreeType, FTGL
FREETYPE_INCLUDE = 
FREETYPE_LIBS    = 
FTGL_INCLUDE     = 
FTGL_LIBS        = 

# libmagic (file-format identification)
MAGIC_INCLUDE = 
MAGIC_LIBS    = 

# libcurl (URL retrieval)
CURL_INCLUDE = 
CURL_LIBS    = 

# libmimetic (MIME handling)
MIMETIC_INCLUDE = 
MIMETIC_LIBS    = 

# libgSOAP++
GSOAP_PATH     = No_GSOAP
GSOAP_INCLUDE  = 
GSOAP_LIBS     = 
GSOAP_SOAPCPP2 = 
GSOAP_WSDL2H   = 

# Apache Avro
AVRO_INCLUDE     = 
AVRO_LIBS        = 
AVRO_STATIC_LIBS = 
AVROGENCPP       = 

# USC Cereal (header-only)
CEREAL_INCLUDE = 

# SASL 2
SASL2_INCLUDE = 
SASL2_LIBS    = 

# MongoDB (deprecated legacy interface)
MONGODB_INCLUDE     = 
MONGODB_LIBS        = 
MONGODB_STATIC_LIBS = 

# MongoDB 3.x
MONGODB3_INCLUDE     = 
MONGODB3_LIBS        = 
MONGODB3_STATIC_LIBS = 

# LevelDB
LEVELDB_INCLUDE = 
LEVELDB_LIBS    = 

# Google Mock
GMOCK_INCLUDE     = 
GMOCK_LIBS        = 
GMOCK_STATIC_LIBS = 

# LAPACK
LAPACK_INCLUDE = 
LAPACK_LIBS    = 

# LMDB; a LIBS version goes in LIBS, and the LIB version goes in LIB.
LMDB_INCLUDE = -I$(includedir)/util/lmdb -I$(includedir0)/util/lmdb
LMDB_LIBS    = -lpthread
LMDB_STATIC_LIBS = -lpthread
LMDB_LIB     = lmdb

# libuv
LIBUV_INCLUDE     = 
LIBUV_LIBS        = 
LIBUV_STATIC_LIBS = 

# libssh2
LIBSSH2_INCLUDE     = 
LIBSSH2_LIBS        = 
LIBSSH2_STATIC_LIBS = 

# Datastax Cassandra driver
CASSANDRA_INCLUDE     = 
CASSANDRA_LIBS        = 
CASSANDRA_STATIC_LIBS = 

# HTTP/2 libraries
NGHTTP2_INCLUDE     = 
NGHTTP2_LIBS        = 
NGHTTP2_STATIC_LIBS = 
H2O_INCLUDE         = 
H2O_LIBS            = 
H2O_STATIC_LIBS     = 

# InfluxDB support library
INFLUXDB_INCLUDE = 

# libxlsxwriter
LIBXLSXWRITER_INCLUDE     = 
LIBXLSXWRITER_LIBS        = 
LIBXLSXWRITER_STATIC_LIBS = 

# gRPC and raw Protobuf
PROTOBUF_INCLUDE     = 
PROTOBUF_LIBS        = 
PROTOBUF_BIN         = 
GRPC_INCLUDE         = 
GRPC_LIBS            = 
GRPC_UNSECURE_LIBS   = 
GRPC_REFLECTION_LIBS = 
GRPC_BIN             = 
# Macro indicating optional use of PROTOBUF and GRPC
PROTOBUF_OPT = objects
GRPC_OPT     = objects

# Microsoft Guidelines Support Library
MSGSL_INCLUDE = 

# Amazon Web Services (just S3 for now)
AWS_SDK_INCLUDE     = 
AWS_SDK_LIBS        = 
AWS_SDK_STATIC_LIBS = 

# Hiredis
HIREDIS_INCLUDE     = 
HIREDIS_LIBS        = 
HIREDIS_STATIC_LIBS = 

# Apache Arrow (specifically focusing on Parquet)
APACHE_ARROW_INCLUDE     = 
APACHE_ARROW_LIBS        = 
APACHE_ARROW_STATIC_LIBS = 

# Kafka
LIBRDKAFKA_INCLUDE   = 
LIBRDKAFKA_LIBS      = 
LIBRDKAFKA_STATIC_LIBS = 
CPPKAFKA_INCLUDE     = 
CPPKAFKA_LIBS        = 
CPPKAFKA_STATIC_LIBS = 

# Compress
COMPRESS_LDEP = $(CMPRS_LIB)
COMPRESS_LIBS = xcompress $(COMPRESS_LDEP)

#################################
# Useful sets of object libraries
GENBANK_LDEP = \
    ncbi_xreader_id1 ncbi_xreader_id2 ncbi_xreader_cache \
    $(GENBANK_PSG_CLIENT_LDEP) $(GENBANK_READER_PUBSEQOS_LIBS)
GENBANK_LIBS = ncbi_xloader_genbank $(GENBANK_LDEP)

GENBANK_READER_LDEP = $(XCONNEXT) xconnect id1 id2 $(SOBJMGR_LIBS) $(COMPRESS_LIBS)
GENBANK_READER_LIBS = ncbi_xreader $(GENBANK_READER_LDEP)

# In-house-only PubSeqOS loader (not always built)
ncbi_xreader_pubseqos = 
ncbi_xreader_pubseqos2 = 
GENBANK_READER_PUBSEQOS_LDEP = $(DBAPI_DRIVER) $(GENBANK_READER_LIBS)
#  GENBANK_READER_PUBSEQOS_LDEP = xconnect $(GENBANK_READER_LIBS)
GENBANK_READER_PUBSEQOS_LIBS = $(ncbi_xreader_pubseqos) $(GENBANK_READER_PUBSEQOS_LDEP)

GENBANK_READER_ID1_LDEP = xconnect id1 $(GENBANK_READER_LIBS)
GENBANK_READER_ID1_LIBS = ncbi_xreader_id1 $(GENBANK_READER_ID1_LDEP)

GENBANK_READER_ID2_LDEP = xconnect id2 seqsplit $(GENBANK_READER_LIBS)
GENBANK_READER_ID2_LIBS = ncbi_xreader_id2 $(GENBANK_READER_ID2_LDEP)

GENBANK_READER_CACHE_LDEP = $(GENBANK_READER_LIBS)
GENBANK_READER_CACHE_LIBS = ncbi_xreader_cache $(GENBANK_READER_CACHE_LDEP)

GENBANK_READER_GICACHE_LDEP = $(GENBANK_READER_LIBS)
GENBANK_READER_GICACHE_LIBS = ncbi_xreader_gicache \
        $(GENBANK_READER_GICACHE_LDEP)

# Interdependent sequence libraries + seqcode.  Does not include seqset.
SEQ_LIBS = seq seqcode sequtil
SOBJMGR_LDEP = genome_collection seqedit seqsplit submit seqset $(SEQ_LIBS) \
    pub medline biblio general xser xutil xncbi
SOBJMGR_LIBS = xobjmgr $(SOBJMGR_LDEP)
OBJMGR_LIBS = $(GENBANK_LIBS)

# Overlapping with qall is poor, so we have a second macro to make it
# easier to stay out of trouble.
QOBJMGR_ONLY_LIBS = xobjmgr id2 seqsplit id1 genome_collection submit seqset \
    $(SEQ_LIBS) pub medline biblio general xcompress $(CMPRS_LIB)
QOBJMGR_LIBS = $(QOBJMGR_ONLY_LIBS) qall
QOBJMGR_STATIC_LIBS = $(QOBJMGR_ONLY_LIBS:%=%$(STATIC)) qall

# EUtils
EUTILS_LIBS = eutils egquery elink epost esearch espell esummary \
              einfo uilist ehistory

# Object readers
OBJREAD_LIBS = xobjread variation submit xlogging

# formatting code
XFORMAT_LIBS = xformat xcleanup gbseq $(OBJEDIT_LIBS)

# object editing library
OBJEDIT_LIBS = xobjedit $(OBJREAD_LIBS) taxon3 mlacli mla medlars pubmed valid 

# standard data loader configuration, plus supporting libraries
DATA_LOADERS_UTIL_LIB = data_loaders_util \
                        ncbi_xloader_asn_cache asn_cache bdb \
                        ncbi_xloader_lds2 lds2 $(OBJREAD_LIBS) sqlitewrapp \
                        ncbi_xloader_blastdb seqdb blastdb $(LMDB_LIB) \
                        $(ncbi_xreader_pubseqos2) ncbi_xdbapi_ftds $(FTDS_LIB) \
                        $(ncbi_xloader_wgs) $(ncbi_xloader_csra) \
                        $(SRAREAD_LIBS)

DATA_LOADERS_UTIL_LIBS = $(SQLITE3_LIBS) $(GENBANK_THIRD_PARTY_LIBS) \
                         $(BERKELEYDB_LIBS) $(FTDS_LIBS) \
                         $(VDB_LIBS) $(BLAST_THIRD_PARTY_LIBS)

### Extra macro definitions from /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/algo/blast/Makefile.blast_macros.mk

#line 1 "/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/algo/blast/Makefile.blast_macros.mk"
#################################
# $Id: Makefile.blast_macros.mk 565266 2018-06-08 17:19:08Z lavr $
# This file contains macro definitions for using libraries maintained by the
# BLAST TEAM
# Author:  Christiam Camacho (camacho@ncbi.nlm.nih.gov)
#################################


BLAST_FORMATTER_MINIMAL_LIBS = xblastformat align_format taxon1 blastdb_format \
    gene_info $(XFORMAT_LIBS) xalnmgr blastxml blastxml2 xcgi xhtml
# BLAST_FORMATTER_LIBS = $(BLAST_FORMATTER_MINIMAL_LIBS)
BLAST_FORMATTER_LIBS = $(BLAST_INPUT_LIBS)
BLAST_DB_DATA_LOADER_LIBS = ncbi_xloader_blastdb_rmt ncbi_xloader_blastdb
BLAST_INPUT_LIBS = blastinput \
    $(BLAST_DB_DATA_LOADER_LIBS) $(BLAST_FORMATTER_MINIMAL_LIBS)

# Libraries required to link against the internal BLAST SRA library
BLAST_SRA_LIBS=blast_sra $(SRAXF_LIBS) vxf $(SRA_LIBS)

# BLAST_FORMATTER_LIBS and BLAST_INPUT_LIBS need $BLAST_LIBS
BLAST_LDEP = xalgoblastdbindex composition_adjustment \
             xalgodustmask xalgowinmask seqmasks_io seqdb blast_services xalnmgr \
             xobjutil $(OBJREAD_LIBS) xnetblastcli xnetblast blastdb scoremat tables $(LMDB_LIB)
BLAST_LIBS = proteinkmer xblast $(BLAST_LDEP)

# BLAST additionally needs xconnect $(SOBJMGR_LIBS) or $(OBJMGR_LIBS)

BLAST_THIRD_PARTY_INCLUDE       = $(LMDB_INCLUDE)
BLAST_THIRD_PARTY_LIBS          = $(LMDB_LIBS)
BLAST_THIRD_PARTY_STATIC_LIBS   = $(LMDB_STATIC_LIBS)


### Extra macro definitions from /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/objtools/data_loaders/genbank/Makefile.ncbi_xloader_genbank.mk

#line 1 "/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/objtools/data_loaders/genbank/Makefile.ncbi_xloader_genbank.mk"
# $Id: Makefile.ncbi_xloader_genbank.mk 590906 2019-08-07 16:22:38Z vakatov $

GENBANK_THIRD_PARTY_LIBS        = $(PSG_CLIENT_LIBS)
GENBANK_THIRD_PARTY_STATIC_LIBS = $(PSG_CLIENT_STATIC_LIBS)
GENBANK_PSG_CLIENT_LIB          = psg_client
GENBANK_PSG_CLIENT_LDEP         = $(GENBANK_PSG_CLIENT_LIB) xconnserv

# REQUIRES = PSGLoader

### Extra macro definitions from /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/objtools/pubseq_gateway/client/Makefile.psg_client_macros.mk

#line 1 "/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/src/objtools/pubseq_gateway/client/Makefile.psg_client_macros.mk"
# $Id: Makefile.psg_client_macros.mk 587879 2019-06-12 12:47:49Z ucko $

PSG_CLIENT_LIBS = $(LIBUV_LIBS) $(NGHTTP2_LIBS)
PSG_CLIENT_STATIC_LIBS = $(LIBUV_STATIC_LIBS) $(NGHTTP2_STATIC_LIBS)
