# Classical MDS
# N rows (objects) x p columns (variables)
# each row identified by a unique row name
mydata <- read.csv("~/Desktop/For_MDS.csv", header = F)
rownames(mydata) <- c("DR1","DR2","DR3","DML","DAP","TR1","TR2","TR3","TML","TAP")
d <- dist(mydata)# euclidean distances between the rows
fit <- cmdscale(d,eig=TRUE, k=2)# k is the number of dim
fit # view results

# plot solution 
x <- fit$points[,1]
y <- fit$points[,2]
par(pin = c(5,6), mai = c(1.2,1.2,1,.2), lwd = 3, cex = 1.5)
plot(x[1:5], y[1:5],
     xlab = "Coordinate 1", ylab = "Coordinate 2",
     xlim = c(-1,2),
     ylim = c(-0.5,0.8),
     pch=21)
lines(x[6:10], y[6:10], type = "p", pch = 4)
abline(h = 0, v = 0, lty = 2)
text(x[1:5], y[1:5], labels = row.names(mydata[1:5,]), pos=3)
text(x[6:10], y[6:10], labels = row.names(mydata[6:10,]), pos=1)
legend("topright", title = "Data Type", legend = c("Dictionary", "Test Samples"),
       pch = c(21,4))
#----------------------------------------------------------------------------------

# Nonmetric MDS
# N rows (objects) x p columns (variables)
# each row identified by a unique row name

library(MASS)
mydata <- read.csv("~/Desktop/For_MDS.csv", header = F)
rownames(mydata) <- c("DR1","DR2","DR3","DML","DAP","TR1","TR2","TR3","TML","TAP")
d <- dist(mydata) # euclidean distances between the rows
fit <- isoMDS(d, k=2) # k is the number of dim
fit # view results

# plot solution 
x <- fit$points[,1]
y <- fit$points[,2]
plot(x[1:5], y[1:5],
     main="nonMetric MDS", xlab = "Coordinate 1", ylab = "Coordinate 2",
     xlim = c(-2,3),
     ylim = c(-0.6,0.6),
     pch=21)
lines(x[6:10], y[6:10], type = "p", pch = 4)
abline(h = 0, v = 0, lty = 2)
text(x[1:5], y[1:5], labels = row.names(mydata[1:5,]), cex=.7, pos=3)
text(x[6:10], y[6:10], labels = row.names(mydata[6:10,]), cex=.7, pos=1)
legend("topright", title = "Data Type", legend = c("Dictionary", "Test Samples"),
       pch = c(21,4))

