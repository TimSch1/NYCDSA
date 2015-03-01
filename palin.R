palin = function(){
  a = 900:999
  a = sapply(a,'*',a)
  b = sapply(as.character(a), strsplit, "")
  b = lapply(b, rev)
  b = laply(b, paste, sep="", collapse="")
  c = a[a==b]
  return(c)
}

