x = round(rlnorm(1000, meanlog=1, sdlog=0.5)) #simulate rides completed
x1 = round(rlnorm(1000, meanlog=1.5, sdlog=0.5)) #simulate rides rejected
df1 = as.data.frame(table(x)) #get counts
df2 = as.data.frame(table(x1))
df = merge(df1, df2, by.x='x', by.y='x1', all=T)
mod.x = lm(log(Freq.x)~x, data=df) #estimates of decay constant
mod.x1 = lm(log(Freq.y)~x, data=df)
mod2.x = nls(Freq.x ~ A*exp(b*x), data = df, start = list(A = 50, b=mod.x$coef[2])) #fit decay models
mod2.x1 = nls(Freq.y ~ A*exp(b*x), data = df, start = list(A = 50, b=mod.x1$coef[2]))
library(reshape2) #plot it out
df_m = melt(df, id='x')
ggplot(df_m, (aes(x = x, y=value, fill=variable, group=variable)))+
  geom_bar(stat='identity', position=position_dodge())+
  geom_line(aes(x=df_m$x, y=predict(mod2.x, newdata = data.frame(x=df_m$x))), color='red')+
  geom_line(aes(x=df_m$x, y=predict(mod2.x1, newdata = data.frame(x=df_m$x))), color='blue')
  
