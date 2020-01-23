2+2
3+4


number <-3

number
number*2

number <-5
number*2

another_number <-7

number*another_number

c(2,4,6,8)

times<-c(17,30,25,35,25,30,40,20)

mean(times)

times/60


sqrt(times)
mean(times)
range(times)

times
times>30

times==17
times!=17

which(times>30)
any(times>30)
all(times>30)

help(any)
?any

Help(mean)
?mean

times[times>30]

times[3]

times[!3] --no

times[-3]

times[3:5]

times[c(2,4)]

times[times>30]

times[1]<-47
times

times[times>30] <-c(0,1) 
times

times[times>30]<-NA
times

mean(times)

mean(times,na.rm = TRUE)

#What is the mean of the values that are between 20 and 35??
mean(times[times>20&times<35],na.rm=TRUE)

mean(x=times)
mean(times)
mean(times, na.rm=TRUE)
mean(times, na.rm=TRUE, trim = .2)


mtcars
?mtcars

head(mtcars)
tail(mtcars)
str(mtcars)
names(mtcars)
