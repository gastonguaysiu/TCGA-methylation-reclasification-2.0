library(devtools)
library(roxygen2)

create_package(path = "/home/gaston/mun/kirp/kirp_pack/my_test/methml")
# document("/home/gaston/mun/kirp/kirp_pack/my_test/methml")

devtools::install("/home/gaston/mun/kirp/kirp_pack/my_test/methml")
devtools::load_all("/home/gaston/mun/kirp/kirp_pack/my_test/methml")
library(methml)

build("/home/gaston/mun/kirp/kirp_pack/my_test/methml")
check("/home/gaston/mun/kirp/kirp_pack/my_test/methml")
