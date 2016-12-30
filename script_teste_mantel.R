# ###########################################################
# script para realizar teste de Mantel 
# ############################################# E.M. 07/09/09

# -->  necessita do pacote "ade4"
# 
# dois arquivos de dados devem ser preparados: 1. padrao de bandas (0 ou 1) de cada isolado em uma linha; 
# 2. arquivo com as coordenadas geograficas de cada isolado em DECIMAIS (nao em graus minutos segundos)
# para converter de graus para decimais, use o site: http://www.fcc.gov/mb/audio/bickel/DDDMMSS-decimal.html
# o arquivo 1 devera' conter apenas 0 e 1's, separados por um espaco em branco
# o arquivo 2 deverá conter, para cada isolado, os dados de latitude e longitude
# exemplo: 5 isolados, cada um com 5 marcas (locos) -- os arquivos serao:
# arquivo binario: haplotipos.txt		arquivo distancia: coordenadas.txt
# 1 1 1 0 1						34.13583 -117.9236
# 1 1 0 0 1						33.82361 -118.1875
# 1 1 0 0 1						34.17611 -118.3153
# 0 1 0 1 0						34.19944 -118.5347
# 1 0 1 1 0						34.06694 -117.7514


library(ade4)

haplotipos <- read.table("/home/eduardo/arquivos/R_code/haplotipos.txt")
coordenadas <- read.table("/home/eduardo/arquivos/R_code/coordenadas.txt")

# geracao da matrix de "distancia genetica"
# para escolher qual coeficiente usar, basta informar o metodo que deseja. Vide manual do ade4
# no caso de Jaccard, method = 1; simple match, method = 2 e Dice ou Sorensen, method = 5
# no exemplo abaixo, sera' usado Jaccard, portanto voce devera' digitar 1, quando o programa apresentar a mensagem "Select an integer (1-10):"

dist_genet <- dist.binary(haplotipos, method = NULL, diag = FALSE, upper= FALSE)

# geracao da matrix de distancia geografica

dist_geogr <- dist(coordenadas)

# teste de Mantel com 1000 permutacoes

mantel.rtest(dist_genet, dist_geogr, nrepet = 1000)













