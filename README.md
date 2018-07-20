# rpenepma
A package to process output from PENEPMA using R

## How to use

1. Install R for your operating system from
[here](http://cran.revolutionanalytics.com/). **Note**: if you are
running Windows, install the **Rtools** that let you build packages.
You will want the Rtools binaries in your path. On systems where I have
admin rights, I create `C:\\Apps`, make it writable for all users, and
install **R** and **Rtools** in a `C:\\Apps\\R` folder. You want the
Rtools binaries in your path and this keeps the path shorter. If you
do not have admin rights, make an ``Apps`` folder in your home folder
and install there...

2. Install R-Studio from 
[here](https://www.rstudio.com/products/rstudio/download/preview/).
The preview releases are the most up-to-date versions.

3. Install the `devtools` package and the dependencies

```
install.packages("devtools", dependencies=TRUE)
install.packages("ggplot2", dependencies=TRUE)
install.packages("ramify", dependencies=TRUE)
install.packages("scales", dependencies=TRUE)
```

Then you can use the `devtools` package to install `rpenenepma`. 

```
devtools::install_github("jrminter/rpenepma")
```

There are a couple of vignettes that show how to use the package.
You can view them by:

```
browseVignettes(package="rpenepma")
```



