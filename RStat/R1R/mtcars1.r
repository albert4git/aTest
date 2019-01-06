
#!/usr/bin/env Rscripto
data(mtcars)
df <- mtcars[, c("mpg", "cyl", "wt")]
head(df)

X11 ()
plot(df)
#plot (x,y)
#print(magnit2Plot.jpg)
dev.copy(jpeg,filename="magnit2Plot.jpg");
dev.off ();

ls()

load("magnit2Plot.jpg")
