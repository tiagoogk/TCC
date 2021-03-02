#! /bin/bash

# $Id: reconfigure.sh.in 117476 2008-01-16 16:44:07Z ucko $
# Author:  Denis Vakatov, NCBI 
# 
#  Launcher for "scripts/common/impl/reconfigure.sh"

builddir=/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/build
export builddir

exec /home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/scripts/common/impl/reconfigure.sh "$@"
