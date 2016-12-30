# Criar dois data.frames sendo: 1- (dados)- em colunas com o nome dos isolados (ISO), repetição(REP), concentração (CONC), % de inibição(INIB). Para calcular o percentual de inibição (%ini), fazer a média da absorbancia da dose zero(0) e considerá-la 100%.
# data.frame 2- (dadosiso)- duas colunas, sendo uma com o nome do isolado e outra com a repetição.
# mudar o diretorio para a pasta em que estão os seus data.frames.
# O comando a seguir irá criar o objeto "dados" e carregar seu data.frame nele.

dados<-read.table("fena.txt", header=TRUE)
dadosiso<-read.table("dadosiso.txt", header=TRUE)

#nome do conjunto de dados, data.frame 1
dados

#nome do conjunto de dados, data.frame 2                         
dadosiso   

#observar organiza��o dos dados                    
str(dados)  

# designar rep como um fator 
manc$rep<-as.factor(manc$rep)
manc$dos<-as.numeric(manc$dos)
manc$cod<-as.factor(manc$cod)
        
# calcula regressao de cada isolado por repetição          
result<-by(manc,manc$cod:manc$rep,function(x) lm(ini~log10(dos+0.001),dat=x)) 
result

# verificação da saida 1 e 2 somente para confer�ncia dos valores
result[[1]]                   
result[[2]]
result

# "m" será o número de isolados vezes o número de repeticoes (ex: 68 isolados x 5 repetiçõeses= 340; m=340)
m<-340  

     
saida.y<-NULL 

# a partir daqui os valores observados do intercepto (a) e da inclinação(b) serão compilados de 1 até 100.
for (i in 1:m)
{
temp<-result[[i]]
# os objetos criados abaixo não possuem nenhuma função, mas quando inseridos retiram um erro que está implicito nos calculos (encontrar outra maneira)
a<-temp$coefficients[1]
b<-temp$coefficients[2]
a[i]<-temp$coefficients[1]
b[i]<-temp$coefficients[2]
saida.y[i]<- 10^((50-a[i])/b[i])
}
saida.y

# saída y=resultado da DE
resultDE<-saida.y

# mudança do nome 
DE50<-resultDE

# concatenar os resultados da "DE50" com o data.frame 2 (dadosiso)
resultado<-cbind(dadosiso,DE50)
 
#vizualizar resultado final
resultado
