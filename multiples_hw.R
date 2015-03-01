multiples = function(){
  v = 1:999
  v = ifelse(v%%3==0|v%%5==0,v,0)
  return(sum(v))
}