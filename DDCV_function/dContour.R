#' Plot two drug contour 
#' @param drMatrix input strandard model data
#' @export



dContour <- function (drMatrix,contour.level=(1:9)/10) {
  
  require(gplots)
  drMatrix<-drMatrix[drMatrix[,1]!=0 & drMatrix[,2]!=0,]
  var.name<-names(drMatrix)
  dose1 <- log(drMatrix[,1])
  dose2 <- log(drMatrix[,2])
  fa    <- 1- drMatrix[,3]   ## fration of total cells or viability
    
  ##        The contour plot of raw data.
  temp1 <- sort(unique(dose1))
  temp2 <- sort(unique(dose2))
  obsfa <- matrix(fa, length(temp1),length(temp2), byrow=T)
  filled.contour(temp1,temp2, obsfa, levels=contour.level, xlab=paste0("Log(",var.name[1]," dose)"),ylab=paste0("Log(",var.name[2]," dose)"),col=redgreen(length(contour.level)))
  title("Contour Plots of Raw Data")
  
}