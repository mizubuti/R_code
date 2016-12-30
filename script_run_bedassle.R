# ****************************
# teste BEDASSLE
# *********************

library(BEDASSLE)

setwd("~/mizubuti@gmail.com/fip-680/landscape_genetics")
setwd("~/Google_Drive/fip-680/landscape_genetics")

# in this example there are 3 populations and 5 loci
# for the pairwise ecological distance I used the binary assuming that
# samples 1 and 2 are in the same region and sample 3 is in a different
# than samples 1 and 2. example 1 and 2 come from the Amazon and 3 from MG
# the ecological distance matrix was constructed using the following coding
# system: Are samples 1 and 1; 1 and 2; and 1 and 3 from the same region? 
# the answer is Yes, Yes, No, respectively. if I code Yes = 1, and No = 0
# then the first line of the matrix was 1 1 and 0. the matrix will look like
#       1 1 0
#       1 1 0
#       0 0 1


allele.counts <- read.table("~/mizubuti@gmail.com/fip-680/landscape_genetics/teste_allele_counts.txt", header = TRUE, row.names = 1)
sample.sizes <- read.table("~/mizubuti@gmail.com/fip-680/landscape_genetics/sample_sizes.txt", header = TRUE, row.names = 1)

allele.counts <- read.table("/home/mizubuti/Google_Drive/fip-680/landscape_genetics/teste_allele_counts.txt", header = TRUE, row.names = 1)
sample.sizes <- read.table("/home/mizubuti/Google_Drive/fip-680/landscape_genetics/sample_sizes.txt", header = TRUE, row.names = 1)

# need to convert the data frames into matrices

allele.counts <- as.matrix(allele.counts)
sample.sizes <- as.matrix(sample.sizes)

# geographic distance matrix

Dist <- read.table("~/mizubuti@gmail.com/fip-680/landscape_genetics/teste_geo_dist.txt", header = TRUE, row.names = 1)
Dist <- read.table("/home/mizubuti/Google_Drive/fip-680/landscape_genetics/teste_geo_dist.txt", header = TRUE, row.names = 1)

Dist <- as.matrix(Dist)

# ecological distance matrix

Eco <- read.table("~/mizubuti@gmail.com/fip-680/landscape_genetics/teste_eco_dist.txt", header = TRUE, row.names = 1)
Eco <- read.table("/home/mizubuti/Google_Drive/fip-680/landscape_genetics/teste_eco_dist.txt", header = TRUE, row.names = 1)

Eco <- as.matrix(Eco)

# all pairwise Fst

all_pairwise_Fst <- calculate.all.pairwise.Fst(allele.counts, sample.sizes)

all_pairwise_Fst

# to calculate Fst between any two samples, you need to construct as many 2 x n
# where n is the number of loci that were genotyped; and another matrix 2 x n 
# that contains the sample sizes

# the MCMC sampler
MCMC(
  counts = allele.counts,
  sample_sizes = sample.sizes, 
  D = Dist, 
  E = Eco, 
  k = 3, 
  loci = 5, 
  delta = 0.5,
  aD_stp = 0.002,
  aE_stp = 0.05,
  a2_stp = 0.005,
  thetas_stp = 0.1,
  mu_stp = 0.2,
  ngen = 100,
  printfreq = 2,
  savefreq = 100,
  samplefreq = 5,
  directory = NULL,
  prefix = "",
  continue = FALSE,
  continuing.params = NULL
)

data.output1 <- load('/home/eduardo/mizubuti@gmail.com/fip-680/landscape_genetics/teste_MCMC_output1.Robj')
data.output1 <- load('teste_MCMC_output1.Robj')

plot_all_acceptance_rates("data.output1")


