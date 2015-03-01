fibonacci = function(){
  x <- 1:2
while(x[length(x)] < 1000){
  y <- x[length(x)] + x[length(x)-1]
  x <- c(x,y)
  }
return(x[-length(x)])
}