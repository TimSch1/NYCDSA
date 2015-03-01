url = 'http://www.biostatisticien.eu/springeR/snee74en.txt'
snee = read.table(url,head=T,sep=' ')
table(snee$hair, snee$eyes, snee$gender)
g = ggplot(snee, aes(hair, fill=gender, group=gender))+geom_bar(position = position_dodge())
g = ggplot(snee, aes(eyes, fill=gender, group=gender))+geom_bar(position = position_dodge())
cont.table = table(snee$hair, snee$eyes)
expectedFreq = t(rowSums(cont.table)) %o% colSums(cont.table)/(sum(colSums(cont.table)+rowSums(cont.table)))
expectedFreq = aperm(expectedFreq, c(3,2,1)); dim(expectedFreq) = c(4,4)
sq.diff = (cont.table - expectedFreq)^2/expectedFreq
chisq.test(cont.table)
mosaicplot(cont.table, shade=T) #visualize table cells
#distributions not independant
