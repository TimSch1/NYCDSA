Largest_PF = function(x){
  i <- 2:(x/2)
  n = i[x%%i==0]
  for(j in seq_along(n)){
    g = 2:(n[j]/2)
    h = g[n[j]%%g==0]
    if(length(h)>0){
      n <<- n[-j]
      n <<- c(n, h)
      }
    }
  return(n)
}
    