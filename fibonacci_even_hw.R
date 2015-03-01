fibonacci_even_hw = function(){
  x <- 1:2
  while(x[length(x)] < 4000000){
    y <- x[length(x)] + x[length(x)-1]
    x <- c(x,y)
  }
  x = x[-length(x)]
  x = ifelse(x%%2==0, x, 0)
  return(sum(x))
}