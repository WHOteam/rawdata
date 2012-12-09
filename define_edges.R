define_edges <- function(){
  
  require(stringr)  
  
  exports_redo <- transform(exports_redo,V1=as.character(exports_redo$V1))
  exports_redo <- transform(exports_redo,V2=as.character(exports_redo$V2))
  obesity <- transform(obesity,Country=as.character(obesity$Country))
  
  country1 <- c()
  c = 1
  country2 <- c()
  obes_diff_exp <- c()
  
  for (i in 1:length(obesity[,1]))
  {
    for (k in 1:length(exports_redo[,1]))
    {
      
      if (exports_redo$V1[k] == obesity$Country[i])
      {
        
        for (j in 1:length(obesity[,1]))
        {
          
          if (!is.na(str_locate(exports_redo$V2[k],obesity$Country[j])[1]))
          {
            country1[c] <- obesity$Country[i]
            country2[c] <- obesity$Country[j]
            obes_diff_exp[c] <- abs(obesity$obrate[i] - obesity$obrate[j])
            c = c+ 1
          }
        }
      }
    }
  }
  
}