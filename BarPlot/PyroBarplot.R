grap <- apply(read.csv("~/Desktop/hist.csv"), 2, as.numeric, header = F)
rownames(grap) <- c("Pyrosequencing signal","Gomphonema parvulum", "Melosira sp.", "Melosira varians", "Stephanodiscus sp.", "Nitzschia palea")
barplot(grap, width = c(1.5, 0.5), space = c(1,0.3),
        col = c(gray(0), gray(0.4),gray(0.55),gray(0.7),gray(0.85),gray(1)),
        xaxt="n", yaxt="n",
        ylim = c(0,110),
        xlim = c(0,85),
        legend.text = rownames(grap),
        args.legend = list(x = "topright", cex = 0.8),
        xlab = "Dispensation Order",
        ylab = "Peak height-atom contribution",
        cex.lab = 1.4)
i <- 2
at <- c(2.5)
while (i < 26) {
  at[i] <- c(at[i-1] + 3.3)
  i <- i+1
}
lab <- strsplit("AGACTCACAGCGTACTCAGACATAG", "")
lab <- as.character(lab[[1]])
axis(side = 1, at = at, labels = lab, cex.axis = 1.4)
axis(side = 2, at = c(0,20,40,60,80,100), cex.axis = 1.4)