packagesweneed <- c("maptools","dplyr")
for(p in packagesweneed){
  if (!require(p, character.only = TRUE)) install.packages(p)
  library(p, character.only = TRUE)
}
