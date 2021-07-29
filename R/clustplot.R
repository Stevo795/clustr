
# library(factoextra)
#Kmeans_dat=kmeans_hist(7,y=wine$quality, x=wine[,1:11], nstart=25)
##
#' Title
#'
#' @param centers Number of clustering centers
#' @param x  The dataframe excludes the label vector
#' @param y A vector of labels
#' @param nstart
#'
#' @return kmeans result
#' @export
#'
#' @examples no example
kmeans_hist<-function(centers,x,y, nstart){
  quality_kmeans <- kmeans(x = x , centers = centers, nstart = nstart) #scale(data[,x_seq])
  #fviz_cluster(quality_kmeans,  data = data[,x_seq], geom = "point")
  # analysis on kmeans
  # data$lab<-quality_kmeans$cluster
  tmp_df=data.frame(y=y, kmeans_res=quality_kmeans$cluster)
  if (centers<10){
    par(mfrow=c(ifelse(centers<7, 2,3), 3))
  } else if (centers<=16){par(mfrow=c(ifelse(centers<=12, 3,4), 4))
  } else if (centers<=20) {par(mfrow=c(4,5))}


  for (k in 1:centers){
    barplot(table(tmp_df[which(tmp_df$kmeans_res==k),"y"]),
            main =as.character(paste(k, "th cluster")),
            xlab = "quality")
  }
  par(mfrow=c(1,1))
  return(invisible(quality_kmeans$cluster))
}
