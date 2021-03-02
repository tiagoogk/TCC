#############################################################################
# $Id: CMakeLists.txt 597226 2019-11-19 02:19:39Z ucko $
#############################################################################


NCBI_add_subdirectory(
  third_party third_party_static
  clog grid_cgi xmlwrapp eutils_client hydra_client discrepancy
  xmlreaders hgvs netstorage jsonwrapp biosample_util data_loaders_util
  lapackwrapp cgi_redirect pmcidconv_client fix_pub
)

