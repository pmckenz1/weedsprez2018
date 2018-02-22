## pairwise aligning

fullseq <- "The cat was red"
fragment <- "Tcased"

across <- strsplit(fullseq,"")[[1]]
down <- strsplit(fragment,"")[[1]]


alignmat <- matrix(nrow = (length(down)+1),ncol=(length(across)+1))
alignmat[1,] <- seq(0,length(across))
alignmat[,1] <- seq(0,length(down))
colnames(alignmat) <- c("_",across)
rownames(alignmat) <- c("_",down)

addval <- function(rownum,colnum,mat,across,down) {
  valnorth <- mat[(rownum-1),colnum]
  valwest <- mat[rownum,(colnum-1)]
  valNW <- mat[(rownum-1),(colnum-1)]
  values <- c(valnorth+1, valwest +1, if (across[(colnum-1)] != down[(rownum-1)]) {valNW + 1} else {valNW})
  return(min(values))
}

for (row in 2:nrow(alignmat)) {
  for (col in 2:ncol(alignmat)) {
    alignmat[row,col] <- addval(row,col,alignmat,across,down)
  }
}
#alignmat<- alignmat[-1,-1]

#raster::image(x = raster(alignmat),maxpixels = 100000)

currtree <- integer()
currentidx <- c(nrow(alignmat),ncol(alignmat))

while (!identical(currentidx, c(1,1))) {
  Nval <- if (currentidx[1] > 1) {alignmat[currentidx[1]-1,currentidx[2]]} else {NA}
  Wval <- if (currentidx[2] > 1) {alignmat[currentidx[1],currentidx[2]-1]} else {NA}
  NWval <- if (currentidx[1] > 1 && currentidx[2] > 1) {alignmat[currentidx[1]-1,currentidx[2]-1]} else {NA}
  
  dirvals <- c(Nval,Wval,NWval)
  mvmt <- which(dirvals == min(dirvals,na.rm = T)) # 1 is up, 2 is left, 3 is diag
  
  if (length(mvmt) == 1) {
    currtree<- c(currtree,mvmt)
  } else {currtree <- c(currtree,sample(mvmt,1))}
  
  if (tail(currtree,n=1) == 1) {
    currentidx <- currentidx - c(1,0)
  } else if (tail(currtree,n=1) == 2) {
    currentidx <- currentidx - c(0,1)
  } else if (tail(currtree,n=1) == 3) {
    currentidx <- currentidx - c(1,1)
  }
  currentidx
}
currtree

#when 1, adds row letter and col _, when 2, adds col letter and row _, when three adds both letters
revdown<- rev(down)
revacr <- rev(across)
acrossalign <- integer()
downalign <- integer()
for (step in currtree) {
  if (step == 1) {
    acrossalign <- c(acrossalign,"_")
    downalign <- c(downalign,revdown[1])
    revdown <- revdown[-1]
  } else if (step == 2) {
    acrossalign <- c(acrossalign,revacr[1])
    downalign <- c(downalign,"_")
    revacr <- revacr[-1]
  } else if (step == 3) {
    acrossalign <- c(acrossalign,revacr[1])
    downalign <- c(downalign,revdown[1])
    revacr<- revacr[-1]
    revdown <- revdown[-1]
  }
}
downalign <- rev(downalign)
acrossalign<- rev(acrossalign)

cat(downalign)
cat(acrossalign)
