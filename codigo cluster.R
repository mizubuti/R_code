# ======================================
# rotina para analise de cluster
# necessita pacote "amap"
# ======================= E. M. 16/02/09

library(amap)
hc <- hcluster(USArrests, link="ave")
plot(hc)
plot(hc, hang = 1)


