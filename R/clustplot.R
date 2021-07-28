
#' Title
#'
#' @param centers
#' @param data
#' @param x_seq
#'
#' @return
#' @export
#'
#' @examples
#'
# library(factoextra)
#Kmeans_dat=kmeans_hist(7,y=wine$quality, x=wine[,1:11], nstart=25)
##
kmeans_hist<-function(centers,x,y, nstart){
  quality_kmeans <- kmeans(x = x , centers = centers, nstart = nstart) #scale(data[,x_seq])
  #fviz_cluster(quality_kmeans,  data = data[,x_seq], geom = "point")
  # analysis on kmeans
  hist(quality_kmeans$cluster)
  # data$lab<-quality_kmeans$cluster
  tmp_df=data.frame(y=y, kmeans_res=quality_kmeans$cluster)
  if (centers<10){
    par(mfrow=c(ifelse(centers<7, 2,3), 3))
  }else{par(mfrow=c(ifelse(centers<13, 3,4), 4))}


  for (k in 1:centers){
    barplot(table(tmp_df[which(tmp_df$kmeans_res==k),"y"]),
            main =as.character(paste(k, "th cluster")),
            xlab = "quality")
  }
  par(mfrow=c(1,1))
  return(quality_kmeans$cluster)
}
