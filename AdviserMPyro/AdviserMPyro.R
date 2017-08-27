library(AdvISERMPYRO)
c8 <- apply(read.csv("~/Desktop/c8.csv"), 2, as.numeric)
c9 <- apply(read.csv("~/Desktop/c9.csv"), 2, as.numeric)
c10 <- apply(read.csv("~/Desktop/c10.csv"), 2, as.numeric)
c11 <- apply(read.csv("~/Desktop/c11.csv"), 2, as.numeric)
c12 <- apply(read.csv("~/Desktop/c12.csv"), 2, as.numeric)
d1 <- apply(read.csv("~/Desktop/d1.csv"), 2, as.numeric)
dictionary <- read.csv("~/Desktop/dictionary_all.csv")
AdvISERMPYRO(signaltest=c8,dictionary=dictionary,L1=0.05,SCT=1)

pyrogen <- read.csv("~/Desktop/Diatom_1413_UNS.csv", header = TRUE)
UNS <- data.frame(nrow = 25)
UNS <- cbind(t(t(pyrogenerator(pyrogen[,1], "AGACTCACAGCGTACTCAGACATAG"))))
for (i in 2:1413) {
  UNS <- cbind(UNS, t(t(pyrogenerator(pyrogen[,i], "AGACTCACAGCGTACTCAGACATAG"))))
}

for (j in 1:1413) {
  if (UNS[2,j]==2) {
    UNS[,j] <- UNS[,j]/2
  }
}
UNS <- as.data.frame(UNS)
colnames(UNS) <- colnames(pyrogen)

sigtes <- apply(read.csv("~/Desktop/signaltest_mix.csv"), 2, as.numeric)
AdvISERMPYRO(signaltest=sigtes[,1],dictionary=UNS,L1=0.05,L2 = 0.05, SCT=1.5)
