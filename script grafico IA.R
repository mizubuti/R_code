x<-read.table("IA.txt", header=TRUE)
str(x)
x1<-as.matrix(x) 
jpeg("IA.jpg")                             
opar=par(ps=18)
hist(x1, main=" ", xlab=expression(I[A]), ylab="Frequência", col="darkblue",45)
opar
dev.off()

y<-read.table("rd.txt", header=TRUE)
str(y)
y1<-as.matrix(y) 
jpeg("rD.jpg")                             
opar=par(ps=18)
hist(y1, main=" ", xlab=expression(r[D]), ylab="Frequência", col="darkblue",45)
opar
dev.off()
