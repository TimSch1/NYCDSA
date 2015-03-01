palindrome = function(){
  m = vector()
  for (i in 999:900){
      for(j in 999:900){
        k = i*j
        l =  as.numeric(paste(laply(strsplit(as.character(k), split=''),rev), collapse=''))
        if(k == l){
          m = c(m,k)
        }
      }
  }
  return(m[1])
}