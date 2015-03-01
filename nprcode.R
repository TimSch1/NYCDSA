################Scrape URL Links##################
library(RCurl)
library(XML)
url = 'http://www.nyc.gov/html/dof/html/property/421a.shtml'
raw = getURL(url)
data = htmlParse(raw)
links = getHTMLLinks(data)
xls = links[grep('421a.xls$', links)]
begin = 'http://www.nyc.gov/html/dof/'
xls = gsub('../../', begin, xls)

######################Download files########################
library(stringr)
names = strsplit(xls, '[[:punct:]]')
names = unlist(lapply(names, function(x) x[12]))  
filenames = paste0(names, '.xls')

for(i in 1:length(xls)) download.file(xls[i], filenames[i], mode = 'wb')

##############Create Dataframe of all files#################
library(xlsx)
library(plyr)
library(dplyr)
all = lapply(filenames, function(x) read.xlsx2(x, 1, startRow=5, colClasses='character'))
all2 = do.call(rbind, all)
all2$BOROUGH = rep(names, times = lapply(all, nrow))
all2$ADDRESS = paste(all2$ADDRESS, all2$BOROUGH, ', NY ', all2$ZIP.CODE, sep="")
all2$ADDRESS = gsub('[[:blank:]]{2,}', ', ', all2$ADDRESS)
all2_u = ddply(all2, .(ADDRESS), count)

################GeoCode and Map##############################
library(ggmap)
library(taRifx.geo)
options(BingMapsKey = 'AnwTaYFENs1VgVhpJcIEASzqo3cC4JlqPHO2o20RSqMqMV78aBmDIWSB0nSQ8sIW')
coords = geocode(all2_u$ADDRESS, service='bing')
all2_u = cbind(all2_u, coords)