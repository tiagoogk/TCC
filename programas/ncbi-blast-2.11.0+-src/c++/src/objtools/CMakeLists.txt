#############################################################################
# $Id: CMakeLists.txt 612973 2020-07-30 19:13:00Z ivanov $
#############################################################################

NCBI_add_subdirectory(
  unit_test_util readers blast lds2 data_loaders simple
  alnmgr cddalignview test manip cleanup format edit validator
  asniotest align seqmasks_io eutils
  align_format snputil uudutil variation writers pubseq_gateway
  logging import flatfile
)
