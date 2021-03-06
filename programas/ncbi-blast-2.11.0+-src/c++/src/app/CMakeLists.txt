#############################################################################
# $Id: CMakeLists.txt 612980 2020-07-30 19:13:50Z ivanov $
#############################################################################

# Include projects from this directory

NCBI_add_subdirectory(
  agp_validate
  agpconvert
  annotwriter
  asn2asn
  asn2fasta
  asn2flat
  asn_cache
  asn_cleanup
  asnval
  bdb_env_keeper
  biosample_chk
  blast
  blastdb
  bsdiff
  compart
  convert_seq
  discrepancy_report
  dustmasker
  flat2asn
  formatguess
  gap_stats
  gi2taxid
  grid
  hfilter
  id1_fetch
  id2_fetch
  idfetch
  idmapper
  igblast
  lds2_indexer
  multireader
  multipattern
  ncbi_encrypt
  netschedule
  netstorage
  nmer_repeats
  nw_aligner
  objextract
  objmgr
  prt2fsm
  read_blast_result
  segmasker
  speedtest
  splign
  srcchk
  ssub_fork
  streamtest
  table2asn
  tableval
  vecscreen
  winmasker
)

if (NCBI_EXPERIMENTAL_CFG)
NCBI_add_subdirectory(
  dblb
  feat_import
  gff_deconcat
  magicblast
  netcache
  pub_report
  rmblastn
#  split_cache
  sub_fuse
  tls
  wgs_parse
  wig2table
  pubseq_gateway
)
endif()

