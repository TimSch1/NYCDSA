pi.fxn = function(num){
df = data.frame(x = runif(num), y = runif(num))
df = df %>% mutate(dist = sqrt((x-0.5)^2+(y-0.5)^2))
return(4*nrow(df[df$dist <=0.5,])/num)
}

mean(replicate(1000, pi.fxn(1000)))