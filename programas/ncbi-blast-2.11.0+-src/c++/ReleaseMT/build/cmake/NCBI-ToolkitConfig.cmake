set(NCBI_CPP_TOOLKIT_VERSION_MAJOR   @NCBI_CPP_TOOLKIT_VERSION_MAJOR@)
set(NCBI_CPP_TOOLKIT_VERSION_MINOR   @NCBI_CPP_TOOLKIT_VERSION_MINOR@)
set(NCBI_CPP_TOOLKIT_VERSION_PATCH   @NCBI_CPP_TOOLKIT_VERSION_PATCH@)
set(NCBI_CPP_TOOLKIT_PACKAGE_VERSION @NCBI_CPP_TOOLKIT_VERSION@)


@PACKAGE_INIT@

set_and_check(NCBI_CPP_TOOLKIT_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/@PACKAGE_INCLUDE_INSTALL_DIRS@")
set_and_check(NCBI_CPP_TOOLKIT_SITE_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/@PACKAGE_SITE_INCLUDE_INSTALL_DIRS@")
set_and_check(NCBI_CPP_TOOLKIT_LIBRARY_DIRS "${PACKAGE_PREFIX_DIR}/@PACKAGE_LIBRARY_INSTALL_DIRS@")

##############################################################################
# 
# This is an exhaustive set of all definitions used in client CMakeLists.*.txt
# files.  We enumerate everything here to allow the system to forward all
# definitions and make them available for any client code that would want to
# use it.
#
# This list is sorted / uniqed.  Order is not relevant, so choose an order that
# begets an assurance of no duplication.
#
set(BAM_LIBS "@BAM_LIBS@")
set(BERKELEYDB_INCLUDE "")
set(BERKELEYDB_LIBS "")
set(BLAST_INPUT_LIBS "@BLAST_INPUT_LIBS@")
set(BLAST_LIBS "@BLAST_LIBS@")
set(BOOST_INCLUDE " -Wno-unused-local-typedefs")
set(BOOST_iNCLUDE "@BOOST_iNCLUDE@")
set(BUILD_SHARED_LIBS "@BUILD_SHARED_LIBS@")
set(BZ2_INCLUDE "-I$(includedir)/util/compress/bzip2 -I$(includedir0)/util/compress/bzip2")
set(BZ2_LIB "bz2")
set(BZ2_LIBS "")
set(CMAKE_BUILD_TYPE "@CMAKE_BUILD_TYPE@")
set(CMAKE_CXX_COMPILER "@CMAKE_CXX_COMPILER@")
set(CMAKE_CXX_FLAGS "@CMAKE_CXX_FLAGS@")
set(CMAKE_C_COMPILER "@CMAKE_C_COMPILER@")
set(CMAKE_C_FLAGS "@CMAKE_C_FLAGS@")
set(CMPRS_INCLUDE "@CMPRS_INCLUDE@")
set(CMPRS_LIB "@CMPRS_LIB@")
set(COMPILE_DEFINITIONS "@COMPILE_DEFINITIONS@")
set(COMPRESS_LIBS "@COMPRESS_LIBS@")
set(CONNEXT_SRC_C "@CONNEXT_SRC_C@")
set(C_LIBS "-lm  -lpthread")
set(DL_LIBS "-ldl")
set(EUTILS_LIBS "@EUTILS_LIBS@")
set(FASTCGI_INCLUDE "")
set(FASTCGI_LIBS "")
set(FASTCGI_OBJS "")
set(FTDS95_CTLIB_LIBS "")
set(FTDS95_INCLUDE "")
set(FTDS95_LIBS "")
set(FTDS_INCLUDE "")
set(GIF_INCLUDE "")
set(GNUTLS_INCLUDE "")
set(GNUTLS_LIBS "")
set(HAVE_LIBUNWIND "@HAVE_LIBUNWIND@")
set(HAVE_LIBLMDB "@HAVE_LIBLMDB@")
set(IMAGE_LIBS "@IMAGE_LIBS@")
set(JPEG_INCLUDE "")
set(KRB5_INCLUDE "")
set(KRB5_LIBS "")
set(KSTAT_LIBS "")
set(LAPACK_INCLUDE "")
set(LAPACK_LIBS "")
set(LIBS "  -ldl -lm  -lpthread")
set(LIBUNWIND_INCLUDE "")
set(LIBUNWIND_LIBS "")
set(LIBXML_INCLUDE "")
set(LIBXML_LIBS "")
set(LIBXSLT_INCLUDE "")
set(LIBXSLT_LIBS "")
set(LMDB_INCLUDE "-I$(includedir)/util/lmdb -I$(includedir0)/util/lmdb")
set(LMDB_LIBS "-lpthread")
set(LOCAL_LBSM "@LOCAL_LBSM@")
set(LZO_INCLUDE "")
set(LZO_LIB "@LZO_LIB@")
set(LZO_LIBS "")
set(MATH_LIBS "-lm")
set(MYSQL_INCLUDE "")
set(MYSQL_LIBS "")
set(NCBI_CPP_TOOLKIT_VERSION "@NCBI_CPP_TOOLKIT_VERSION@")
set(NCBI_C_INCLUDE "")
set(NCBI_C_LIBPATH "")
set(NCBI_C_ncbi "")
set(NCBI_TOOLS_ROOT "@NCBI_TOOLS_ROOT@")
set(NETWORK_LIBS "  ")
set(NETWORK_PURE_LIBS "  ")
set(OBJMGR_LIBS "@OBJMGR_LIBS@")
set(ODBC_FOUND "@ODBC_FOUND@")
set(ODBC_INCLUDE "-I$(includedir)/dbapi/driver/odbc/unix_odbc -I$(includedir0)/dbapi/driver/odbc/unix_odbc")
set(ODBC_LIBS "")
set(PCRE_INCLUDE "-I$(includedir)/util/regexp -I$(includedir0)/util/regexp")
set(PCRE_LIBS "")
set(PNG_INCLUDE "")
set(PYTHON_FOUND "@PYTHON_FOUND@")
set(PYTHON_INCLUDE "")
set(PYTHON_LIBS "")
set(RPCSVC_LIBS "")
set(RT_LIBS "")
set(RUNPATH_ORIGIN "-Wl,-rpath,'$$ORIGIN'")
set(SAMTOOLS_INCLUDE "@SAMTOOLS_INCLUDE@")
set(SAMTOOLS_LIBS "@SAMTOOLS_LIBS@")
set(SDBAPI_LIB "@SDBAPI_LIB@")
set(SOBJMGR_LIBS "@SOBJMGR_LIBS@")
set(SQLITE3_INCLUDE "")
set(SQLITE3_LIBS "")
set(SRAREAD_LDEP "@SRAREAD_LDEP@")
set(SRA_INCLUDE "@SRA_INCLUDE@")
set(SYBASE_DBLIBS "")
set(SYBASE_DLLS "")
set(SYBASE_INCLUDE "")
set(SYBASE_LIBS "")
set(TIFF_INCLUDE "")
set(WXWIDGETS_INCLUDE "")
set(XCONNEXT "")
set(XPM_INCLUDE "")
set(Z_INCLUDE "-I$(includedir)/util/compress/zlib -I$(includedir0)/util/compress/zlib")
set(Z_LIB "z")
set(Z_LIBS "")
set(wxWidgets_CXX_FLAGS "@wxWidgets_CXX_FLAGS@")
set(wxWidgets_FOUND "@wxWidgets_FOUND@")
set(wxWidgets_LIBRARIES "@wxWidgets_LIBRARIES@")
set(wxWidgets_LIBRARY_DIRS "@wxWidgets_LIBRARY_DIRS@")


##############################################################################
#
# Standard additions that are expected for all projects that import the C++
# toolkit.
#

include_directories(${NCBI_CPP_TOOLKIT_INCLUDE_DIRS} ${NCBI_CPP_TOOLKIT_SITE_INCLUDE_DIRS})
link_directories(${NCBI_CPP_TOOLKIT_LIBRARY_DIRS})

add_definitions(@PACKAGE_COMPILE_DEFINITIONS@)

include("${PACKAGE_PREFIX_DIR}/@PACKAGE_LIBRARY_INSTALL_DIRS@/cmake/ncbi-cpp-toolkit-${NCBI_CPP_TOOLKIT_PACKAGE_VERSION}/ncbi-cpp-toolkit.cmake")

message(STATUS "Found NCBI C++ Toolkit, version ${NCBI_CPP_TOOLKIT_PACKAGE_VERSION}: ${PACKAGE_PREFIX_DIR}")
