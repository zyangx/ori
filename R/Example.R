library("impute")
library("RColorBrewer")
library("ggpubr")
library("wordcloud")

load("../data/U4529d3_1.rda")
load("../data/U4529d3_2.rda")
load("../data/U4529d3_3.rda")
load("../data/S450.rda")
load("../data/GOstat.rda")
load("../data/testdata2.Rdata")

source("./coorTrans.R")
source("./getDiffDim.R")
source("./plotParaC.R")
source("./plot2Dscatter.R")
source("./plotGOterm.R")

# Get reference matrix
U4529d3.m  <- cbind(cbind(U4529d3_1.m, U4529d3_2.m), U4529d3_3.m)

# get New Dim(coordinates) for the Input data
newCoor.m <- coorTrans(expSel.m)

# get Differential Dims for the input data
DiffDim.o <- getDiffDim(newCoor.m, groups.v)

# plot  parallel coordinate for different samples
pdf("ParaC.pdf", width=10, height=10)
plotParaC(newCoor.m, groups.v)
dev.off()

# plot 2D-scatter for different samples
pdf("Scatter2D.pdf", width=5, height=5)
plot2Dscatter(newCoor.m, groups.v)
dev.off()

# plot wordcloud of GO terms for the specific Dim
pdf("GOterm_Dim1_top20.pdf", width=5, height=5)
plotGOterm(1, 20)
dev.off()

