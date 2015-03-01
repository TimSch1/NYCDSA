sum1000= function(){
  n = 1:999
  n=ifelse (n %% 3 == 0 | n %% 5 == 0, n, 0)
  return(sum(n))
}