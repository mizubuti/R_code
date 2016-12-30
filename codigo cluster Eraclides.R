# ======================================
# rotina para analise de cluster
# necessita pacote "amap"
# ======================= E. M. 16/02/09

library(amap)
setwd("/home/eduardo/Desktop")
microsat1 <- read.table("1GENOTYPESMGSPBA.txt", header=TRUE)
microsat1
hc <- hcluster(microsat1, link="ave")
jpeg("cluster_microsat.jpg", width = 800, height = 600)
plot(hc, hang = -1)
dev.off()


