#histogram equalization example
set.seed(2020)
image_hist<-floor(rnorm(100, mean=200, sd=5))
length(image_hist)
head(image_hist)
hist(image_hist)

#pmf values
pmf<-table(image_hist)/100

#cdf values
cdf<-cumsum(pmf)

#plot pmf
plot(pmf)
#plot cdf
plot(y=cdf, x=as.numeric(names(cdf)), type='l')

############
# histogram equalized image
############
#y_hist<-floor(255*(cdf[as.character(image_hist)]))
y_hist<-(255*(cdf[as.character(image_hist)]))

#pmf values
pmf_y<-table(y_hist)/100

#cdf values
cdf_y<-cumsum(pmf_y)

#plot pmf
plot(pmf_y)
#plot cdf
plot(y=cdf_y, x=as.numeric(names(cdf_y)), type='l')

#putting it all together
par(mfrow=c(2, 2))
#plot pmf
plot(pmf, main="Original PMF")
#plot cdf
plot(y=cdf, x=as.numeric(names(cdf)), type='l', main="Original CDF")
#plot pmf
plot(pmf_y, main="Equalized PMF")
#plot cdf
plot(y=cdf_y, x=as.numeric(names(cdf_y)), type='l', main="Equalized CDF")

#
