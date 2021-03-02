/* Hey, Emacs, treat this as -*- C -*- ! */
/*  $Id: ncbicfg.c.in 345406 2011-11-25 18:29:11Z ivanovp $
 * ===========================================================================
 *
 *                            PUBLIC DOMAIN NOTICE
 *               National Center for Biotechnology Information
 *
 *  This software/database is a "United States Government Work" under the
 *  terms of the United States Copyright Act.  It was written as part of
 *  the author's official duties as a United States Government employee and
 *  thus cannot be copyrighted.  This software/database is freely available
 *  to the public for use. The National Library of Medicine and the U.S.
 *  Government have not placed any restriction on its use or reproduction.
 *
 *  Although all reasonable efforts have been taken to ensure the accuracy
 *  and reliability of the software and data, the NLM and the U.S.
 *  Government do not and cannot warrant the performance or results that
 *  may be obtained by using this software or data. The NLM and the U.S.
 *  Government disclaim all warranties, express or implied, including
 *  warranties of performance, merchantability or fitness for any particular
 *  purpose.
 *
 *  Please cite the author in any work or product based on this material.
 * 
 * ===========================================================================
 *
 * Author:  Aaron Ucko
 *
 * File Description:
 *   Access to miscellaneous global configuration settings
 *
 */

#include <corelib/ncbicfg.h>
#include <stdlib.h>

#ifdef NCBI_OS_UNIX
#  include <unistd.h>
#endif

/*

 On UNIX the value of s_DefaultRunpath[] will be replaced at configure step
 with runpath specified to configure.

 On MS Windows you can set up a base directory for runpath using
 environtment variable NCBI_INSTALL_PATH before building CONFIGURE
 project in MSVC 7.* build tree. If this env.variable is not defined,
 that current build path will be used as runpath.

*/

static const char s_DefaultRunpath[] = "/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/lib";
static const char *s_Runpath         = s_DefaultRunpath;

static const char s_DefaultSybaseLocalPath[] = "";
static const char s_DefaultSybaseNetPath[]   = "No_Sybase";
static const char *s_DefaultSybasePath       = 0;
static const char *s_SybasePath              = 0;

static const char s_BuildFeatures[] = "-AIX algo -APACHE_ARROW app -AppleClang -AVRO -AWS_SDK -BACKWARD_CPP -bdb -BerkeleyDB -Boost.Chrono -Boost.Filesystem -Boost.Iostreams -Boost.Program-Options -Boost.Regex -Boost.Serialization -Boost.Spirit -Boost.System -Boost.Test -Boost.Test.Included -Boost.Thread -BSD BZ2 -CASSANDRA -Cereal cgi -ChaosMonkey -check -Clang -CompaqCompiler -connext -CPPKAFKA -Cray -C-Toolkit -ctools -CURL -Cygwin -CygwinMT -Darwin dbapi -DBLib DLL -DLL_BUILD -EXPAT -Fast-CGI -FreeTDS -FreeType -FTGL -FUSE -gbench GCC -GCRYPT -GIF -GL2PS -GLEW -GLUT -GMOCK -GMP -GNUTLS -GRPC -GSOAP -gui -H2O -HDF5 -HIREDIS -ICC Iconv -ICU -INFLUXDB -in-house-resources -Int8GI -IRIX -JDK -JPEG -KCC -KRB5 -LAPACK -LEVELDB LFS -LIBDW -LIBEXSLT -LIBRDKAFKA -LIBSSH2 -LIBUNWIND -LIBUV -LIBXLSXWRITER -LIBXML -LIBXSLT -LimitedLinker Linux -LLVMClang LMDB LocalBZ2 -local_lbsm LocalLMDB -LocalMSGMAIL2 -LocalNCBILS LocalPCRE -LocalSSS LocalZ -LZO -MacOS -MAGIC -MaxDebug MBEDTLS -MESA -MIMETIC -MIPSpro -MONGODB -MONGODB3 -MSGSL -MSVC -MSWin MT -MUPARSER -MySQL -ncbi_crypt -Ncbi-JNI -NCBILS2 -NETTLE -NGHTTP2 -NGS objects -ODBC -OECHEM -OpenGL -OPENSSL -ORBacus -OSF PCRE -PERL -PNG -PROTOBUF PSGLoader -PubSeqOS -PYTHON -PYTHON25 -PYTHON26 -PYTHON27 -PYTHON3 -SABLOT -SASL2 serial -SGE -Solaris -SP -SQLITE3 -SQLITE3ASYNC -SSSDB -SSSUTILS -StrictGI -Sybase -TIFF -UNGIF unix -UUID -Valgrind -VDB -VisualAge WinMain -WorkShop -wx2.8 -wxWidgets -Xalan -XCODE -Xerces -XPM Z -Zorba -ZSTD";

const char* NCBI_GetDefaultRunpath(void)
{
    return s_DefaultRunpath;
}


const char* NCBI_GetRunpath(void)
{
    return s_Runpath;
}


void NCBI_SetRunpath(const char* runpath)
{
    s_Runpath = runpath;
}


const char* NCBI_GetDefaultSybasePath(void)
{
    if ( !s_DefaultSybasePath ) {
#ifdef NCBI_OS_UNIX
        if (sizeof(s_DefaultSybaseLocalPath) > 1
            &&  access(s_DefaultSybaseLocalPath, R_OK | X_OK) >= 0) {
            s_DefaultSybasePath = s_DefaultSybaseLocalPath;
        } else {
            s_DefaultSybasePath = s_DefaultSybaseNetPath;
        }
#else
        s_DefaultSybasePath = s_DefaultSybaseNetPath;
#endif
    }
    return s_DefaultSybasePath;
}


const char* NCBI_GetSybasePath(void)
{
    if ( !s_SybasePath ) {
        s_SybasePath = NCBI_GetDefaultSybasePath();
    }
    return s_SybasePath;
}


void NCBI_SetSybasePath(const char* sybpath)
{
    s_SybasePath = sybpath;
}


const char* NCBI_GetBuildFeatures(void)
{
    return s_BuildFeatures;
}

double NCBI_GetCheckTimeoutMult(void)
{
    static double check_mult = 0;

    if (check_mult == 0) {
        double env_val = 0;
        const char* env_str = getenv("NCBI_CHECK_TIMEOUT_MULT");
        if (env_str)
            env_val = strtod(env_str, NULL);
        if (env_val <= 0)
            env_val = 1;

        check_mult = env_val;
    }

    return check_mult;
}
