# *******************************
# script AMOVA using poppr
# *******************************


library(poppr)

estado <- read.table("/home/mizubuti/Google_Drive/publicacoes/marisa/hanna/BeG_por estado.txt", header = TRUE)

estado2 <- read.table("/home/mizubuti/Google_Drive/publicacoes/marisa/hanna/BG_estado_no_header.txt")

estado3 <- read.table("/home/mizubuti/Google_Drive/publicacoes/marisa/hanna/BG_estado_no_header_no_state.txt")

pop1 <- read.table("/home/mizubuti/Google_Drive/publicacoes/marisa/hanna/pop_code.txt")
pop <- pop1[1,172]


df.estado <- data.frame(estado)
by_estado <- df2genind(df.estado, pop = 'pop', ploidy=1, type = 'PA')
by_estado

df.estado2 <- data.frame(estado2)
by_estado2 <- df2genind(df.estado2, ploidy=1, type = 'PA')
by_estado2

df.estado3 <- data.frame(estado3)
by_estado3 <- df2genind(df.estado3, ploidy=1, type = 'PA', pop = pop)
by_estado3


strata(by_estado3) <- data.frame(other(by_estado3)$pop)
by_estado <- as.genclone(by_estado3)

