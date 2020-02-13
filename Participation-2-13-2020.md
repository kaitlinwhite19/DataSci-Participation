---
title: 's05: Some More `dplyr` Exercise'
author: "Kaitlin White"
date: "2/13/2020"
output:
  html_document:
    keep_md: true
    theme: paper
---

# Participation 2-13-2020


## Setting Up

### Error Allowance

<!---The following chunk allows errors when knitting--->


### Reminders
**When you make an Rmd file for participation or homework, be sure to do this**:

1. Change the file output to both html and md _documents_ (not notebook).
  - See the `keep_md: TRUE` argument above.

2. `knit` the document. 

3. Stage and commit the Rmd and knitted documents.

### Packages

```r
library(tidyverse)
library(gapminder)
# install.packages("tibble")
```
    

## Worksheet

### 1.

`select()`, `rename()`, `filter()`, `mutate()`, and a little plotting

Let's use the `mtcars` dataset. Complete the following tasks. Chain together
all of the commands in a task using the pipe `%>%`. Show the miles per gallon and horsepower for cars with 6 cylinders. Also convert the data frame to a tibble (keep the rownames and store them in the tibble with a descriptive variable name). Store this result as a new object with a descriptive object name.


```r
mtcars
```

```
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```


```r
mtcars_2 <- mtcars %>%
  as_tibble(rownames = "model") %>%
  filter(cyl == 6) %>%
  select(model, hp, mpg) %>% 
  rename("Model"="model","Horsepower"="hp", "MPG"="mpg") %>%
  print()
```

```
## # A tibble: 7 x 3
##   Model          Horsepower   MPG
##   <chr>               <dbl> <dbl>
## 1 Mazda RX4             110  21  
## 2 Mazda RX4 Wag         110  21  
## 3 Hornet 4 Drive        110  21.4
## 4 Valiant               105  18.1
## 5 Merc 280              123  19.2
## 6 Merc 280C             123  17.8
## 7 Ferrari Dino          175  19.7
```

### 2. 

Print the results from Task 1 in an appealing way by using `knitr::kable()`.


```r
knitr::kable(mtcars_2)
```



Model             Horsepower    MPG
---------------  -----------  -----
Mazda RX4                110   21.0
Mazda RX4 Wag            110   21.0
Hornet 4 Drive           110   21.4
Valiant                  105   18.1
Merc 280                 123   19.2
Merc 280C                123   17.8
Ferrari Dino             175   19.7

Let's use the `iris` dataset. Complete the following tasks. Chain together all of the commands in a task using the pipe `%>%`.


```r
iris
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```


### 3.

Rename the variables to be all lowercase and to separate words with "_" instead of ".". Put the species name variable first. Store this result as a new object.


```r
iris_tidy <- iris %>%
  select("species"="Species",
         "sepal_length"="Sepal.Length", 
         "sepal_width"="Sepal.Width",
         "petal_length"="Petal.Length",
         "petal_width"="Petal.Width") %>%
  print()
```

```
##        species sepal_length sepal_width petal_length petal_width
## 1       setosa          5.1         3.5          1.4         0.2
## 2       setosa          4.9         3.0          1.4         0.2
## 3       setosa          4.7         3.2          1.3         0.2
## 4       setosa          4.6         3.1          1.5         0.2
## 5       setosa          5.0         3.6          1.4         0.2
## 6       setosa          5.4         3.9          1.7         0.4
## 7       setosa          4.6         3.4          1.4         0.3
## 8       setosa          5.0         3.4          1.5         0.2
## 9       setosa          4.4         2.9          1.4         0.2
## 10      setosa          4.9         3.1          1.5         0.1
## 11      setosa          5.4         3.7          1.5         0.2
## 12      setosa          4.8         3.4          1.6         0.2
## 13      setosa          4.8         3.0          1.4         0.1
## 14      setosa          4.3         3.0          1.1         0.1
## 15      setosa          5.8         4.0          1.2         0.2
## 16      setosa          5.7         4.4          1.5         0.4
## 17      setosa          5.4         3.9          1.3         0.4
## 18      setosa          5.1         3.5          1.4         0.3
## 19      setosa          5.7         3.8          1.7         0.3
## 20      setosa          5.1         3.8          1.5         0.3
## 21      setosa          5.4         3.4          1.7         0.2
## 22      setosa          5.1         3.7          1.5         0.4
## 23      setosa          4.6         3.6          1.0         0.2
## 24      setosa          5.1         3.3          1.7         0.5
## 25      setosa          4.8         3.4          1.9         0.2
## 26      setosa          5.0         3.0          1.6         0.2
## 27      setosa          5.0         3.4          1.6         0.4
## 28      setosa          5.2         3.5          1.5         0.2
## 29      setosa          5.2         3.4          1.4         0.2
## 30      setosa          4.7         3.2          1.6         0.2
## 31      setosa          4.8         3.1          1.6         0.2
## 32      setosa          5.4         3.4          1.5         0.4
## 33      setosa          5.2         4.1          1.5         0.1
## 34      setosa          5.5         4.2          1.4         0.2
## 35      setosa          4.9         3.1          1.5         0.2
## 36      setosa          5.0         3.2          1.2         0.2
## 37      setosa          5.5         3.5          1.3         0.2
## 38      setosa          4.9         3.6          1.4         0.1
## 39      setosa          4.4         3.0          1.3         0.2
## 40      setosa          5.1         3.4          1.5         0.2
## 41      setosa          5.0         3.5          1.3         0.3
## 42      setosa          4.5         2.3          1.3         0.3
## 43      setosa          4.4         3.2          1.3         0.2
## 44      setosa          5.0         3.5          1.6         0.6
## 45      setosa          5.1         3.8          1.9         0.4
## 46      setosa          4.8         3.0          1.4         0.3
## 47      setosa          5.1         3.8          1.6         0.2
## 48      setosa          4.6         3.2          1.4         0.2
## 49      setosa          5.3         3.7          1.5         0.2
## 50      setosa          5.0         3.3          1.4         0.2
## 51  versicolor          7.0         3.2          4.7         1.4
## 52  versicolor          6.4         3.2          4.5         1.5
## 53  versicolor          6.9         3.1          4.9         1.5
## 54  versicolor          5.5         2.3          4.0         1.3
## 55  versicolor          6.5         2.8          4.6         1.5
## 56  versicolor          5.7         2.8          4.5         1.3
## 57  versicolor          6.3         3.3          4.7         1.6
## 58  versicolor          4.9         2.4          3.3         1.0
## 59  versicolor          6.6         2.9          4.6         1.3
## 60  versicolor          5.2         2.7          3.9         1.4
## 61  versicolor          5.0         2.0          3.5         1.0
## 62  versicolor          5.9         3.0          4.2         1.5
## 63  versicolor          6.0         2.2          4.0         1.0
## 64  versicolor          6.1         2.9          4.7         1.4
## 65  versicolor          5.6         2.9          3.6         1.3
## 66  versicolor          6.7         3.1          4.4         1.4
## 67  versicolor          5.6         3.0          4.5         1.5
## 68  versicolor          5.8         2.7          4.1         1.0
## 69  versicolor          6.2         2.2          4.5         1.5
## 70  versicolor          5.6         2.5          3.9         1.1
## 71  versicolor          5.9         3.2          4.8         1.8
## 72  versicolor          6.1         2.8          4.0         1.3
## 73  versicolor          6.3         2.5          4.9         1.5
## 74  versicolor          6.1         2.8          4.7         1.2
## 75  versicolor          6.4         2.9          4.3         1.3
## 76  versicolor          6.6         3.0          4.4         1.4
## 77  versicolor          6.8         2.8          4.8         1.4
## 78  versicolor          6.7         3.0          5.0         1.7
## 79  versicolor          6.0         2.9          4.5         1.5
## 80  versicolor          5.7         2.6          3.5         1.0
## 81  versicolor          5.5         2.4          3.8         1.1
## 82  versicolor          5.5         2.4          3.7         1.0
## 83  versicolor          5.8         2.7          3.9         1.2
## 84  versicolor          6.0         2.7          5.1         1.6
## 85  versicolor          5.4         3.0          4.5         1.5
## 86  versicolor          6.0         3.4          4.5         1.6
## 87  versicolor          6.7         3.1          4.7         1.5
## 88  versicolor          6.3         2.3          4.4         1.3
## 89  versicolor          5.6         3.0          4.1         1.3
## 90  versicolor          5.5         2.5          4.0         1.3
## 91  versicolor          5.5         2.6          4.4         1.2
## 92  versicolor          6.1         3.0          4.6         1.4
## 93  versicolor          5.8         2.6          4.0         1.2
## 94  versicolor          5.0         2.3          3.3         1.0
## 95  versicolor          5.6         2.7          4.2         1.3
## 96  versicolor          5.7         3.0          4.2         1.2
## 97  versicolor          5.7         2.9          4.2         1.3
## 98  versicolor          6.2         2.9          4.3         1.3
## 99  versicolor          5.1         2.5          3.0         1.1
## 100 versicolor          5.7         2.8          4.1         1.3
## 101  virginica          6.3         3.3          6.0         2.5
## 102  virginica          5.8         2.7          5.1         1.9
## 103  virginica          7.1         3.0          5.9         2.1
## 104  virginica          6.3         2.9          5.6         1.8
## 105  virginica          6.5         3.0          5.8         2.2
## 106  virginica          7.6         3.0          6.6         2.1
## 107  virginica          4.9         2.5          4.5         1.7
## 108  virginica          7.3         2.9          6.3         1.8
## 109  virginica          6.7         2.5          5.8         1.8
## 110  virginica          7.2         3.6          6.1         2.5
## 111  virginica          6.5         3.2          5.1         2.0
## 112  virginica          6.4         2.7          5.3         1.9
## 113  virginica          6.8         3.0          5.5         2.1
## 114  virginica          5.7         2.5          5.0         2.0
## 115  virginica          5.8         2.8          5.1         2.4
## 116  virginica          6.4         3.2          5.3         2.3
## 117  virginica          6.5         3.0          5.5         1.8
## 118  virginica          7.7         3.8          6.7         2.2
## 119  virginica          7.7         2.6          6.9         2.3
## 120  virginica          6.0         2.2          5.0         1.5
## 121  virginica          6.9         3.2          5.7         2.3
## 122  virginica          5.6         2.8          4.9         2.0
## 123  virginica          7.7         2.8          6.7         2.0
## 124  virginica          6.3         2.7          4.9         1.8
## 125  virginica          6.7         3.3          5.7         2.1
## 126  virginica          7.2         3.2          6.0         1.8
## 127  virginica          6.2         2.8          4.8         1.8
## 128  virginica          6.1         3.0          4.9         1.8
## 129  virginica          6.4         2.8          5.6         2.1
## 130  virginica          7.2         3.0          5.8         1.6
## 131  virginica          7.4         2.8          6.1         1.9
## 132  virginica          7.9         3.8          6.4         2.0
## 133  virginica          6.4         2.8          5.6         2.2
## 134  virginica          6.3         2.8          5.1         1.5
## 135  virginica          6.1         2.6          5.6         1.4
## 136  virginica          7.7         3.0          6.1         2.3
## 137  virginica          6.3         3.4          5.6         2.4
## 138  virginica          6.4         3.1          5.5         1.8
## 139  virginica          6.0         3.0          4.8         1.8
## 140  virginica          6.9         3.1          5.4         2.1
## 141  virginica          6.7         3.1          5.6         2.4
## 142  virginica          6.9         3.1          5.1         2.3
## 143  virginica          5.8         2.7          5.1         1.9
## 144  virginica          6.8         3.2          5.9         2.3
## 145  virginica          6.7         3.3          5.7         2.5
## 146  virginica          6.7         3.0          5.2         2.3
## 147  virginica          6.3         2.5          5.0         1.9
## 148  virginica          6.5         3.0          5.2         2.0
## 149  virginica          6.2         3.4          5.4         2.3
## 150  virginica          5.9         3.0          5.1         1.8
```


### 4. 

Using the data from Task 3, plot the sepal width for each species. Perhaps use a boxplot or a jitter plot (or both overlaid!). Be sure to format the axis labels nicely.


```r
iris_tidy %>%
  ggplot(aes(x = sepal_width, y = species)) +
    geom_jitter() 
```

![](Participation-2-13-2020_files/figure-html/unnamed-chunk-6-1.png)<!-- -->


### 5. 

`iris` expresses all of the measurements in centimeters. Convert them to inches (1 in = 2.54 cm). Store this dataset as a new object.


```r
iris_tidy_inches <- iris_tidy %>%
  mutate(sepal_length = sepal_length/2.54,
         sepal_width = sepal_width/2.54,
         petal_length = petal_length/2.54,
         petal_width = petal_width/2.54,) %>%
  print()
```

```
##        species sepal_length sepal_width petal_length petal_width
## 1       setosa     2.007874   1.3779528    0.5511811  0.07874016
## 2       setosa     1.929134   1.1811024    0.5511811  0.07874016
## 3       setosa     1.850394   1.2598425    0.5118110  0.07874016
## 4       setosa     1.811024   1.2204724    0.5905512  0.07874016
## 5       setosa     1.968504   1.4173228    0.5511811  0.07874016
## 6       setosa     2.125984   1.5354331    0.6692913  0.15748031
## 7       setosa     1.811024   1.3385827    0.5511811  0.11811024
## 8       setosa     1.968504   1.3385827    0.5905512  0.07874016
## 9       setosa     1.732283   1.1417323    0.5511811  0.07874016
## 10      setosa     1.929134   1.2204724    0.5905512  0.03937008
## 11      setosa     2.125984   1.4566929    0.5905512  0.07874016
## 12      setosa     1.889764   1.3385827    0.6299213  0.07874016
## 13      setosa     1.889764   1.1811024    0.5511811  0.03937008
## 14      setosa     1.692913   1.1811024    0.4330709  0.03937008
## 15      setosa     2.283465   1.5748031    0.4724409  0.07874016
## 16      setosa     2.244094   1.7322835    0.5905512  0.15748031
## 17      setosa     2.125984   1.5354331    0.5118110  0.15748031
## 18      setosa     2.007874   1.3779528    0.5511811  0.11811024
## 19      setosa     2.244094   1.4960630    0.6692913  0.11811024
## 20      setosa     2.007874   1.4960630    0.5905512  0.11811024
## 21      setosa     2.125984   1.3385827    0.6692913  0.07874016
## 22      setosa     2.007874   1.4566929    0.5905512  0.15748031
## 23      setosa     1.811024   1.4173228    0.3937008  0.07874016
## 24      setosa     2.007874   1.2992126    0.6692913  0.19685039
## 25      setosa     1.889764   1.3385827    0.7480315  0.07874016
## 26      setosa     1.968504   1.1811024    0.6299213  0.07874016
## 27      setosa     1.968504   1.3385827    0.6299213  0.15748031
## 28      setosa     2.047244   1.3779528    0.5905512  0.07874016
## 29      setosa     2.047244   1.3385827    0.5511811  0.07874016
## 30      setosa     1.850394   1.2598425    0.6299213  0.07874016
## 31      setosa     1.889764   1.2204724    0.6299213  0.07874016
## 32      setosa     2.125984   1.3385827    0.5905512  0.15748031
## 33      setosa     2.047244   1.6141732    0.5905512  0.03937008
## 34      setosa     2.165354   1.6535433    0.5511811  0.07874016
## 35      setosa     1.929134   1.2204724    0.5905512  0.07874016
## 36      setosa     1.968504   1.2598425    0.4724409  0.07874016
## 37      setosa     2.165354   1.3779528    0.5118110  0.07874016
## 38      setosa     1.929134   1.4173228    0.5511811  0.03937008
## 39      setosa     1.732283   1.1811024    0.5118110  0.07874016
## 40      setosa     2.007874   1.3385827    0.5905512  0.07874016
## 41      setosa     1.968504   1.3779528    0.5118110  0.11811024
## 42      setosa     1.771654   0.9055118    0.5118110  0.11811024
## 43      setosa     1.732283   1.2598425    0.5118110  0.07874016
## 44      setosa     1.968504   1.3779528    0.6299213  0.23622047
## 45      setosa     2.007874   1.4960630    0.7480315  0.15748031
## 46      setosa     1.889764   1.1811024    0.5511811  0.11811024
## 47      setosa     2.007874   1.4960630    0.6299213  0.07874016
## 48      setosa     1.811024   1.2598425    0.5511811  0.07874016
## 49      setosa     2.086614   1.4566929    0.5905512  0.07874016
## 50      setosa     1.968504   1.2992126    0.5511811  0.07874016
## 51  versicolor     2.755906   1.2598425    1.8503937  0.55118110
## 52  versicolor     2.519685   1.2598425    1.7716535  0.59055118
## 53  versicolor     2.716535   1.2204724    1.9291339  0.59055118
## 54  versicolor     2.165354   0.9055118    1.5748031  0.51181102
## 55  versicolor     2.559055   1.1023622    1.8110236  0.59055118
## 56  versicolor     2.244094   1.1023622    1.7716535  0.51181102
## 57  versicolor     2.480315   1.2992126    1.8503937  0.62992126
## 58  versicolor     1.929134   0.9448819    1.2992126  0.39370079
## 59  versicolor     2.598425   1.1417323    1.8110236  0.51181102
## 60  versicolor     2.047244   1.0629921    1.5354331  0.55118110
## 61  versicolor     1.968504   0.7874016    1.3779528  0.39370079
## 62  versicolor     2.322835   1.1811024    1.6535433  0.59055118
## 63  versicolor     2.362205   0.8661417    1.5748031  0.39370079
## 64  versicolor     2.401575   1.1417323    1.8503937  0.55118110
## 65  versicolor     2.204724   1.1417323    1.4173228  0.51181102
## 66  versicolor     2.637795   1.2204724    1.7322835  0.55118110
## 67  versicolor     2.204724   1.1811024    1.7716535  0.59055118
## 68  versicolor     2.283465   1.0629921    1.6141732  0.39370079
## 69  versicolor     2.440945   0.8661417    1.7716535  0.59055118
## 70  versicolor     2.204724   0.9842520    1.5354331  0.43307087
## 71  versicolor     2.322835   1.2598425    1.8897638  0.70866142
## 72  versicolor     2.401575   1.1023622    1.5748031  0.51181102
## 73  versicolor     2.480315   0.9842520    1.9291339  0.59055118
## 74  versicolor     2.401575   1.1023622    1.8503937  0.47244094
## 75  versicolor     2.519685   1.1417323    1.6929134  0.51181102
## 76  versicolor     2.598425   1.1811024    1.7322835  0.55118110
## 77  versicolor     2.677165   1.1023622    1.8897638  0.55118110
## 78  versicolor     2.637795   1.1811024    1.9685039  0.66929134
## 79  versicolor     2.362205   1.1417323    1.7716535  0.59055118
## 80  versicolor     2.244094   1.0236220    1.3779528  0.39370079
## 81  versicolor     2.165354   0.9448819    1.4960630  0.43307087
## 82  versicolor     2.165354   0.9448819    1.4566929  0.39370079
## 83  versicolor     2.283465   1.0629921    1.5354331  0.47244094
## 84  versicolor     2.362205   1.0629921    2.0078740  0.62992126
## 85  versicolor     2.125984   1.1811024    1.7716535  0.59055118
## 86  versicolor     2.362205   1.3385827    1.7716535  0.62992126
## 87  versicolor     2.637795   1.2204724    1.8503937  0.59055118
## 88  versicolor     2.480315   0.9055118    1.7322835  0.51181102
## 89  versicolor     2.204724   1.1811024    1.6141732  0.51181102
## 90  versicolor     2.165354   0.9842520    1.5748031  0.51181102
## 91  versicolor     2.165354   1.0236220    1.7322835  0.47244094
## 92  versicolor     2.401575   1.1811024    1.8110236  0.55118110
## 93  versicolor     2.283465   1.0236220    1.5748031  0.47244094
## 94  versicolor     1.968504   0.9055118    1.2992126  0.39370079
## 95  versicolor     2.204724   1.0629921    1.6535433  0.51181102
## 96  versicolor     2.244094   1.1811024    1.6535433  0.47244094
## 97  versicolor     2.244094   1.1417323    1.6535433  0.51181102
## 98  versicolor     2.440945   1.1417323    1.6929134  0.51181102
## 99  versicolor     2.007874   0.9842520    1.1811024  0.43307087
## 100 versicolor     2.244094   1.1023622    1.6141732  0.51181102
## 101  virginica     2.480315   1.2992126    2.3622047  0.98425197
## 102  virginica     2.283465   1.0629921    2.0078740  0.74803150
## 103  virginica     2.795276   1.1811024    2.3228346  0.82677165
## 104  virginica     2.480315   1.1417323    2.2047244  0.70866142
## 105  virginica     2.559055   1.1811024    2.2834646  0.86614173
## 106  virginica     2.992126   1.1811024    2.5984252  0.82677165
## 107  virginica     1.929134   0.9842520    1.7716535  0.66929134
## 108  virginica     2.874016   1.1417323    2.4803150  0.70866142
## 109  virginica     2.637795   0.9842520    2.2834646  0.70866142
## 110  virginica     2.834646   1.4173228    2.4015748  0.98425197
## 111  virginica     2.559055   1.2598425    2.0078740  0.78740157
## 112  virginica     2.519685   1.0629921    2.0866142  0.74803150
## 113  virginica     2.677165   1.1811024    2.1653543  0.82677165
## 114  virginica     2.244094   0.9842520    1.9685039  0.78740157
## 115  virginica     2.283465   1.1023622    2.0078740  0.94488189
## 116  virginica     2.519685   1.2598425    2.0866142  0.90551181
## 117  virginica     2.559055   1.1811024    2.1653543  0.70866142
## 118  virginica     3.031496   1.4960630    2.6377953  0.86614173
## 119  virginica     3.031496   1.0236220    2.7165354  0.90551181
## 120  virginica     2.362205   0.8661417    1.9685039  0.59055118
## 121  virginica     2.716535   1.2598425    2.2440945  0.90551181
## 122  virginica     2.204724   1.1023622    1.9291339  0.78740157
## 123  virginica     3.031496   1.1023622    2.6377953  0.78740157
## 124  virginica     2.480315   1.0629921    1.9291339  0.70866142
## 125  virginica     2.637795   1.2992126    2.2440945  0.82677165
## 126  virginica     2.834646   1.2598425    2.3622047  0.70866142
## 127  virginica     2.440945   1.1023622    1.8897638  0.70866142
## 128  virginica     2.401575   1.1811024    1.9291339  0.70866142
## 129  virginica     2.519685   1.1023622    2.2047244  0.82677165
## 130  virginica     2.834646   1.1811024    2.2834646  0.62992126
## 131  virginica     2.913386   1.1023622    2.4015748  0.74803150
## 132  virginica     3.110236   1.4960630    2.5196850  0.78740157
## 133  virginica     2.519685   1.1023622    2.2047244  0.86614173
## 134  virginica     2.480315   1.1023622    2.0078740  0.59055118
## 135  virginica     2.401575   1.0236220    2.2047244  0.55118110
## 136  virginica     3.031496   1.1811024    2.4015748  0.90551181
## 137  virginica     2.480315   1.3385827    2.2047244  0.94488189
## 138  virginica     2.519685   1.2204724    2.1653543  0.70866142
## 139  virginica     2.362205   1.1811024    1.8897638  0.70866142
## 140  virginica     2.716535   1.2204724    2.1259843  0.82677165
## 141  virginica     2.637795   1.2204724    2.2047244  0.94488189
## 142  virginica     2.716535   1.2204724    2.0078740  0.90551181
## 143  virginica     2.283465   1.0629921    2.0078740  0.74803150
## 144  virginica     2.677165   1.2598425    2.3228346  0.90551181
## 145  virginica     2.637795   1.2992126    2.2440945  0.98425197
## 146  virginica     2.637795   1.1811024    2.0472441  0.90551181
## 147  virginica     2.480315   0.9842520    1.9685039  0.74803150
## 148  virginica     2.559055   1.1811024    2.0472441  0.78740157
## 149  virginica     2.440945   1.3385827    2.1259843  0.90551181
## 150  virginica     2.322835   1.1811024    2.0078740  0.70866142
```


### 6.

Using the data from Task 5, plot the relationship between sepal width and sepal length. Indicate species using color and point shape.


```r
iris_tidy_inches %>%
  ggplot(aes(x = sepal_width, y = sepal_length)) +
    geom_point(aes(color = species, shape = species))
```

![](Participation-2-13-2020_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


### 7.

Using the data from Task 5, plot the relationship between sepal width and sepal length. This time, separate each species into a different subplot (facet).


```r
iris_tidy_inches %>%
  ggplot(aes(x = sepal_width, y = sepal_length)) +
    geom_point(aes(color = species, shape = species)) +
  facet_grid(rows = vars(species))
```

![](Participation-2-13-2020_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


<br><br>

## Back to Guide Again

Let's head back to the guide at the section on `summarize()`.

<br><br>


## Exercises for grouped data frames

Let's do some practice with grouping (and ungrouping) and summarizing data frames!


### 1.

   (a) What's the minimum life expectancy for each continent and each year? 
   (b) Add the corresponding country to the tibble, too. 
   (c) Arrange by min life expectancy.


```r
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(min_life = min(lifeExp)) %>%
  arrange(min_life) %>%
  transmute(min_life_decade = round(min_life, -1))
```

```
## # A tibble: 60 x 2
## # Groups:   continent [5]
##    continent min_life_decade
##    <fct>               <dbl>
##  1 Africa                 20
##  2 Asia                   30
##  3 Africa                 30
##  4 Asia                   30
##  5 Asia                   30
##  6 Africa                 30
##  7 Asia                   30
##  8 Africa                 30
##  9 Asia                   30
## 10 Africa                 30
## # ... with 50 more rows
```


### 2.

Let's compute the mean Agreeableness score across items for each participant  in the `psych::bfi` dataset. Be sure to handle `NA`!


```r
psych::bfi
```

```
##       A1 A2 A3 A4 A5 C1 C2 C3 C4 C5 E1 E2 E3 E4 E5 N1 N2 N3 N4 N5 O1 O2 O3 O4
## 61617  2  4  3  4  4  2  3  3  4  4  3  3  3  4  4  3  4  2  2  3  3  6  3  4
## 61618  2  4  5  2  5  5  4  4  3  4  1  1  6  4  3  3  3  3  5  5  4  2  4  3
## 61620  5  4  5  4  4  4  5  4  2  5  2  4  4  4  5  4  5  4  2  3  4  2  5  5
## 61621  4  4  6  5  5  4  4  3  5  5  5  3  4  4  4  2  5  2  4  1  3  3  4  3
## 61622  2  3  3  4  5  4  4  5  3  2  2  2  5  4  5  2  3  4  4  3  3  3  4  3
## 61623  6  6  5  6  5  6  6  6  1  3  2  1  6  5  6  3  5  2  2  3  4  3  5  6
## 61624  2  5  5  3  5  5  4  4  2  3  4  3  4  5  5  1  2  2  1  1  5  2  5  6
## 61629  4  3  1  5  1  3  2  4  2  4  3  6  4  2  1  6  3  2  6  4  3  2  4  5
## 61630  4  3  6  3  3  6  6  3  4  5  5  3 NA  4  3  5  5  2  3  3  6  6  6  6
## 61633  2  5  6  6  5  6  5  6  2  1  2  2  4  5  5  5  5  5  2  4  5  1  5  5
## 61634  4  4  5  6  5  4  3  5  3  2  1  3  2  5  4  3  3  4  2  3  5  3  5  6
## 61636  2  5  5  5  5  5  4  5  4  5  3  3  4  5  4  4  5  3  2 NA  4  6  4  5
## 61637  5  5  5  6  4  5  4  3  2  2  3  3  3  2  4  1  2  2  2  2  4  2  4  5
## 61639  5  5  5  6  6  4  4  4  2  1  2  2  4  6  5  1  1  1  2  1  5  3  4  4
## 61640  4  5  2  2  1  5  5  5  2  2  3  4  3  6  5  2  4  2  2  3  5  2  5  5
## 61643  4  3  6  6  3  5  5  5  3  5  1  1  6  6  4  4  5  4  5  5  6  6  6  3
## 61650  4  6  6  2  5  4  4  4  4  4  1  2  5  5  5  4  4  4  4  5  5  1  5  6
## 61651  5  5  5  4  5  5  5  5  4  3  2  2  4  6  6  6  5  5  4  4  5  1  4  5
## 61653  4  4  5  4  3  5  4  5  4  6  1  2  4  5  5  5  6  5  5  2  4  2  2  4
## 61654  4  4  6  5  5  1  1  1  5  6  1  1  4  5  6  5  5  5  1  1  4  1  5  3
## 61656  5  4  2  1  2  4  6  5  5  4  3  3  5  5  4  1  3  3  2  1  6  1  3  2
## 61659  1  6  6  1  5  5  4  4  2  3  1  2  4  3  4  2  5  5  4  6  5  1  6  6
## 61661  1  5  6  5  6  4  3  2  4  5  2  1  2  5  2  2  2  2  2  2  6  1  5  5
## 61664  2  6  5  6  5  3  5  6  3  6  2  2  4  6  6  4  4  4  6  6  6  1  5  6
## 61667  4  5  5  6  5  5  5  4  1  1  3  2  5  5  6  2  3  3  1  1  6  2  5  6
## 61668  1  6  6  1  6  5  2  5  1  1  1  1  6  6  6  2  3  1  2  1  6  4  5  5
## 61669  2  4  4  4  3  6  5  6  1  1  2  4  4  2  6  3  3  5  3  2  5  2  6  6
## 61670  2  5  6  6  6  4  5  4  3  4  1  2  6  6  6  4  4  5  2  3  6  1  6  4
## 61672  2  5  1  3  5  5  4  5  2  5  1  2  6  5  4  1  4  2  2  5  2  4  5  4
## 61673  4  5  6  5  5  5  5  3  5  4  1  2  6  5  5  5  4  4  3  1  4  4  6  5
## 61678  1  6  5  6  3  5  5  5  4  3  2  5  1  5  3  5  5  5  6  6  4  3  3  6
## 61679  2  5  6  6  6  5  5  5  2  4  1  2  4  5  5  3  2  4  1  2  5  2  5  5
## 61682  1  5  6  5  4  1  5  6  4  6  6  6  2  1  1  1  2  1  3  6  6  6  5  6
## 61683  2  4  5  6  5  4  6  4  2  4  2  2  3  5  3  2  2  4  1  3  5  5  5  4
## 61684  4  4  4  4  4  4  3  3  3  4  2  3  4  2  3 NA  2  1  2  2  4  3  5  5
## 61685  5  3  5  4  2  2  2  4  3  4  3  4  3  2  3  5  3  4  4  3  4  5  4  4
## 61686  1  6  4  6  4  5  6  3  1  5  6  6  3  2  2  2  2  2  4  1  5  5  4  5
## 61687  1  4  4  2  3  6  5  6  3  4  3  4  3  3  5  5  6  5  5  4  5  5  4  5
## 61688  1  6  6  6  6  6  6  6  1  1  1  1  1  6  6  1  1  1  1  1  6  1  6  6
## 61691  1  5  4  3  5  6  5  5  2  2  3  2  3  6  5  1  2  1  2  1  5  1  6  6
## 61692  1  5  5  6  5  4  4  4  3  4  4  3  4  4  4  2  2  3  3  3  4  3  2  5
## 61693  5  4  3  6  4  5  2  5  2  4  6  4  2  4  4  1  2  1  2 NA  3  3  2  2
## 61696  1  5  4  4  5  4  5  4  3  3  3  3  2  5  4  2  3  1  3  2  4  3  5  4
## 61698  5  6  4  3  5  5  3  3  4  5  6  4  4  4  3  2  2  3  4  5  3  5  4  4
## 61700  2  6  6  6  6  5  4  5  3  4  2  2  4  5  5  2  2  2  2  3  5  2  5  5
## 61701  1  6  6  6  6  5  2  1  2  1  6  5  6  6  5  2  1  4  6  5  6  5  6  6
## 61702  5  5  3  4  3  4  4  3  4  5  4  4  5  2  4  4  5  3  5  2  3  5  4  4
## 61703  2  6  4  5  5  3  2  3  4  6  2  4  2  4  4  3  4  2  2  4  5  4  5  3
## 61713  1  5  3  2  3  3  6  3  1  3  5  5  5  5  3  5  5  5  5  3  3  3  2  5
## 61715  1  6  6  6  6  5  5  4  1  2  1  1  6  6  6  4  4  1  1  1  6  3  6  6
## 61716  1  6  6  6  4  4  3  1  4  2  2  2  5  4  4  6  6  6  3  3  3  1  4  6
## 61723  1  5  6  5  4  6  6  6  6  2  4  4  4  3  6  1  1  1  6  5  5  6  3  6
## 61724  3  6  4  4  4  5  5  3  2  5  1  1  4  6  5  2  2  1  1  1  5  1  5  5
## 61725  4  3  5  6  3  5  6  2  5  2  3  5  2  6  2  6  5  5  5  6  2  5  2  6
## 61728  1  6  6  6  6  6  5  5  2  2  1  2  5  6  5  2  3  2  3  2  5  3  5  5
## 61730  1  4  3  5  5  5  5  4  4  5  2  5  4  5  5  2  4  4  5  3  5  1  6  6
## 61731  1  4  2  2  2  5  5  5  5  1  4  5  4  3  4  3  4  5  5  5  4  4  6  6
## 61732  3  4  5  2  4  5  4  5  2  4  5  5  5  4  5  5  5  5  3  2  5  2  5  5
## 61740  1  6  5  4  4  6  6  6  1  4  4  4  1  2  5  3  4  4  4  4  4  4  4  2
## 61742  3  3  5  4  5  6  4  4  2  2  2  1  4  6  4  1  2  1  4  1  4  3  5  5
## 61748  2  3  4  4  5  5  3  2  4  6  4  4  3  5  2  4  4  6  5  2  2  4  3  5
## 61749  2  4  4  5  3  5  5  4  3  4  6  5  4  3  4  4  5  4  5  5  6  6  4  6
## 61754  1  4  6  6  6 NA  6  6  2  3  1  1  5  6  6  4  4  3  1  3  5  3  3  6
## 61756  4  5  3  5  4  6  5  5  2  2  1  1  5  6  6  3  5  3  1  3  4  1  4  6
## 61757  2  6  6  6  6  4  6  6  1  4  3  6  5  4  4  4  3  6  6  4  4  1  6  6
## 61759  2 NA  4  6  4  5  4  5  2  1  5  5  3  3  3  1  1  1 NA  1  2  1  4  6
## 61761  1  5  4  2  5  1  2  2  2  6  2  5  2  2  1  2  5  5  4  2  5  4  4  6
## 61762  4  3  2  2  2  4  2  2  4  5  4  3  4  2  4  1  2  1  5  2  6  1  6  6
## 61763  2  3  4  5  6  5  5  4  2  2  1  2  4  4  4  1  2  2  4  2  3  2  5  5
## 61764  1  6  6  3  6  6  5  6  1  4  4  4  2  3  3  1  2  2  5  2  6  2  3  5
## 61771  4  5  6  6  4  4  6  6  1  2  4  3  5  5  5  2  3  3  1  3  4  1  4  6
## 61772  2  4  6  2  5  2  4  4  1  1  1  1  4  4 NA  1  3  2  2  1  6  2  4  5
## 61773  4  4  4  5  3  5  4  6  2  4  2  2  4  6  4  5  5  4  3  5  4  1  4  2
## 61775  1  5  5  5  4  5  5  5  1  2  4  4  3  2  5  1  2  4  4  4  5  1  5  4
## 61776  3  5  5  5  4  5  5  5  1  1  2  3  5  5  4  2  1  2  2  3  5  1  5  4
## 61777  2  5  5  6  5  5  4  6  3  2  1  1  4  6  5  2  2  3  3  2  5  1  4  3
## 61778  2  6  6  6  6  5  4  5  1  2  1  1  6  6  5  2  4  2  1  1  6  3  5  4
## 61780  5  6  6  6  5  5  5  6  3  4  1  2  5  6  6  4  3  4  4  6  5  4  5  6
## 61782  1  2  2  4  2  2  4  2  5  1  2  2  4  2  2  4  2  2  2  4  2  3  4  2
## 61783  2  5  5  5  5  4  2  3  5  4  4  4  4  5  4  2  3  4  5  2  4  4  3  5
## 61784  1  5  6  5  3  6  5  4  4  3  4  5  4  4  5  3  3  3  4  3  6  2  5  6
## 61788  1  6  3  3  1  6  6  5  1  6  4  5  3  5  1  4  4  6  6  5  6  1  6  6
## 61789  1  4  6  2  6  3  3  4  4  5  6  4  5  6  2  3  5  4  6  4  6  2  5  6
## 61793  1  6  6  5  6  5  6  5  1  1  3  2  5  5  5  3  3  2  2  2  4  5  4  5
## 61794  1  6  5  2  6  4  5  5  2  3  3  4  4  5  3  2  4  5  6  6  6  5  4  6
## 61797  4  4  4  6  5  2  5  4  4  3  5  3  3  3  5  2  2  4  2  4  3  4  3  4
## 61798  1  5  5  5  5  4  4  5  2  2  5  2  2  5  5  3  3  2  2  2  4  5  5  4
## 61801  1  6  5  4  6  4  5  4  4  5  2  2  4  5  5  1  3  2  2  2  5  1  4  5
## 61808  1  6  4  6  4  4  4  5  2  4  1  2  4  5  5  2  3  2  2  2  4  2  3  4
## 61812  3  4  5  5  4  3  3 NA  3  3  4  4  4  3  4  3  3  4  4  3  4  2  4  4
## 61813  1  5  5  5  5  5  2  4  1  2  4  1  5  5  5  1  1  1  4  1  6  1  5  5
## 61816  1  5  6  2  5  5  4  5  3  4  3  5  4  4  4  3  3  4  3  4  6  1  5  6
## 61818  2  4  5  4  5  2  2  3  4  4  1  5  2  6  2  2  3  6  4  6  3  2  2  2
## 61819  1  6  6  3  6  6  6  5  1  1  1  3  5  6  6  2  5  4  6  1  6  2  5  6
## 61821  2  6  4  6  4  4  5  6  3  1  2  4  2  5  4  4  5  2  3  6  3  4  3  5
## 61822  2  3  3  4  3  5  6  4  1  4  5  6  2  2  4  3  4  6  6  6  5  2  3  5
## 61825  3  1  2  2  2  2  1  2  6  6  6  6  1  1  1  3  5  4  4  4  5  1  3  6
## 61826  1  4  5  5  6  6  4  4  1  1  5  1  2  3  5  1  2  1  1  1  5  1  5  6
## 61829  4  3  2  6  5  4  5  6  2  6  5  5  1  5  5  4  5  6  6  6  5  1  2  6
## 61831  2  6  2  3  4  4  2  5  3  5  5  3  2  3  5  1  1  1  2  2  2  1  5  3
## 61834  2  5  5  3  5  4  3  4  3  5  3  5  4  5  5 NA  5  6  4  4  6  2  5  6
## 61835  3  4  4  2  4  4  3  4  4  2  2  3  4  3  5  4  4  2  2  4  4  2  5  4
## 61838  2  5  5  5  2  6  6  4  1  5  3  2  2  2  5  4  5  5  5  4  6  2  5  6
## 61839  1  4  5  2  6  2  1  2  4  6  6  5  3  3  3  2  1  3  3  1  4  3  4  5
## 61840  1  6  4  1  1  6  4  5  2  1  6  6  3  1  1  4  3  6  6  5  2  3  3  6
## 61841  1  6  5  6  6  5  3  4  6  5  2  4  3  4  5  4  5  4  3  4  5  4  4  6
## 61847  1  5  5  5  2  6 NA  6  1  1  3  2  1  2  6  5 NA  5  4  3  4  1  6  6
## 61848  6  1  1  1  2  3  6  3  3  4  1  4  5  2  6  6  6  3  2  5  6  1  6  5
## 61851  2  6  5  6  5  5  4  4  4  6  1  3  4  6  4  5  6  2  4  6  6  5  6  6
## 61852  3  6  5  6  4  3  5  2  3  4  2  5  6  6  5  6  6  6  4  6  5  4  4  6
## 61854  1  6  6  6  6  4  4  5  3  4  3  2  4  5  4  2  3  2  3  4  4  1  5  6
## 61856 NA  4  5  6  4  5  5  5  1  5  3  4  3  2  3  1  2  1  4  2  3  6  1  3
## 61857  1  6  6  5  4  5  3  5  1  2  2  4  4  5  4  1  1  1  2  2  4  2  4  6
## 61861  1  6  6  6  6  6  6  5  1  6  5  5  2  5  5  1  5  5  5  6  6  1  6  6
## 61862  1  6  5  4  5  5  4  5  2  2  1  1  6  6  5  2  2  2  2  2  6  1  5  4
## 61865  4  2  1  2  2  4  1  2  6  6  5  5  2  2  1  2  4  2  4  2  2  6  3  5
## 61868  1  5  4  3  4  5  6  4  1  4  3  2  4  5  6  1  2  2  4  1  4  1  6  5
## 61873  5  2  2  2  1  2  2  2  3  5  5  6  2  1  2  4  4  2  2  2  5  1  5  5
## 61874  2  5  4  3  4  5  4  5  2  3  1  2  4  5  5  4  4  3  2  3  6  1  5  5
## 61880  1  5  6  6  6  6  5  4  2  6  1  2  5  6  6  1  2  2  2  4  6  1  6  6
## 61886  4  6  5  5  6  4  6  5  5  2  1  3  6  6  6  4  3  1  3  4  6  3  6  5
## 61888  2  5  4  4  4  4  5  5  5  5  5  6  3  2  2  3  4  2  5  6  2  4  4  6
## 61889  6  5  5  2  5  5  5  6  1  1  1  2  5  5  6  5  4  4  3  1  6  2  6  5
## 61890  2  5  5  1  6  5  5  5  3  6  2  4  6  6  5  4  4  3  3  1  5  3  6  4
## 61891  2  4  5  5  5  5  5  4  6  6  5  5  5  5  3  1  2  2  4  2  5  2  5  6
## 61895  2  5  5  5  2  5  5  5  2  6  5  5  3  2  2  2  3  2  5  5  5  1  6  6
## 61896  2  5  6  5  6  5  4  5  3  2  2  2  4  5  5  4  4  2  2  2  4  3  5  4
## 61900  2  5  4  4  5  5  4  5  3  5  2  3  5  4  5  2  3  3  4  2  5  2  6  6
## 61901  2  5  5  3  2  2  3  4  5  6  2  5  2  2  2  2  4  4  4  2  5  2  4  6
## 61907  4  5  4 NA  3  5  3  4  2  5  1  4  3  5  4  4  5  5  4  5  4  4  3  6
## 61908  2  4  4  4  4  4  4  4  4  5  4  3  4  6  5  4  5  3  5  4  4  2  4  6
## 61909  3  5  4  5  4  4  4  5  3  5  2  4  5  5  4  5  5  5  5  5  6  3  4  5
## 61911  4  3  3  3  3  6  5  5  2  3  5 NA  3  2  3  3  3  3  4  4  5  1  5  6
## 61913  2  4  3  3  3  4  4  4  3  6  2  5  3  2  5  4  6  4  4  5  3  5  3  5
## 61915  1  6  6  6  6  6  6  3  6  5  6  5  5  6  6  6  6  4  5  6  5  6  6  6
## 61918  1  6  6  5  6  6  1  3  4  5  3  4  4  6  3  5  5  2  5  2  4  4  6  6
## 61921  1  6  6  4  6  1  1  3  1  1  1  1  6  6  6  4  4  1 NA  2  4  1  6  2
## 61922  1  6  5  6  5  6  6  4  1  1  1  2  5  4  5  4  6  2  1  2  6  1  6  5
## 61923  1  6  5  6  5  5  5  4  1  4  2  3  6  6  5  4  4  5  4  5  5  2  5  6
## 61925  3  6  6  4  6  2  3  2  5  5  1  1  6  6  6  4  4  4  3  3  6  3  4  5
## 61926  2  3  1  3  1  3  3  3  2  6  6  6  1  1  3  5  4  3  6  4  2  2  1  5
## 61928  2  4  5  5  5  4  4  6  4  2  1  2  4  6  5  6  6  4  4  6  4  4  3  4
## 61932  2  5  3  5  1  6  5  4  2  2  1  1  5  6  2  3  5  4  4  5  4  2  5  4
## 61935  1  6  5  6  6  3  2  4  2  3  3  2  5  5  3  2  2  2  2  1  4  4  4  5
## 61936  5  4  4  5  6  3  5  3  3  6  4  4  6  5  5  2  5  2  1  2  6  2  5  5
## 61939  2  5  4  3  3  6  4  4  2  4  6  4  3  3  4  1  1  1  4  3  6  1  4  6
## 61944  1  6  6  3  6  6  6  6  1  5  1  4  5  5  6  3  6  4  4  6  5  1  4  6
## 61945  2  6  4  5  4  4  4  5  3  5  3  3  4  4  4  3  3  3  4  3  4  4  5  5
## 61949  2  6  3  5  2  4  4  6  4  5  2  1  5  4  6  1  1  1  1  1  6  2  5  2
## 61952  1  5  5  6  5  5  5  5  2  2  2  2  1  5  3  5  2  4  4  2  5  2  5  5
## 61953  1  5  5  3  3  5  2  2  5  6  2  3  2  3  4  5  5  5  3  2  5  2  5  6
## 61954  1  6  6  5  6  6  5  3  1  1  1  2  5  5  5  1  1  1  2  4  6  1  6  6
## 61957  2  5  5  6  5  4  4  2  5  4  4  3  5  5  4  3  4  2  1  1  6  5  4  6
## 61958  4  4  3  1  4  5  4  4  1  1  1  1  4  6  6  3  4  2  2  1  4  1  6  4
## 61965  2  6  5  5  3  5  5  6  2  1  2  5  3  4  5  1  3  2  1  3  6  2  4  6
## 61967  3  5  6  5  5  4  5  4  2  4  2  2  5  5  5  3  3  5  4  3  5  2  6  5
## 61968  1  6  6  6  5  5  3  4  4  4  1  2  5  6  5  2  2  2  2  3  5  4  5  5
## 61969  2  5  5  5  4  3  1  4  4  5  5  5  5  3  5  2  4  5  4  5  5  4  5  5
## 61971  2  4  4  1  3  3  5  4  4  5  4  4  4  5  2  1  2  1  4  4  5  1  6  6
## 61972  2  4  5  5  4  5  6  5  2  1  3  4  4  2  6  6  6  2  3  4  5  5  4  5
## 61973  1  5  5  6  5  5  4  5  1  1  4  2  4  4  4  3  4  2 NA  1  5  1  4  4
## 61974  1  6  6  2  5  5  3  2  3  4  2  2  3  5  5  2  4  2  3  5  4  2  4  6
## 61975  2  6  4  5  4  2  3  2  4  5  2  3  4  5  4  4  3  2  4  2  5  5  4  4
## 61976  1  5  2  3  4  2  5  6  5  2  5  2  1  3  4  1  2  4  1  1  5  6  2  2
## 61978  1  6  6  6  6  5  5  5  2  2  2  2  5  6  4  2  2  4  3  4  5  6  5  6
## 61979  2  4  5  5  5  1  1  3  4  5  1  2  5  5  2  1  2  1  2  1  6  1  5  5
## 61983  2  4  5  6  5  4  6  4  1  2  1  1  6  6  5  1  1  2  2  1  5  1  5  5
## 61986  2  6  5  4  4  4  2  4  5  5  2 NA  4  3  5  4  4  2  4  1  6  4  5  5
## 61987  1  5  5  5  5  5  6  4  2  2  4  1  5  4  6  4  5  5  4  2  5  1  5  6
## 61989  1  6  6  1  3  6  6  5  1  4  5  6  1  4  1  6  6  6  5  6  5  1  2  5
## 61990  3  4  4  3  4  3  3  5  3  6  2  5  5  3  4  5  4  2  2  4  5  4  4  4
## 61992  4  4  5  6  4  5  6  6  4  2  2  2  5  5  5  4  2  4  5  4  4  2  5  3
## 61993  1  5  5  5  5  4  4  4  4  5  2  2  5  5  5  3  3  3  3  4  6  2  5  4
## 61994  2  6  5  5  4  5  4  5  3  4  4  6  5  6  6  3  3  2  2  2  5  6  6  5
## 61999  2  6  6  6  5  5  5  5  2  1  2  1  5  5  6  1  2  2  2  3  5  1  6  6
## 62001  1  2  2  4  3  6  4  6  5  6  4  5  1  6  3  4  6  6  4  5  3  4  3  6
## 62003  1  6  5  6  6  4  5  3  3  4  6  3  4  5  5  1  2  2  2  3  6  1  5  6
## 62004  6  5  6  6  5  6  6  6  1  3  6  6  4  4  5  4  5  4  4  4  6  1  3  6
## 62005  4  3  4  3  4  4  3  5  4  4  2  4  4  3  4  5  5  3  2  3  5  4  4  4
## 62007  3  4  2  2  3  3  2  2  4  1  2  2  5  4  5  2  3  1  1  1  6  3  6  5
## 62009  4  3  4  3  3  5  2  4  4  5  3  5  4  1  4  5  5  5  4  4  6  1  6  6
## 62011  1  6  5  6  6  5  4  5  2  4  3  4  5  6  4  2  3  2  1  1  5  5  3  5
## 62013  3  5  4  4  4  3  3  4  4  4  5  4  3  2  4  2  3  2  3  2  5  4  4  3
## 62014  4  2  2  3  3  4  3  3  4  5  4  5  2  2  5  5  4  4  5  4  5  2  5  6
## 62015  3  4  4  3  3  5  5  4  3  2  3  4  4  2  3  4  4  5  4  4  6  1  6  6
## 62022  1  6  5  6  3  3  5  1  1  6  1  3  3  3  6  6  6  6  2  6  3  6  1  1
## 62023  1  5  5  4  5  4  4  4  4  4  4  1  5  5  4  1  2  1  1  2  6  4  6  6
## 62024  2  2  1  6  3  6  6  6  1  1  2  2  5  6  6  1  3  1  1  1  6  1  6  6
## 62025  2  4  4  5  5  5  5  5  1  2  6  5  2  5  5  5  5  5  6  3  2  2  3  5
## 62026  1  6  6  2  5  5  5  5  1  2  2  2  6  6  6  6  6  4  2  4  6  1  5  5
## 62029  2  3  4  4  4  3  1  1  3  2  3  3  3  3  4  2  3  2  3  2  6  2  4  5
## 62031  1  6  4  3  6  4  4  5  2  5  2  5  4  5  6  4  5  5  2  6  5  2  6  6
## 62032  2  3  4  5  3  4  5  4  2  5  5  3  3  4  4  2  2  4  4  3  4  3  4  5
## 62033  5  4  3  5  4  4  4  4  4  5  1  5  5  6  4  1  1  1  4  5  5  4  4  4
## 62034  1  5  4  4  4  5  5  5  2  4  3  4  2  4  4  4  4  4  3  4  4  2  3  5
## 62038  1  6  6  5  3  1  3  2  2  5  6  6  5  1  2  6  4  6  6  3  3  1  3  3
## 62039  2  5  6  3  5  5  3  3  3  4  1  2  6  5  6  5  4  1  2  2  4  4  5  4
## 62041  2  4  5  6  5  2  4  4  3  2  4  4  3  5  2  2  4  3  2  3  3  1  3  5
## 62042  2  6  5  5  5  2  4  3  4  6  1  3  5  6  6  1  1  2  1  1  6  3  4  5
## 62043  1  5  6  4  5  3  2  5  2  1  1  1  2  5  4  1  2  2  2  4  5  1  5  5
## 62044  2  5  5  5  5  5  6  5  1  2  2  3  3  5  4  1  3  1  2  5  4  3  4  5
## 62047  1  5  2  2  2  2  2  6  2  3  5  6  4  1  5  3  5  5  5  4  2  5  4  6
## 62048  3  3  5  5  5  4  4  4  3  4  3  2  3  5  4  3  5  3  3  4  4  4  3  2
## 62051  2  4  5  6  5  5  6  4  1  2  2  1  4  6  5  1  2  1  1  1  5  3  4  3
## 62052  1  6  5  5  5  5  4  4  3  4  3  2  4  5  4  1  2  4  2  1  6  2  4  5
## 62054  2  6  4  6  2  4  5  5  1  1  6  4  5  4  6  1  2  1  5  4  5  2  1  5
## 62055  2  5  5  6  4  2  4  2  2  4  5  4  3  3  5  4  4  4  3  2  3  2  3  4
## 62056  1  4 NA  6  6  6  4  4  1  1  6  6  6  1  6  1  1  1  1  1  6  1  4  6
## 62059  1  5  6  5  5  3  3  3  4  4  1  1  5  5  5  3  4  4  2  3  4  3  5  4
## 62060  2  3  2  1  4  1  2  2  1  5  1  5  2  4  5  1  5  1  2  1  4  1  2  5
## 62063  2  5  5  5  5  6  2  5  2  2  2  2  4  6  5  2  2  2  1  2  5  1  5  6
## 62064  1  6  5  6  6  4  5  4  5  6  3  4  6  5  5  5  5  6  2 NA  6  1  1  5
## 62067  5  4  4  4  5  5  4 NA  4  4  4  4  4  5  3  2  2  2  2  1  5  3  4  5
## 62070  3  4  3  3  3  3  3  3  4  6  5  5  2  2  4  6  6  6  6  3  3  4  2  4
## 62073  1  6  6  4  6  5  5  5  1  3  3  1  6  2 NA  2  2  1  1  2  6  1  6  6
## 62075  2  4  4  1  4  5  4  4  2  2  4  5  3  3  5  4  5  1  2  3  5  1  5  6
## 62077  1  6  6  6  6  6  5  4  1  2  1  1  5  6  6  3  4  3  2  2  6  6  5  5
## 62079  2  4  4  4  3  5  1  3  2  1  1  1  3  6  5  5  6  6  1  1  4  3  5  2
## 62082  5  5  4  5  4  6  6  6  1  6  2  2  4  5  5  1  1  4  3  4  6  4  4  5
## 62084  5  3  1  2  3  6  2  2  4  5  5  4  3  4  2  1  4  4  4  2  6  2  6  5
## 62090  2  5  5  5  4  5  5  5  4  3  2  4  5  5  4  3  4  4  3  4 NA  5  3  4
## 62092  1  5 NA  5  6  6  6  1  1  1  6  1  1  5  1  1  1  1  6  1  6  6  6  1
## 62094  1  5  5  6  6  5  5  5  3  3  1  1  5  5  5  1  1  1  1  2  5  2  5  5
## 62099  1  5  6  6  4  5  3  4  3  5  2  2  3  6  4  2  2  2  2  4  5  1  5  5
## 62101  1  5  6  5  6  2  5  5  2  2  1  3  4  6  6  3  5  2  2  3  5  1  5  6
## 62102  1  6  6  6  4  1  5  6  3  2  4  2  6  4  2  2  5  5  4  4  5  5  5  6
## 62103  3  5  5  3  4  4  3  4  3  3  3  4  3  4  3  3  4  3  3  3  3  2  4  4
## 62105  2  5  4  3  2  6  5  6  2  4  2  4  2  2  5  4  5  2  2  1  5  1 NA  5
## 62106  1  5  6  5  5  5  3  4  1  5  2  2  4  5  5  2  2  2  2  1  5  3  4  5
## 62107  2  6  6  5  5  5  5  4  2  1  2  3  5  4  6  2  3  2  2  1  6  1  5  6
## 62111  5  4  5  6  4  1  4  6  2  2  3  3  5  4  5  2  2  1  3  2  5  6  4  6
## 62115  2  6  4  3  5  5  3  3  2  4  4  4  3  3  3  2  3  2  2  4  6  4  4  6
## 62118  5  4  5  6  2  5  6  4  1  1  1  1  3  6  3  2  4  2  3  1  6  2  6  3
## 62119  3  5  2  4  5  5  4  6  3  3  3  5  2  3  2  1  3  3  2  4  5  2  5  5
## 62120  3  6  5  6  6  6  5  5  1  1  1  2  4  6  6  2  2  1  2  3  5  2  4  6
## 62121  2  5  4  4  4  3  3  4  5  4  2  2  4  4  4  5  5  4  4  4  3  5  4  3
## 62124  1 NA  4  6  5  5  5  2  3  3  2  2  4  2  4  2  3  3  4  3  4  3  5  6
## 62128  1  6  6  6  5  4  3  4  5  6  2  2  4  5  3  1  2  4  4  4  4  3  5  5
## 62130  3  4  4  6  3  5  5  5  2  4  6  4  3  3  4  1  3  2  2  1  6  2  3  5
## 62132  3  5  6  5  6  5  6  5  2  1  3  1  4  6  5  3  5  3  3  1  4  1  4  4
## 62133  1  5 NA  6  5  5  5  6  1  1  1  2  4  6  6  4  4  3  2  2  6  1  5  6
## 62136  2  4  4  6  3  4  5  4  2  4  6  4  2  3  4  1  1  1  1  1  6  2 NA  5
## 62137  4  5  5  5  5  5  4  5  2  4  2  2  4  5  5  2  3  2  1  1  5  4  4  4
## 62142  1  6  4  6  6  5  4  5  1  2  5  1  5  4  6  1  2  2  1  1  4  2  5  5
## 62144  4  3  4  2  5  5  5  5  2  2  2  2  3  3  6  4  4  3  3  2  6  1  4  6
## 62147  3  5  5  5  5  4  3  3  3  5  3  4  3  5  5  4  5  2  2  2  5  4  4  5
## 62151  5  2  1  1  2  2  1  2  5  6  2  5  2  4  2  3  6  4  5  3  5  6  2  6
## 62156  3  3  3  4  4  5  2  5  2  3  4  2  3  5  4  2  2  2  3  2  2  3  2  4
## 62160  4  2  4  1  4  5  4  4  1  5  2  2  4  3  5  2  4  1  2  1  4  4 NA  4
## 62161  3  5  4  5  5  4  2  4  4  4  3  4  6  6  6  3  4  2  2  1  5  1  3  5
## 62162  3  5  6  6  5  4  4  6  3  3  3  4  4  5  4  1  1  2  3  2  5  4  4  5
## 62163  4  5  5  6  4  6  5  5  2  2  5  5  4  4  4  2  4  2  6  2  5  2  4  4
## 62164  6  1  1  4  6  5  6  5  1  1  1  1  5  6  6  1  1  1  1  1  5  1  6  1
## 62165  3  5  5  6  6  6  6  6  1  1  1  2  4  4  6  1  1  1  2  2  3  2  4  2
## 62166  5  5  5  6  6  5  4  5  2  2  4  1  5  6  5  1  1  2  5  1  6  5  4  4
## 62168  3  4  4  5  3  4  4  4  2  2  4  3  3  3  5  3  3  3  2  2  5  4  4  4
## 62170  5  6  5  5  6  5  4  6  1  2  1  3  5  6  5  1  4  1  3  2  4  5  4  6
## 62171  1  6  5  6  5  3  3  5  4  4  4  5  4  3  5  2  2  3  5  4  5  3  5  6
## 62173  1  6  6  6  5  6  4  4  1  5  1  1  6  3  3  3  5  5  2  4  6  6  4  6
## 62176  4  4  6  5  4  4  5  3  5  4  2  4  4  5  3  2  4  2  3  3  5  4  4  4
## 62179  5  5  5  1  5  6  5  2  6  6  4  4  6  3  3  5  4  4  5  4  6  6  6  6
## 62180  3  4  4  3  2  6  5  5  1  3  2  5  5  2  5  4  5  3  6  1  6  1  6  6
## 62181  6  6  6  6  6  5  5  6  6  1  1  1  6  6  6  6  3  2  2  5  1  2  6  6
## 62182  2  6  5  6  5  6  5  5  1  1  5  1  5  5  6  5  4  2  2  1  6  1  5  6
## 62183  4  1  4  6  6  6  4  4  2  6  1  1  6  6  5  1  2  1  1  1  4  3  4  2
## 62189  3  5  4  5  5  5  6  5  2  1  3  3  4  6  5  1  2  2  1  2  4  5  3  4
## 62192  2  4  5  5  5  4  4  4  2  3  3  4  3  5  3  5  5  2  4  4  4  4  4  2
## 62197  1  5  5  5  5  5  4  5  1  1  2  2  3  5  5  1  2  2  2  2  2  2  5  4
## 62198  1  6  6  5  5  5  6  5  2  5  4  4  3  6  5  3  4  2  2  6  4  2  5  5
## 62199  4  5  4  3  4  4  4  5  4  5  4  4  4  4  5  2  2  5  5  3  6  2  3  6
## 62201  3  5  4  5  5  5  5  3  4  6  1  6  5  6  6  6  6  5  4  5  6  6  3  4
## 62202  4  5  6  4  6  4  5  5  3  3  1  1  5  5  6  2  4  4 NA  1  6  2  5  5
## 62203  1  6  6  6  6  6  5  6  1  3  1  1  6  6  6  1  1  1  3  3  6  1  6  5
## 62204  1  5  6  6  6  5  6  6  5  1  4  1  6  6  5  5  1  5  5  2  6  5  5  5
## 62205  2  4  4  4  5  4  5  4  2  4  1  1  5  6  6  4  5  6  4  4  6  3  5  4
## 62206  3  5  6  6  6  4  5  6  3  1  2  1  5  2  6  5  4  1  2  3  4  5  5  6
## 62208  1  5  6  5  6  6  5  5  1  2  2  1  5  5  6  2  2  2  2  1  5  1  6  4
## 62209  1  4  4  2  5  5  4  3  2  4  5  5  4  2  3  4  4  4  5  4  4  2  2  5
## 62212  4  6  6  6  5  4  4  5  2  5  1  1  4  5  5  4  5  4  4  5  5  1  6  6
## 62213  2  6  5  6  3  3  3  5  3  5  1  4  3  5  2  4  5  6  4  4  2  4  3  6
## 62214  3  4  5  4  4  4  4  3  4  5  5  4  3  3  4  5  5  3  3  3  4  3  5  5
## 62215  2  6  6  6  6  5  4  5  1  1  1  1  5  5  5  4  3  2  2  3  5  1  5  4
## 62216  2  2  2  4  3  3  2  4  4  6  4  4  3  3  3  1  3  3  5  1  4  6  3  4
## 62219  2  5  4  6  4  4  5  4  3  4  1  3  3  4  4  4  4  5  3  5  4  4  4  4
## 62220  3  4  6  6  4  4  4  5  5  4  2  4  4  3  3  6  6  6  4  5  3  4  5  4
## 62224  1  5  5  6  5  5  4  5  2  1  1  3  5  6  5  3  4  4  3  4  5  3  4  4
## 62225  2  5  6  5  4  3  5  5  2  1  4  5  4  1  6  6  6  6  6  4  4  2  6  6
## 62226  2  4  2  4  4  5  3  5  2  3  6  4  4  5  5  4  4  3  3  2  5  2  5  5
## 62227  1  6  6  6  6  6  4  4  3  4  1  1  6  6  6  1  2  4  2  2  6  1  6  6
## 62228  1  6  6  6  5  5  4  6  2  2  2  4  4  6  3  5  6  3  2  4  3  5  3  3
## 62231  1  5  5  6  5  2  4  5  5  5  3  5  5  5  2  3  4  4  4  2  1  4  3  5
## 62233  2  5  5  5  5  5  5  5  2  1  2  2  4  5  5  1  1  1  1  1  5  1  5  2
## 62237  3  4  5  5  5  4  4  5  4  4  5  4  3 NA  4  3  4  2  4  4  3  5  3  3
## 62239  3  6  5  5  5  4  4  5  4  4  1  2  5  6  6  4  4  4  3  5  6  2  5  4
## 62240  1  5  6  4  6  5  3  3  4  5  1  1  5  6  5  4  6  6  5  6  6  2  6  5
## 62242  5  6  6  6  6  4  5  4  3  5  1  2  4  6  6  4  5  1  2  3  6  6  5  6
## 62244  1  6  6  1  5  5  6  6  5  6  1  3  6  5  5  4  4  1  2  2  5  3  4  5
## 62245  3  4  4  4  3  3  2  2  4  6  5  3  4  4  5  4  5  2  3  1  4  2  5  5
## 62246  4  5  5  6  6  3  5  6  2  1  6  6  1  5  6  2  3  3  2  1  5  3  1  3
## 62252  3  4  4  3  4  4  4  4  4  3  3  4  3  4  3  4  4  3  3  3  4  3  4  4
## 62259  1  5  5  6  5  5  6  2  1  5  3  3  5  6  4  2  4  5  4  4  6  1  6  6
## 62260  1  5  5  5  4  4  4  4  2  2  4  4  4  2  5  1  2  1  1  2  4  2  5  6
## 62261  2  6  6  5  5  5  2  6  5  5  6  5  3  4  2  2  2  2  4  2  4  5  3  4
## 62263  3  5  6  4  5  4  3  5  3  4  1  2  4  5  4  2  3  5  4  3  4  3  5  6
## 62264  4  5  4  5  4  5  5  4  1  1  2  2  4  5  5  3  4  4  4  4  5  1  5  4
## 62265  2  6  4  2  5  5  5  4  2  4  2  4  3  2  6  2  5  6  5  2  6  1  6 NA
## 62266  5  2  3  2  3  5  4  3  2  3  4  5  4  4  1  2  4  5  5  4  5  1  5  6
## 62267  1  6  5  6  5  5  6  6  2  1  5  2  5  1  6  5  4  5  4  2  6  5  3  6
## 62272  3  4  4  4  4  6  6  5  1  2  2  2  5  5  6  2  2  2  2  4  5  6  6  6
## 62276  1  6  6  4  6  4  5  5  2  3  1  1  6  6  5  3  5  5  2  2  5  5  6  6
## 62278  3  5  6  6  6  3  5  3  2  2  2  4  4  4  4  2  3  1  2  3  5  5  4  5
## 62279  1  6  5  4  5  6  5  5  1  2  1  4  1  5  4  2  4  4  2  6  2  1  4  6
## 62280  2  5  5  6  5  4  4  4  1  2  3  2  4  5  5  1  1  1  2  1  5  2  4  5
## 62281  1  6  6  6  6  5  4  6  1  2  1  2  6  6  6  1  4  4  1  1  5  4  6  4
## 62282  3  5  5  6  1  6  5  5  4  6  1  1  6  3  6  6  6  6  5  1  6  1  6  3
## 62287  2  4  4  6  2  5  5  5  2  1  3  6  5  4  5  5  5  6  5  5  5  2  4  6
## 62288  3  5  6  4  6  2  1  5  6  6  1  1  5  5  1  1  1  3  6  4  6  2  2  4
## 62289  3  5  4  2  2  4  4  4  2  2  4  4  2  4  4  5  6  6  6  6  5  1  3  6
## 62290  2  5  3  2  2  5  3  4  4  4  2  2  4  4  5  2  2  4  2  2  4  2  5  6
## 62293  2  6  6  6  6  4  5  5  1  2  2  2  3  5  6  2  3  3  1  1  5  2  3  2
## 62295  2  2  6  2  2  6  6  6  1  2  6  2  6  1  6  5  5  5  5  1  6  1  6  6
## 62296  2  6  6  6  6  4  5  4  2  2  1  1  5  6  5  2  2  2  1  2  4  1  5  5
## 62298  5  2  2  2  5  5  5  6  2  5  4  5  3  3  3  5  5  5  6  5  5  1  5  6
## 62299  4  4  4  4  4  5  5  5  5  5  3  3  3  3  3  4  4  4  4  4  3  3  3  3
## 62300  3  3  4  6  3  4  4  3  4  4  5  5  2  3  5  4  5  4  4  2  5  2  3  4
## 62301  1  6  5  6  5  5  5  5  2  4  2  2  5  5  5  2  4  2  4  1  5  1  6  6
## 62303  2 NA  5  5  2  5  5  6  1  2  6  5  2  4  5  2  2  4  2  4  4  1 NA  4
## 62305  4  5  5  6  4  4  4  3  3  4  6  6  3  2  3  4  4  3  3  5 NA  4  3  6
## 62307  1  5  4  5  6  6  6  2  6  6  1  1  6  6  6  6  6  6  6  5  6  5  6  6
## 62312  2  2  5  4  4  5  5  4  3  5  5  5  4  5  4  3  2  4  4  2  6  2  6  6
## 62313  1  6  6  6  4  5  5  3  4  5  4  4  4  5  3  4  4  5  6  4  6  1  6  6
## 62316  2  6  5  5  6  4  6  5  1  2  3  2  5  5  5  1  2  3 NA  2  5  2  6  4
## 62317  4  4  3  2  3  4  4  5  2  3  2  4  4  1  5  6  6  5  5  5  4  1  5  5
## 62325  1  4  6  6  6  5  6  4  1  1  3  4  6  6  6  1  3  3  4  2  6  1  6  5
## 62327  2  6  6  6  5  4  6  6  2  5  6  6  2  3  4  5 NA  5  5  6  6  4  1  6
## 62328  3  2  6  1  6  3  1  5  2  5  3  5  2  4  5  5  6  6  6  5 NA  2  1  6
## 62330  3  5  5  5  5  3  5  5  2  1  1  1  5  6  5  6  6  5  5  3  5  5  6  6
## 62333  1  6  6  6  6  6  6  6  1  1  5  1  6  6  6  1  6  1  1  1  6  1  3  6
## 62335  2  5  5  6  4  3  3  4  4  2  5  5  4  3  3  2  4  5  6  4  4  5  4  5
## 62336  1  5  4  3  2  6  5  2  1  5  2  2  1  2  2  4  4  5  5  2  4  3  4  5
## 62339  3  5  3  4  4  3  2  5  4  5  2  5  3  3  4  4  5  4  2  2  4  5  3  5
## 62342  1  5  5  5  5  4  1  2  6  3  2  1  5  3  6  6  5  2  4 NA  6  1  6  6
## 62343  2  4  2  6  5  5  4  4  6  5  5  6  3  3  5  4  4  4  3  4  3  2  2  2
## 62344  1  6  5  6  5  5  6  4  2  4  1  1  5  6  6  2  2  4  2  2  4  5  6  5
## 62345  2  4  4  6  5  4  4  4  3  4  1  1  5  5  6  2  4  3  3  1  6  1  6  4
## 62346  1  5  5  5  5  5  4  5  3  3  3  2  5  5  5  5  5  4  4  3  6  4  6  6
## 62347  2  4  5  6  5  4  3  3  5  5  5  4  5  3  1  3  4  4  5  5  4  2  4  5
## 62348  5  5  5  6  5  4  5  6  4  3  5  4  4  4  6  6  6  6  5  4  3  6  3  5
## 62349  2  5  5  6  5  6  6  5  1  3  1  1  4  4  6  4  4  1  5  3  5  2  4  6
## 62350  2  5  1  6  4  4  4  6  4  2  4  3  4  5  4  3  5  4  4  4  4  4  5  5
## 62351  4  6  6  4  4  6  4  6  1  4  1  5  5  2  5  4  6  4  2  5  6  3  4  6
## 62352  2  5  5  6  5  5  5  5  1  1  2  2  4  5  4  3  4  4  4  4  4  3  4  5
## 62353  3  5  1  4  4  2  4  4  4  4  4  2  5  4  5  4  4  5  2  1  5  1  6  5
## 62354  2  5  5  4  5  4  4  5  3  2  4  5  5  6  3  5  6  2  1  4  4  5  4  3
## 62358  2  3  6  4  5  3  3  5  3  4  3  1  6  5  6  1  2  4  4  1  6  5  6  6
## 62359  1  5  5  6  5  5  5  5  2  4  4 NA  4  5  3  3  5  4  4  4  5  5  4  5
## 62360  4  2  5  5  5  4  4  3  4  6  4  2  3  3  4  2  2  4  3  2  4  3  3  5
## 62362  1  5  5  5  4  5  4  5  4  5  5  5  1  2  4  5  5  2  3  3  4  2  5  6
## 62363  2  5  5  6  6  4  5  2  4  4  6  5  5  4  4  1  3  4  4  6  5  2  5  5
## 62366  4  3  6  6  6  5  6  5  1  3  1  1  3  5  6  1  6  4  2  1  5  1  5  1
## 62367  3  4  6  6  6  6  4  5  1  2  4  1  5  4  5  5  5  4  4  6  4  4  5  5
## 62368  1  6  1  6  5  4  1  2  5  6  1  1  5  5  6  2  4  6  6  5  6  1  6  6
## 62369  1  5  3  6  5  2  5  5  1  2  2  4  6  5  5  1  2  2  3  3  6  1  5  6
## 62370  1  6  6  4  5  4  5  2  3  6  3  4  4  6  4  2  4  4  2  5  5  1  4  5
## 62371  4  5  2  6  5  3  2  4  3  6  1  5  4  3  2  5  6  2  2  5  4  2  4  5
## 62375  1  6  5  3  6  5  6  6  1  2  4  4  4  6  5  4  4  3  2  1  6  1  5  6
## 62376 NA  5  4  3  4  4  3  3  3  4  4  2  4  4  4  3  3  4  3  2  5  2  4  4
## 62377  4  6  5  6  6  5  5  5  5  4  1  1  6  6  6  4  4  6  4  1  6  2  6  6
## 62380  1  6  5  2  2  4  1  5  6  6  6  6  3  2  1  4  5  5  5  2  5  6  5  6
## 62382  6  6  6  6  6  3  6  2  5  5  2  2  6  6  6  6  6  6  6  6  6  5  5  6
## 62384  1  4  2  5  3  5  5  5  3  4  4  5  3  3  2  2  2  3  4  5  4  2  4  5
## 62387  3  5  4  4  3  5  5  4  2  4  5  2  3  4  4  4  4  4  3  2  6  1  5  5
## 62390  1  6  6  6  6  6  5  4  1  1  1  1  6  6  6  1  1  1  1  1  6  1  6  6
## 62391  2  5  5  5  3  5  5  5  1  4  4  4  3  3  5  4  4  4  4  2  6  1  5  4
## 62394  1  5  3  5  4  5  4  3  1  4  3  2  4  5  5  3  4  2  3  2  5  4  4  5
## 62397  1  6  5  6  6  6  6  6  1  1  1  1  4  6  5  1  1  1  1  1  6  1  6  6
## 62401  1  5  5  6  4  5  5  4  1  1  3  3  3  4  5  2  2  2  2  4  5  1  5  5
## 62408  4  4  5  1  5  5  4  4  2  5  1  4  6  6  5  3  4  4  2  5  3  3  5  6
## 62412  2  3  4  1  2  3  5  3  1  1  6  6  1  2  3  1  1  2  2  2  5  2  3  5
## 62416  2  6  6  4  6  6  5  5  3  2  1  1  3  6  5  1  1  1  1  1  5  1  5  1
## 62419  4  6  6  6  5  4  5  6 NA  1  1  3  6  6  6  1  6  6  3  4  6  1  6  5
## 62421  4  4  4  4  5  5  5  4  2  3  4  2  4  4  5  2  4  5  4  5  4  1  4  5
## 62423  2  6  5  6  3  5  6  5  2  3  3  2  5  5  5  3  5  5  1  4  4  2  4  6
## 62426  2  4  4  6 NA  5  4  5  4  4  6  4  4  5  2  1  2  3  4  2  3  1  2  4
## 62433  5  6  6  5  6  5  6  2  2  4  3  4  5  5  5  3  3  2  4  3  6  4  5  6
## 62434  1  5  6  6  6  6  5  5  1  1  2  4  5  6  5  2  3  2  2  4  5  1  4  5
## 62435  2  5  5  4  6  5  5  5  2  2  5  4  5  4  5  1  1  1  1  3  5  4  4  4
## 62438  4  4  4 NA  5  4  4  4 NA  3  4  2  4 NA  5  4  4  4  4  4  5  4 NA  5
## 62440  1  6  5  5  6  3  4  5  5  6  4  5  6  6  4  4  4  4  6  4  6  1  6  6
## 62443  4  2  4  6  5  5  5  4  1  2  3  2  3  5  5  3  4  2  1  1  3  4  1  4
## 62444  2  5  5  4  4  2  3  3  4  3  1  6  4  3  6  4  5  4  4  2  6  2  5  6
## 62447  2  6  6  6  6  5  5  5  1  5  5  1  5  5  6  5  5  5  4  2  6  2  6  5
## 62448  1  6  2  6  5  5  5  5  4  2  2  6  1  4  5  4  2  1  2  3  6  5  3  6
## 62450  1  6  6  6  6  6  5  3  3  4  2  1  5  5  6  2  4  4  3  1  6  1  6  6
## 62453  2  5  5  6  4  4  5  4  2  3  2  3  4  4  5  3  3  1  1  2  5  1  4  4
## 62454  3  3  6  2  6  3  4  3  4  4  1  1  6  6  5  3  3  4  1  2 NA  4  6  5
## 62457  4  4 NA  3  4  5  3  4  3  3  2  2  3  3  5  3  3  2  2  2  5  2  3  4
## 62462  1  5  3  4  4  6  4  4  1  1  3  4  3  5  5  3  3  3  1  3  4  4  3  4
## 62463  2  6  5  4  5  5  2  5  3  2  2  4  4  6  4  5  5  4  4  5  2  4  4  5
## 62464  1  5  5  6  5  5  4  4  4  4  1  2  4  6  4  4  5  5  3  5  2  2  6  5
## 62467  3  4  3  5  5  3  2  2  3  2  4  2  3  4  3  2  3  2  3  1  5  3  4  4
## 62468  1  6  6  5  2  4  2  2  5  4  6  1  5  6  1  3  5  4  4  2  6  1  4  6
## 62469  3  5  5  4  4  5  5  6  1  1  2  1  4  5  5  4  4  2  1  2  5  1  5  5
## 62470  2  6  5  5  6  5  4  2  2  4  2  4  5  5  3  1 NA  1  1  2  4  2  4  5
## 62474  4  5  5  4  5  2  6  6  1  1  6  1  5  5  5  4  5  3  4  5  6  1  6  5
## 62476  4  3  2  5  3  4  2  4  4  5  5  4  4  4  2  5  4  5  5  3  6  1  6  6
## 62479  1  4  6  5  6  5  6  5  1  1  2  2  6  6  4  4  4  2  1  1  5  1  6  5
## 62480  1  5  6  6  3  5  5  4  2  4  1  3  4  5  5  5  5  4  5  5  5  2  5  6
## 62481  3  4  4  5  4  5  5  6  1  2  3  3  2  4  5  4  4  4  2  1  5  3  2  3
## 62486  3  4  5  2  3  5  3  4  1  1  6  5  2  1  3  3  3  2  3  2  5  5  2  2
## 62489  1  6  5  6  5  4  4  5  2  5  3  2  5  5  4  1  1  1  1  1  6  1  4  5
## 62491  3  6  6  6  4  5  2  5  4  3  4  2  3  4  5  4  4  6  5  4  3  6  1  5
## 62493  1  6  3  5  3  2  3  2  3  4  4  2  3  3  4  4  6  6  6  6  6  1  4  6
## 62494  1  2  1  4  2  6  5  5  1  1  6  6  4  1  3  2  5  1  5  5  6  1  5  6
## 62496  3  5  5  6  3  5  2  4  1  5  1  1  3  3  5  5  5  2  2  2  6  1  6  4
## 62497  4  6  5  6  6  5  3  2  3  5  1  2  3  4  5  4  4  5  1  5  6  3  4  4
## 62498  1  5  6  6  6  1  5  6  4  1  6  6  3  2  5  4  1  2  6  6  6  5  2  6
## 62499  3  5  5  6  5  5  4  5  2  3  2  4  4  5  4  4  5  5  5  4  5  2  3  5
## 62500  3  6  5  6  6  5  6  5  1  3  1  2  5  6  6  2  4  3  2  2  5  3  5  4
## 62502  1  6  6  6  6  1  5  6  1  1  1  6  5  5  1  1  3  1  2  1  6  1  5  6
## 62505  1  6  4  6  6  5  6  4  3  4  3  2  5  6  2  5  6  6  6  6  6  6  6  6
## 62508  3  6  5  6  5  5  6  6  1  2  1  2  5  6  6  5  2  1 NA  4  4  5  6  5
## 62509  1  6  6  5  6  6  5  6  2  2  5  4  5  3  3  1  5  5  5  6  6  5  3  6
## 62512  5 NA  5  6  5  6  6  5 NA  2  5  2  6  3  6  4 NA NA  4  1  6  1  3  2
## 62514  5 NA  5  6  5  6  6  5  1  2  5  2  6  3  6  4  3  2  4  1  6  1  3  2
## 62518  2  6  6  6  6  6  6  5  1  1  1  1  6  5  6  1  1  2  2  1  6  1  6  5
## 62520 NA  6  6  6  6  4  5  4  1  1  4  1  6  6  6  1  3  3  2 NA  6  1  3  4
## 62522  1  6  6  6  6  6  5  4  2  3  1  1  6  6  5  1  2  2  1  2  5  1  6  5
## 62526  2  6  5  6  5  5  4  1  3  1  4  1  6  6  5  5  5  5  5  5  4  1  6  5
## 62527  2  5  2  4  2  2  3  2  3  5  5  5  4  2  5  3  4  4  4  4  5  3  5  5
## 62528  2  5  2  5  5  5  6  5  1  3  2  2  5  2  4  2  5  3  5  2  5  2  5  6
## 62529  2  5  2  5  5  5  6  5  1  3  2  2  5  2  4  1  4  2  5  2  5  2  5  6
## 62530  2  5  2  5  5  5  6  5  1  3  2  2  5  2  4  1  4  3  4  2  5  2  5  6
## 62531  2  5  2  5  5  5  6  5  1  3  2  2  5  2  4  1  5  4  4  2  5  2  5  6
## 62532  2  5  5  5  5  5  6  4  2  4  2  2  4  2  4  1  5  4  4  2  5  2  5  6
## 62533  2  5  5  5  5  5  6  4  2  4  2  2  4  3  5  1  5  4  4  2  5  2  5  6
## 62535  2  5  5  5  5  5  6  4  2  4  2  2  4  3  5  1  5  4  4  2  5  3  5  6
## 62537  2  5  2  6  5  2  2  2  4  5  2  1  4  5  2  2  2  2  2  1  6  5  2  3
## 62538  4  5  6  6  3  6  6  6  1  1  2  4  4  5  6  6  6  6  3  2  6  1  6  6
## 62541  2  6  6  6  5  6  5  6  4  4  4  1  4  6  5  1  1  1  5  1  6  1  6  6
## 62542  5  4  5  6  4  6  5  6  1  3  5  5  5  5  6  6  6  4  6  5  5  6  4  6
## 62543  2  5  6  5  5  4  5  5  1 NA  6  5  3  2  5  4  4  1  1  1  6  1  4  6
## 62545  1  4  4  5  4  2  5  2  4  3  6  5  3  5  5  6  6  6  5  6  3  6  4  5
## 62546  4  4  4  5  5  4  4  4  2  4  4  5  4  5  5  4  4  5  3  2  4  5  5  4
## 62547  1  6  6  6  5  6  5  6  5  4  5  1  5  6  5  1  1  2  5  1  6  4  6  6
## 62548  2  6  6  5  4  4  3  5  1  2  5  2  4  2  5  1  1  1  5  1  5  6  2  5
## 62550  2  5  6  6  5  4  4  4  2  4  3  3  5  5  5  2  3  2  2  1  4  2  5  5
## 62551  5  4  2  2  1  4  4  3  6  6  4  1  4  2  6  6  6  6  6  6  6  3  1  6
## 62552  6  1  1  4  1  6  6  6  1  1  6  6  1  1  2  1  1  1  1  1  6  5  6  6
## 62553  1  6  6  6  5  6  6  6  1  1  2  3  6  5  6  3  3  3  1  2  6  1  6  5
## 62555  4  4  3  4  2  3  4  4  5  5  6  5  2  2  2  5  4  4  5  5  5  5  4  4
## 62556  4  5  5  5  4  5  5  4  3  3  3  2  5  5  6  4  2  3  1  3  4  1  5 NA
## 62557  3  6  6  6  5  5  5  5  1  2  1  1  5  5  6  4  4  3  2  1  6  1  5  5
## 62559  5  6  5  6  5  5  5  5  4  3  3  2  5  6  5  2  3  2  5  4  6  1  5  2
## 62561  1  6  5  6  5  6  4  5  1  1  1  1  5  5  6  4  5  4  1  5  5  6  5  5
## 62562  2  5  4  6  5  3  5  5  1  2  4  3  2  5  6  2  2  1  1  2  5  2  4  3
## 62565  1  6  6  6  6  1  6  6  1  1  1  1  6  6  6  1  4  5  1  1  6  1  6  6
## 62567  2  5  6  5  4  6  6  4  1  5  1  2  4  5  5  5  5  5  2  2  6  1  6  6
## 62570  2  2  2  1  3  3  4  2  5  5  5  6  2  1  1  2  3  1  2  5  6  2  6  6
## 62573  5  4  4  4  3  6  6  6  1  6  3  2  4  4  5  6  6  4  4  3  6  3  5  4
## 62574  2  5  4  4  6  4  3  3  2  4  3  2  4  5  3  1  1  2  4  2  3  4  5  5
## 62577  2  5  5  5  5  2  1  2  5  4  5  5  5  4  2  5  5  5  6  4  5  6  4  6
## 62578  1  5  6  6  5  5  5  6  1  3  3  3  5  6  5  1  2  1  2  2  6  2  5  6
## 62582  3  6  5  6  6  5  3  3  2  2  1  3  6  4  6  5  6  4  5  5  6  1  5  6
## 62589  1  5  1  5  5  5  4  3  2  2  2  4  3  5  4  1  3  5  2  4  4  2  4  5
## 62590  1  5  6  5  5  5  4  4  1  4  1  2  3  6  4  1  1  1  1  2  4  1  4  5
## 62594  2  6 NA  5  5  6  5  6  2  3  1  1  6  6  6  2  3  4  1  2  6  6  5  4
## 62597  2  5  5  5  4  6  2  4  2  5  1  2  5  5  5  4  5  5  5  4  6  2  5  6
## 62599  1  5  5  6  6  6  1  5  3  1  6  6  1  5  1  4  5  5  6  1  6  5  1  6
## 62604  1  5  6  6  6  6  5  6  1  2  1  1  5  6 NA  2  4  2  3  5  6  4  6  6
## 62605  3  5  5  6  5  5  5  3  4  1  4  3  4  4  5  5  6  6  2  2  5  2  5  6
## 62606  2  6  6  6  6  5  5  3  1  1  1  4  5  6  4  1  1  1  1  1  5  1  5  3
## 62610  1  6  5  6  6  5  6  5  1  1  3  4  3  6  4  3  4  4  3  5  3  3  4  5
## 62611  2  2  4  3  2  4  3  4  3  4  4  2  1  5  4  4  4  4  5  1  3  2  2  4
## 62612  2  4  4  3  3  4  2  4  4  2  5  3  3  4  4  2  3  3  3  3  4  2  3  3
## 62613  4  2  1  3  1  3  1  2  4  2  3  4  1  3  2  4  5  4  3  3  2  4  2  6
## 62615  6  5  5  6  6  3  1  4  5  2  3  1  6  5  3  1  1  4  3  1  6  6  6  6
## 62617  2  6  6  6  6  6  6  6  1  1  3  6  6  1  6  4  4  1  1  3  6  1  6  2
## 62618  2  5  6  5  4  4  3  4  5  4  1  2  4  6  5  6  6  6  3  2  4  3  2  3
## 62622  1  6  6  6  6  6  6  5  1  4  1  1  6  6  6  4  6  5  2  4  6  5  6  6
## 62623  1  6  2  6  6  5  4  2  1  2  1  1  5  6  5  5  4  4  4  5  6  1  6  5
## 62625  1  6  6  6  6  6  5  5  1  2  2  1  5  5  6  2  4  2  2  4  6  2  6  6
## 62627  1  3  2  6  3  5  5  5  2  4  5  6  1  3  3  3  4  1  4  1  2  6  1  5
## 62635  3  5  2  5  5  4  4 NA  4  5  4  2  5  3  4  2  4  5  4  4  4  3  5  5
## 62638  2  6  6  2  6  6  3  5  1  2  1  1  5  5  6  1  2  2  1  1  5  1  6  4
## 62640  1  5  6  6  6  6  5  5  5  1  6  5  5  5  2  1  1  4  1  5  6  6  6  6
## 62642  2  5  5  6  5  6  5  5  3  3  2  3  4  5  5  1  2  2  2  2  6  5  5  4
## 62643  1  4  4  6  4  3  4  2  2  2  2  4  4  4  4  4  4  5  4  4  3  4  3  5
## 62644  2  6  5  6  4  5  6  5  1  2  1  4  5  5  5  4  4  5  5  6  4  1  6  6
## 62645  1  5  5  6  5  5  5  5  1  3  6  4  2  5  5  2  2  4  2  2  5  2  5  3
## 62646  1  6  6  3  6  3  4  6  5  2  6  1  6  6  6  2  5  2  3  4  4  2  6  3
## 62647  4  5  5  6  5  5  5  5  2  2  4  2  2  6  2  1  2  5  2  4  2  6  3  3
## 62648  1  6  5  5  2  1  4  6  4 NA  3  1  1  3  5  4  4  4  1  4  6  2  4  3
## 62650  2  5  1  6  6  6  6  5  1  1  2  1  6  5  6  2  4  2  2  5  6  1  5  4
## 62652  1  6  5  3  4  4  3  3  1  1  6  3  3  3  5  1  3 NA  5  3  6  3  3  3
## 62653  4  3  5  5  5  4  6  5  2  3  4  1  5  6  6  5  6  5  4  2  6  6  5  5
## 62654  4  4  5  6  5  5  6  6  1  2  3  4  5  6  6  3  3  1  4  1  5  1  5  5
## 62657  2  6  4  2  5  6  3  5  2  1  3  2  4  5  5  3  5  3  1  1  5  2  4  4
## 62662  4  5  4  5  4  5  4  4  5  5  1  4  6  5  6  6  6  6  5  5  5  2  5  5
## 62664  1  5  6  5  6  6  5  5  1  2  2  1  5  1  5  4  5  4  5  4  5  4  4  6
## 62665  3  6  6  6  6  4  5  3  1  1  1  1  5  6  3  1  1  1  2  1  5  3  5  1
## 62667  1  6  6  6  6  5  6  5  1  1  5  2  6  6  6  1  1  1  2  2  5  6  6  6
## 62668  5  6  5  4  5  1  6  5  3  4  4  1  6  5  6  4  4  4  4 NA  6  4  5  6
## 62669  5  6  6  5  6  5  4  6  2  4  3  3  4  4  5  5  4  4  3  2  5  2  5  4
## 62670  2  4  2  6  4  5  5  5  2  2  3  3  5  5  5  3  4  4  2  3  5  2  4  4
## 62673  2  6  5  5  4  5  5  5 NA  2  1  4  4  6  5  1  4  5  2  6  4  4  4  5
## 62675  1  6  5  5  6  6  6  4  1  2  2  4  4  5  5  3  3  4  3  4  5  4  4  5
## 62677  1  6  6  6  6  1  4  4  4  1  5  1  6  6  6  6  4  6  5  5  6  6  6  3
## 62679  2  4  6  5  6  5  4  4  1  2  4  3  6  5  4  2  5  4  3  4  5  1  5  6
## 62681  1  5  6  6  5  5  4  4  1  2  1  4  4  4  5  4  4  4  2  1  2  6  4  5
## 62682  3  5  5  6  5  3  6  3  3  1  4  2  4  5  6  3  3  4  2  4  5  3  5  4
## 62683  6  1  6  6  6  6  5  6  1  1  4  1  6  6  6  1  1  1  1  1  6  4  5  5
## 62684  2  5  4  6  4  5  5  5  1  2  1  1  5  6  6  5  4  6  3  4  5  1  4  6
## 62685  3  2  4  6  6  6  2  5  1  2  3  2  5  6  4  1  1  2  3  1  6  2  6  5
## 62686  2  4  4  6  4  6  5  3  2  2  5  5  2  3  4  3  3  2  4  2  3  5  5  5
## 62687  2  4  6  5  5  2  6  5  3  2  4  2  4  5  6  4  4  4  4  2  5  2  5  5
## 62688  1  6  5  6  4  6  6  5  1  2  1  5  2  5  6  5  6  4  4  3  4  5  5  5
## 62690  1  5  4  6  4  4  6  5  4  1  6  4  5  4  6  4  6  5  4  4  5  1  5  4
## 62692  1  6  6  6  6  6  6  5  1  1  1  1  5  6  6  1  2  1  1  1  6  1  6  5
## 62694  3  5  5  6  5  6  6  5  1  1  3  2  6  6  6  4  4  4  2  1  6  4  5  2
## 62698  4  6  6  6  5  4  3  4  4  3  2  4  4  5  4  4  5  5  3  2  4  5  4  6
## 62700  1  4  4  4  6  4  4  6  3  3  4  2  4  6  2  2  3  2  1  1  6  2  5  4
## 62703  2  5  5  4  6  4  3  5  2  3  3  2  5 NA  3  1  2  1  3  2  4  4  5  4
## 62706  1  6  5  6  5  4  5  6  1  1  1  1  5  5  6  5  5  6  1  5  3  6  5  6
## 62707  2  4  2  6  5  3  5  4  2  2 NA  4  3  4  4  4  4  4  5  6  5  4  3  4
## 62708  6  6  6  6  6  5  6  6  1  1  1  1  6  6  6  6  6  6  1  6  6  6  6  6
## 62710  1  6  4  3  5  5  4  4  3  4  1  2  4  5  3  3  3  4  3  2  5  2  4  6
## 62712  1  6  5  5  6  6  5  5  1  3  1  1  5  6  6  1  2  1  1  1  6  1  6  6
## 62715  2  4  5  6  5  5  5  5  2  4  3  4  4  5  1  2  4  3  5  4  4  5  4  4
## 62716  4  5  4  5  4  3  1  1  3  6  2  3  4  5  3  2  4  3 NA  1  6  2  5  4
## 62717  1  5  5  6  4  5  4  5  4  2  4  4  4  5  3  3  4  4  3  4  5  2  4  6
## 62718  3  4  4  5  5  5  4  3  3  4  2  2  5  6  4  5  5  6  4  4  4  2  4  4
## 62719  1  4  6  5  6  5  2  6  1  1  1  3  5  1  5  6  6  6  6  6  4  1  5  6
## 62720  2  5  5  6  5  1  5  2  1  2  1  5  5  5  3  3  5  1  1  3  3  1  3  4
## 62722  1  5  4  1  5  5  4  5  2  5  6  6  3  1  2  4  4  6  6  5  5  2  5  6
## 62726  1  5  6  6  5  2  5  4  2  1  1  1  4  6  4  3  4  1  1  1  5  6  4  2
## 62728  3  4 NA  5  3  5  5  4  2  5  3  5  1  2  3  2  5  3  3  2  4  2  6  5
## 62729  5  4  3  4  3  3  2  3  4  4  3  3  5  4  3  5  5  4  5  4  5  1  5  6
## 62731  5  4  4  4  2  5  2  2  4  2  3  4 NA  4  3  4  4  5  5  2  2  2  2  5
## 62740  3  5  5  5  5  5  4  3  2  4  2  2  4  4  4  5  6  4  3  4  5  4  4  5
## 62741  3  4  4  6  5  5  4  5  2  1  5  3  4  4  4  2  3  3  2  2  4  4  4  5
## 62744  4  5  4  5  2  5  5  5  3  2  3  2  6  2  6  5  5  5  3  5  6  3  6  6
## 62745  1  6  6  6  5  2  5  6  4  6  6  5  5  5  6  4  5  4  4  6  2  6  4  6
## 62749  1  6  4  6  5  2  5  6  1  2  1  3  4  3  5  2  2  1  6  4  4  1  4  5
## 62750  2  4  4  6  5  5  2  5  1  2  2  2  3  5  4  2  5  2  2  1  4  3  4  4
## 62751  2  4  5  3  5  4  4  5  4  5  5  6  3  4  3  3  4  4  4  3  5  5  4  6
## 62757  5  4  4  6  4  5  5  5  2  2  4  2  3  5  5  4  4 NA  4  2  5  5  3  5
## 62758  2  5  4  4  4  2  2  4  2  5  1  1  5  6  5  3  3  1  1  1  5  1  4  4
## 62761  1  6  5  4  5  6  5  6  1  2  1  1  5  5  5  1  1  2  2  3  5  2  5  6
## 62764  4  3  5  6  5  4  5  5  1  2  3  4  4  6  5  5  6  6  3  4  6  3  4  5
## 62765  1  6  6  6  1  1  4  6  1  1  4  1  3  3  2  1  1  1  1  1  1  1  2  5
## 62766  4  5  4  2  2  5  3  3  3  5  5  6  3  5  3  6  6  5  6  3  6  6  5  6
## 62767  4  5  4  6  4  1  1  2  4  5  1  1  3  4  6  6  4  1  1  1  6  5  1  6
## 62768  1  6  6  6  6  6  6  5  1  2  1  1  6  5  5  1  2  1  1  4  5  4  4  5
## 62770  3  6  6  6  5  2  5  5  2  2  3  4  4  5  4  3  4  4  5  6  2  5  4  5
## 62772  1  5  5  6  5  4  5  4  4  4  2  1  5  6  5  2  2  4  4  3  5  5  4  6
## 62776  2  5  3  2  4  2  2  4  4  4  3  3  6  5  4  5  6  4  5  4  6  6  5  6
## 62778  1  6  6  5  6 NA  5  5  1  1  2  1  6  5  6  1  5  1  1  3  6  3  5  2
## 62779  1  4  5  4  5  3  5  4  2  4  4  3  4  4  4  2  3  1  4  3  4  4  4  5
## 62780  1  6  6  6  5  6  6  6  1  2  3  3  5  6  6  1  3  4  2  3  6  1  6  6
## 62781  2  5  4  6  4  6  5  4  2  1  3  2  3  4  5  2  3  1  1  1  5  5  4  4
## 62783  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5
## 62785  3  6  5  6  5  5  6  5  1  4  2  2  4  6  5  4  4  4  3  3  6  1  5  4
## 62786  1  5  6  6  6  6  6  5  1  4  3  2  6  5  6  4  4  5  3  1  6  1  6  5
## 62787  1  1  5  6  3  5  3  1  2  5  4  3  1  5  4  3  3  3  3  2  5  5  2  6
## 62788  1  6  6  6  6  6  6  5  2  3  1  2  6  5  5  2  5  5  5  4  5  3  4  6
## 62789  1  6  4  6  6  4  4  3  5  2  1  1  3  6  4  1  2  2  2  1  5  1  5  5
## 62790  1  5  5  6  6  6  5  6  1  1  3  1  6  6  5  4  4  4  3  1  6  1  5  1
## 62792  5  4  4  5  5  4  3  4  4  3  3  1  2  3  5  5  5  3  1  1  4  6  4  5
## 62795  2  5  2  5  4  5  4  1  5  5  2  5  1  6  5  4  4  2  4  5  2  6  1  6
## 62796  1  5  5  5  5  2  4  4  6  5  4  6  3  5  1  4  5  4  4  4  5  6  2  5
## 62797  1  6  6  6  6  3  4  1  1  4  1  1  6  6  6  1  1  2  1  1  5  6  3  4
## 62800  3  5  6  6  4  3  5  3  1  1  1  1  5  5  6  4  6  6  5  3  6  1  5  6
## 62801  6  6  6  6  6  5  6  5  1  1  5  5  4  2  5  2  3  1  3  5  5  5  4  5
## 62803  1  6  5  5  5  4  4  4  4  2  2  3  3  5  2  1  1  2  2  5  3  2  4  5
## 62804  3  6  1  5  6  6  3  3  2  4  1  1  5  6  6  3  5  2  3  2  6  3  6  6
## 62805  1  6  5  6  5  4  5  5  2  4  2  3  5  5  4  4  5  5  4  3  5  1  5  6
## 62809  3  2  3  4  2 NA  3  2  2  3  6  6  2  5  3  6  5  5  2  5  3  6  1  1
## 62810  1  5  5  5  6  6  6  6  1  1  1  2  5  6  6  1  1  1  1  1  6  6  5  4
## 62816  2  6  6  5  3  6  5  6  1  6  1  5  4  4  6  6  6  6  6  6  2  1  3  6
## 62817  4  5  5  6  6  3  5  6  5  3  6  6  5  6  5  5  3  2  1  5  5  6  4  1
## 62819  1  4  6  6  6  3  4  2  2  5  4  3  4  4  4  2  2  2  3  1  4  3  5  6
## 62821  3  6  6  6  5  6  5  6  1  2  3  1  5  6  5  1  3  2  1  1  5  1  5  6
## 62822  1  5  5  6  4  4  4  4  3  2  1  2  4  5  4  3  3  3  1  2  4  2  4  4
## 62825  2  5  2  1  3  4  2  4  4  5  4  4  2  4  3  3  5  5  4  1  5  2  3  3
## 62826  2  5  4  6  5  4  5  4  3  4  1  3  4  5  5  5  5  4  3  3  4  4  4  4
## 62827  4  5  5  6  5  4  6  6  4  4  1  5  4  4  5  3  5  4  4  4  5  4  5  4
## 62828  2  6  5  6  6  6  6  5  4  2  1  2  5  6  5  3  5  1  4  3  6  4  5  5
## 62831  6  2  5  6  2  6  5  3  5  3  5  2  4  5  6  6  6  6  5  6  5  5  4  4
## 62832  1  5  5  6  5  5  5  5  3  3  2  1  5  6  6  3  3  1  2  1  6  5  2  6
## 62834  1  6  4  4  4  4  4  6  2  2  6  6  5  5  6  2  4  4  1  2  6  4  5  6
## 62835  1  5  4  5  5  4  4  3 NA  4  3  2  4  5  4  4  5  5  6  5  5  6  3  6
## 62837  2  5  6  5  4  1  5  6  1  4  4  1  5  4  6  4  4  4  4  1  6  1  5  6
## 62839  4  6  6  2  5  5  5  5  2  1  5  2  6  6  6  2  6  6  3  2  6  6  5  4
## 62840  1  5  5  6  5  4  4  4  1  2  4  2  5  6  5  3  3  2  1  2  6  1  5  5
## 62844  1  6  5  6  4  5  5  5  2  2  2  2  3  6  3  5  5  5  1  4  4  6  5  5
## 62846  5  6  2  6  5  4  5  4  2  4  5  2  3  5  4  1  3  1  2  3  6  2  2  1
## 62847 NA  6  6 NA  6  6  6  5  1  1  1  1  5  6  6  1  1  2  1  4  5  1  6  2
## 62849  2  6  5  6  5  4  6  5  1  2  4  4  5  5  6  2  2  4  2  1  5  1  3  5
## 62851  3  6  6  6  3  6  4  6  4  2  1  1  5  6  6  2  3  2  1  2  6  6  5  1
## 62853  1  6  6  6  6  5  6  6  2  4  6  4  5  5  5  2  1  1  2  4  6  1  4  6
## 62856  2  5  5  6  6  4  5  5  1  2  1  2  4  6  5  1  1  1  1  2  6  4  4  1
## 62857  3  4  4  6  4  4  4  3  4  4  1  5  4  3  3  5  5  4  3  3  4  5  4  4
## 62858  4  6  5  6  6  5  5  5  2  2  1  1  4  6  6  2  3  2  2  2  5  4  4  5
## 62861  2  6  4  6  5  4  4  2  4  4  2  2  6  6  5  1  2  5  4  2  5  2  6  6
## 62863  1  6  5  6  6  3  2  5  2 NA  1  1  4  6  6  3  3  3  3  2  6  2  4  6
## 62864  3  4  2  4  4  5  1  4  2  1  1  4  3  3  4  6  6  6  2  1  3  6  1  5
## 62867  1  6  6  4  5  4  3  4  4  4  3  6  6  3  6  1  3  1  3  1  5  3  6  4
## 62869  1  5  6  6  5  4  4  4  2  5  3  5  1  2  4  2  4  4  6  4  4  4  3  4
## 62870  1  6  6  6  6  2 NA  6  1 NA  6  5  6  6  6  4  1  6  4  5  6  1  5  5
## 62872  1  6  6  6  6  2  5  6  1 NA  6  5  6  6  6  4  1  6  4  5  6  1  5  5
## 62874  1  6  6  6  6  5  6  6  1  1  1  1  6  6  6  1  1  1  1  2  5  2  3  4
## 62876  1  5  4  5  4  4  2  3 NA  3  3  4  3  1  4  3  4  4  4  4  4  4 NA  5
## 62877  2  6  6  6  6  5  4  5  1  4  6  4  6  5  4  3  3  2  5  3 NA  1  5  6
## 62878  2  5  5  6  6  2  6  4  1  3  5  4  6  4  5  1  1  1  1  5  6  4  6  4
## 62879  1  6  6  6  6  6  6  5  2  1  5  6  6  5  6  1  2  1  2  1  6  1  6  6
## 62881  2  6  6  6  5  6  5  6  1  1  4  5  4  5  6  3  5  5  4  3  6  1  4  5
## 62883  3  4  4  4  4  4  4  4  2  4  5  3  4  4  4  2  2  3  5  2  5  2  4  5
## 62887  1  4  1  4  5  6  6  5  1  1  2  2  4  6  6 NA  5 NA  2  4  4  4  4  5
## 62889  2  5  5  4  3  4  2  5  4  3  3  3  4  4  5  4  5  4  3  5  5  1  4  4
## 62890  1  6  6  4  4  5  4  5  4  5  2  4  4  4  5  4  5  4  2  5  6  1  5  5
## 62891  2  5  6  4  6  6  6  6  1  2  4  3  5  4  6  2  3  3  2  2  6  1  6  6
## 62897  2  6  5  6  3  4  5  5  1  1  3  6  4  3  6  5  6  2  2  4  6  2  4  4
## 62898  4  6  6  5  6  6  6  6  1  1  1  1  6  6  6  4  2  1  1  2  6  4  6  6
## 62899  2  1  6  6  6  5  6  5  1  1  5  5  6  5  5  3  4  1  5  6  4  2 NA  2
## 62901  2  5  4  4  2  4  3  5  4  3  4  4  3  3  3  5  5  6  6  5  4  2  2  5
## 62903  2  5  5  5  1  5  5  2  4  2  2  2 NA  5  5  1  1  1  1  1  5  1  4  4
## 62908  3  5  3  6  1  4  3  3  5  5  3  6  1  2  2  6  6  6  5  6  3  6  1  6
## 62910  3  5  5  6  5  5  5  5  2  2  2  2  4  5  4  2  2  2  2  4  4  2  4  5
## 62911  4  4  4  4  4  5  4  4  1  2  4  3  3  4  5  4  5  3  4  3  3  5  4  3
## 62916  2  6  6  6  5  2  1  4  4  1  2  2  5  6  4  4  3  2  1  2  6  1  5  6
## 62918  4  3  1  3  3  6  4  4  2  2  3  4  3  4  5  5  5  6  6  6  5  5  4  6
## 62920  2  6  6  6  6  5  5  5  2  3  5  5  5  5  4  1  5  4  6  6  6  2  6  6
## 62922  3  6  4  6  5  5  5  5  2  4  5  2  4  5  5  1  1  2  2  5  4  4  5  4
## 62926  1  3  2  3  2  5  5  2  4  5  5  5  3  2  3  4  4  5  6  2  6  2  5  6
## 62931  1  6  6  4  6  5  5  6  1  2  5  2  4  5  3  4  3  5  4  6  5  1  3  5
## 62933  1  5  4  5  5  1  6  4  1  1  4  4  1  5  5  1  2  1  3  4  3  3  3  1
## 62934  4  4  2  4  4  4  4  4  3  4  3  5  2  2  4  2  3  3  4  4  2  2  4  4
## 62936  1  4  4  5  5  3  1  2  2  2  4  5  2  3  5  2 NA  1  4  1  2  4  4  5
## 62938  2  5  5  6  5  6  5  4  2  2  1  1  6  6  6  2  2  2  2  1  6  2  6  4
## 62939  3  5  5  5  4  4  4  4  3  3  4  2  4  4  5  3  3  3  2  2  5  2  5  5
## 62941  2  5  4  5  5  4  4  4  3  3  4  3  3  4  5  3  4  2  3  3  5  2  5  5
## 62942  1  5  5  6  6  5  6  4  2  2  5  4  5  5  5  4  4  2  5  4  4  1  3  4
## 62948  4  6  6  6  6  4  3  1  3  2  1  4  4  6  5  3  6  6  2  1  5  4  3  5
## 62949  3  4  6  3  3  6  4  4  2  3  1  2  6  6  6 NA  6  4  2  3  6  3  6  4
## 62950  1  6  6  6  6  6  5  4  1  1  5  3  4  5  6  3  5  2  2  2  1  2  5  3
## 62951  1  4  5  5  5  4  2  4  2  4  4  2  2  5  3  2  2  2  2  1  5  1  5  6
## 62953  1  6  6  6  5  6  5  5  1  2  5  5  4  5  2  2  3  5  2  2  6  2  5  4
## 62954  2  4  4  5  2  5  5  1  1  6  3  4  3  2  1  2  2  4  6  4  2  2  6  5
## 62957  2  5  2  6  4  6  5  4  1  2  2  2  5  5  5  1  1  1  1  1  5  1  3  5
## 62962  1  5  6  6  5  4  2  4  1  1  2  2  5  6  5  1  2  1  1  2  4  4  6  4
## 62965  2  4  2  5  4  5  5  4  4  6  5  5  2  2  4  4  5  5  6  4  6  1  6  6
## 62968  4  4  4  6  2  2  4  4  3  4  5  4  2  4  4  2  3  4  5  3  4  2  5  5
## 62969  1  5  6  6  6  6  5  5  1  5  1  6  6  6  5  4  5  5  1  1  4  1  6  3
## 62971  3  5  5  6  6  5  5  5  2  2  1  2  5  6  6  6  6  5  5  5  6  6 NA  6
## 62974  5  6  6  6  6  5  5  4  1  1  5  1  5  6  3  1  1  3  1  1  5  1  6  4
## 62976  1  6  6  6  6  6  5  5  3  1  5  4  4  4  5  1  1  2  4  2  6  2  4  6
## 62983  1  5  5  6  6  5  3  4  2  3  3  5  4  5  4  4  5  3  2  5  4  2  5  6
## 62984  1  6  5  6  4  4  2  4  5  3  1  6  4  4  1  4  5  4  4  1  1  1  2  5
## 62989  3  6  5  6  5  3  5  5  1  1  3  1  3  4  4  3  3  2  3  4  4  4  4  4
## 62990  6  1  1  1  1  6  6  6  1  1  6  6  1  1  6  6  6  6  6  1  6  1  6  6
## 62991  5  5  4  5  5  5  5  5  3  1  4  5  4  4  5  4  4  4  4  4  4  5  4  4
## 62994  1  6  5  2  5  5  5  3  3  5  1  1  4  6  4  5  5  6  5  5  4  2  4  3
## 62995  6  1  1  2  3  2  4  2  4  4  3  5  4  3  4  5  6  4  4  4  5  1  4  4
## 62996  2  5  5  5  4  4  5  5  2  1  1  1  3  5  4  1  2  2  4  1  3  2  4  5
## 62997  2 NA  5  3  6  2  1  5  2  6  1  1  5  6  6  6  6  5  5  3  4  6  3  3
## 63004  5  5  5  6  3  4  5  5  2  2  4  6  4  5  4  5  5  5  4  4  5  4  1  2
## 63007  4  6  6  6  4  4  6  6  3  5  3  2  6  5  6  6  6  4  3  6  6  6  5  6
## 63013  2  5  4  4  4  3  4  3  4  5  2  4  4  4  4  5  5  2  4  6  4  5  3  4
## 63017  3  4  5  6  5  6  4  4  2  4  2  3  4  6  6  5  6  2  2  3  4  3  2  6
## 63018  2  6  6  6  6  5  5  5  2  4  2  4  5  6  5  4  5  2  2  1  5  1  5  6
## 63021  5  3  4  1  4  5  4  5  3  4  2  4  4  4  3 NA  5  3  4  3  6  1  5  6
## 63023  1  5  6  5  5  6  6  5  2  2  3  2  5  4  2  1  5  4  2  4  4  1  5  5
## 63026  2  6  3  6  5  6  6  6  1  1  4  2  1  2  2  4  5  4  5  4  4  2  4  5
## 63027  1  6  5  2  5  1  2  3  3  1  1  2  5  1  3  1  1  1  1  1  2  2  4  5
## 63030  1 NA NA NA  5  6 NA NA NA  2 NA  2 NA  6 NA NA  3  4 NA NA NA  2 NA  4
## 63034  4  6  6  6  6  4  6  5  3  3  5  5  6  6  5  1  4  6  4  3  6  5  6  5
## 63035 NA  6  3  5  4  5  5  5  1  2  2  4  3  5  4  3  4  6  6  5  5  2  3  6
## 63036  2  6  6 NA  6  4  3  4  1  1  3  1  4  5  5  1  2  1  2  1  6  1  4  6
## 63037  5  5  5  6  5  6  6  4  4  4  6  5  2  3  3  4  5  2  4  1  5  5  4  6
## 63038  1  5  4  2  5  5  5  4  2  4  5  2  5  5  5  2  1  5  5  1  6  1  5  6
## 63039  4  5  6  1  5  6  5  4  2  5  1  4  3  5  6  5  6  6  5  1  4  4  5  4
## 63040  4  4  5  4  4  4  4  3 NA  4  5  4  3  4  3  5  5  2  4  4  3  3  4  6
## 63042  2  6  6  5  5  4  4  3  4  3  1  1  6  6  6  4  4  3  1  4  5  1  6  6
## 63047  2  5  5  6  4  4  4  2  3  5  2  5  4  4  4  4  4  4  5  4  4  3  4  5
## 63048  1  6  6  6  6  5  5  2  4  5  2  3  6  5  5  5  6  6  6  5  4  5  6  6
## 63049  1  6  5  6  6  6  6  6  1  1  1  1  5  6  6  1  1  1  1  1  6  1  6  5
## 63050  3  4  6  4  5  5  4  3 NA  4  4  3  4  5  4  4  3  3  2  1  5  2  4  4
## 63051  2  6  6  6  6 NA  5  2  1  2  1  1  5  6  5  1  3  2  2  3  6  2  6  5
## 63054  2  5  5  6  5  4  5  5  2  5  2  2  5  5 NA  2  2  4  2  2  5  4  5  5
## 63055  3  6  6  6  5  5  6  6  2  1  5  4  5  5  6  5  6  6  2  5  5  2  5  6
## 63059  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  1  1  1  1  6  1  6  5
## 63062  3  4  4  4  4  5  3  4  3  5  4  4  2  3  4  5  6  6  4  5  4  2  3  5
## 63063  2  4  4  3  5  3  4  3  4  4  3  5  5  4  3  5  5  6  4  6  5  2  5  6
## 63069  2  6  6  6  5  6  6  5  3  3  4  5  4  4  4  3  5  3  3  3  4  2  5  6
## 63070  5  2  3  5  4  6  4  5  2  4  5  6  2  2  2  4  3  1  3  1  6  2  2  6
## 63071  1  6  6  6  6  6  5  6  1  1  2  3  3  6  5  2  2  2  1  1  5  1  4  6
## 63073  3  5  3  5  5  6  4  4  2  5  2  2  2  6  4  4  4  3  2  2  6  1  5  6
## 63075  1  6  5  6  5  6  5  5  4  2  4  5  4  5  5  3  3  5  4  6  4  5  6  5
## 63077  1  5  5  5  6  5  5  5  2  1  6  5  2  5  3  5  5  5  6  5  2  2  5  4
## 63081  3  4  5  6  5  4  6  4  1  1  2  2  5  5  6  3  3  3  2  1  6  3  5  4
## 63083  2  5  5  6  4  3  4  4  3  3  4  4  4  4  5  4  5  4  4  4  4  5  4  4
## 63084  1  6  6  4  5  5  4  5  2  1  2  2  5  6  5  1  4  3  4  1  4  1  5  5
## 63089  2  5  5  3  5  5  6  3  1  6  1  2  4  5  5  5  5  6  5  4  6  1  5  5
## 63090  5  6  6  4  5  5  5  4  2  3  3  2  5  6  4  1  2  2  2  2  6  1  3  5
## 63092  5  4  5  1  5  3  5  5  4  2  3  4  4  3  2  4  5  3  5  2  6  2  5  5
## 63094  3  5  2 NA  5  4  3  3  3  5  4  4  3  4  2  4  4  2  2  1  5  1  4  5
## 63096  1  6  5  6  5  4  5  5  1  2  1  2  4  5  4  1  2  2  1  2  5  1  4  5
## 63097  1  6  6  6  6  5  6  6  2  1  1  4  6  4  5  6  5  4  5  6  2  4  4  6
## 63099  1  5  6  6  1  3  5  5  2  2  2  1  4  6  4  1  1  2  3  3  5  3  4  2
## 63100  3  2  4  1  4  5  6  3  2  4  4  3  2  4  5  4  6  5  4  1  3  1  4  2
## 63102  1  6  4  5  4  5  5  5  1  4  3  3  5  5  5  3  4  2  2  2  4  6  4  5
## 63103  5  6  3  2  2  5  6  6  1  2  5  3  4  5  4  2  5  3  3  5  6  1  6  6
## 63104  4  4  3  3  3  3  3  3  3  4  3  4  3  6  3  3  3  4  3  3  3  3  3  3
## 63108  2  3  4  4  5  3  2  5  4  6  3  2  4  5  2  2  4  1  2  1  3  3  3  4
## 63109  2  6  4  2  5  5  5  5  1  1  5  2  6  4  6  3  3  1  1 NA  6  4  4  6
## 63112  2  4  4  3  5  3  2  3  4  4  4  2  5  5  5  1  1  2  2  1  4  1  3  6
## 63115  2  5  5  6  5  5  5  5  5  4  6  4  3  5  2  2  2  2  3  3  6  2  4  6
## 63116  5  6  6  6  6  4  5  5  2  1  1  1  5  6  5  1 NA  2  1  2  4  3  5  4
## 63120  2  5  5  3  2  5  4  6  1  4  3  6  2  1  5  6  6  6  3  2  5  1  4  3
## 63121  2  6  5  6  5  6  6  6  1  5  2  2  4  5  4  1  4  4  1  2  5  6  3  4
## 63122  2  4  4  4  5  3  4  3  3  4  4  4  3  4  4  3  3  3  4  2  5  2  4  5
## 63123  3  1  5  6  4  5  6  1  2  1  5  3  5  6  5  1  1  1  1  1  6  4  6  6
## 63125  2  4  2  2  3  5  5  5  2  2  4  5  2  3  2  4  5  3  4  4  5  3  4  4
## 63127  2  5  6  6  2  5  5  5  1  2  2  5  2  2  5  2  5  6  2  6  4  6  4  6
## 63128  2  6  6  6  5  5  5  6  2  2  1  2  5  6  4  2  4  4  2  4  5  2  5  4
## 63130  1  6  6  5  5  5  4  5  2  6  1  2  6  6  6  5  6  5  4  6  6  6  5  5
## 63131  1  6 NA  6  6  5  6  5 NA  1  1  3  6  5  5  1  1  5  1  1  5  1  4  5
## 63135  2  5  4  5  5  4  4  5  3  4  3  2  4  5  5  4  3  2  2  2  5  4  4  4
## 63136  2  6  5  5  2  4  6  5  2  4  2  6  4  3  5  2  4  5  4  2  4  4  5  5
## 63139  1  6  5  6  6  5  5  6  2  2  2  2  5  5  6  4  4  1  1  3  5  3  4  5
## 63141  1  6  6 NA  5  1  6  6  1  1  2  5  4  4  6  5  5  6  4  3  5  1  2  5
## 63142  2  5  5  5  5  3  4  5  2  4  2  2  6  6  6  3  2  3  2  2  5  4  5  6
## 63146  1  6  6  6  1  4  2  2  2  4  1  1  6  5  6  2  2  2  3  2  6  1  6  5
## 63147  1  5  4  5  5  6  5  6  1  1  2  1  5  6  5  3  3  4  2  3  5  1  5  5
## 63152  1  3  4  4  4  5  6  4  4  4  6  4  2  3  2  3  2  1  1  2  5  1  4  6
## 63154  2  6  5  6  4  5  5  6  2  3  1  2  5  6  5  3  5  2  2  2  5  4  5  3
## 63155  3  6  5  4  4  5  5  6  2  4  4  4  3  4  5  4  4  5  4  5  6  4  6  6
## 63158  1  1  5  6  6  6  5  2  1  5  4  5  2  5  3  3  4  4  2  3  6  1  6  6
## 63161  2  6  4  2  5 NA  3  3  1  1  5  4  6  3  5  1  1  1  4  1  6  1  5  4
## 63163  1  6  5  6  5  6  6  6  1  2  1  2  4  6  6  1  4  1  3  1  6  1  5  6
## 63165  1  5  5  6  5  3  4  3  2  2  2  3  3  5  3  3  3  3  3  2  4  2  2  5
## 63171  5  4  6  2  4  4  4  4  3  5  5  4  2  4  5  5  6  5  4  5  5  1  5  6
## 63172  5  6  6  6  6  6  5  5  1  1  2  3  5  6  6  2  5  4 NA  4  6  4  5  4
## 63173  3  5  5  3  4  4  4  6  2  4  1  3  5  5  6  3  5  4  5  3  6  2  4  6
## 63176  1  6  6  5  6  4  5  5  2  2  2  1  3  5  5  1  1  2  2  1  6  4  4  3
## 63181  3  4  5  6  2  3  5  4  2  3  3  2  3  5  4  2  3  2  2  5  2  2  3  2
## 63182  2  4  4  6  4  4  5  4  2  2  1  2  4  5  4  4  3  5  6  2  2  3  5  5
## 63183  3  4  4  6  5  3  3  2  3  4  1  1  3  6  4  2  2  1  1  1  4  3  4  3
## 63187  3  3  3  4  5  3  5  5  1  6  1  4  4  5  5  4  3  4  2  4  5  4  4  4
## 63192  2  5  4  4  3  4  3  4  3  4  3  4  3  3  3  4  4  4  4  2  4  3  3  5
## 63193  3  5  2  1  2  5  1  2  2  4  1  2  5  5  6  4  6  3  2  3  5  2  6  5
## 63194  4  6  4  2  4  4  4  4  4  4  4  2  3  5  3  4  5  2  2  2  5  1  4  5
## 63197  2  5  5  2  4  5  5  4  3  4  2  2  4  5  5  5  6  5  5  5  2  3  4  6
## 63200  3  6  6  3  4  3  4  6  2  1  6  3  1  4  4  2  1  2  6  6  6  2  6  2
## 63201  1  5  6  5  5  5  4  4  2  2  2  1  5  6  4  2  3  2  4  1  6  4  4  5
## 63203  2  4  5  1  5  4  2  2  4  3  2  5  4  4  4  3  4  3  3  4  5  5  3  4
## 63209  1  5  4  5  5  6  6  2  1  1 NA  6  2  5  5  4  4  5  6  6  4  2  3  6
## 63215  3  4  6  1  2  5  5  2  3  5  1  6  5  4  5  4  5  5  6  2  3  2  5  6
## 63222  3  4  2  3  4  4  5  3  3  5  2  4  5  5  5  4  4  4  5  2  5  2  5  6
## 63223  2  5  6  5  4  3  2  2  5  6  2  3  3  6  4  3  3  5  4  3  3  2  3  6
## 63225  2  5  6  2  4  6  6  6  1  4  3  2  2  5  3  2  4  1  5  5  3  4  2  6
## 63227  2  4  5  2  3  4  4  4  2  4  1  5  4  4  4  4  4  4  5  4  4  3  4  4
## 63228  1  5  5  5  5  3  4  3  4  4  1  4  5  4  6  3  3  3  2  4  5  1  4  6
## 63233  1  5  5  6  4  5  5  3  2  3  5  4  2  2  5  5  2  4  2  4  5  2  5  5
## 63237  2  6  6  6  6  5  5  5  3  4  2  1  5  6  6  2  5  3  2  1  5  2  5  5
## 63238  1  5  6  2  3  5  3  2  2  4  5  4  4  5  6  2  3  5  5  2  6  4  6  6
## 63239  3  6  6  6  6  6  5  6  2  1  1  1  6  6  5  2  2  3  2  2  6  1  5  6
## 63242  2  5  5  5  5  4  4  5  2  2  3  2  2  5  2  1  1  2  2  1  2  4  2  4
## 63245  1  6  6  6  5  5  6  6  4  3  4  4  5  5  5  4  2  2  3  4  6  4  6  6
## 63246  1  6  5  2  4  5  3  5  1  1  1  1  3  6  5  5  4  4  1  1  6  1  6  6
## 63250  2  5  5  4  5  5  4  4  2  5  2  4  5  5  3  3  3  3  2  3  4  1  4  3
## 63252  1  5  5  6  4  5  5  5  2  2  2  2  2  2  6  5  6  2  4  4  6  1  5  5
## 63253  2  6  3  3  3  2  2  4  3  4  4  6  3  2  3  5  5  5  5  4  3  2  4  6
## 63258  1  4  6  6  6  4  5  5  2  3  1  4  5  6 NA  3  3  2  1  1  4  3  6  5
## 63261  4  5  5  6  5  4  6  5  2  2  5  2  4  5  5  3  3  3  3  3  6  2  5  6
## 63264  3  4  4  2  4  2  2  4  5  6  2  2  4  5  5  6  6  5  5  4  4  4  4  5
## 63266  1  5  6  6  4  5  5  4  2  2  5  5  2  3  3  2  4  4  4  5  3  2  4  6
## 63271  3  3  4  2  3  3  3  3  3  4  3  4  4  4  2  3  3  2  3  3  3  4  3  4
## 63277  1  6  5  5  5  4  4  3  3  5  1  2  5  5  4  2  2  3  2  2  5  2  5  5
## 63278 NA  3  4  3  3  3  3  3  2  3  3  3  2  6  3  4  3 NA  3  2  4  4  2  4
## 63280  1  5  5  4  4  4  4  6  3  5  1  1  4  6  5  3  4  4  3  2  6  1  6  6
## 63281  1  5  4  5  5  5  5  5  3  3  2  4  6  2  4  4  3  5  2  5  4  2  6  5
## 63286  3  4  5  5  4  4  4  4  4  5  2  2  3  6  4  2  3  2  2  3  5  4  4  4
## 63287  5  6  6  5  5  5  5  6  1  1  6  1  5  5  6  1  1  1  1  1  6  1  6  5
## 63289  1  4  3  5  3  1  5  5  6  6  6  6  2  2  1  5  4  6  6  6  4  6  4  6
## 63292  4  3  4  4  3  5  4  5  3  3  2  2  4  5  5  4  4  4  3  2  4  3  5  4
## 63293  2  5  4  2  4  4  4  4  2  2  2  3  5  4  4  2  3  2  2  3  4  2  5  5
## 63294  5  3  4  4  5  4  3  2  4  4  1  1  3  6  4  4  4  2  2  3  3  2  5  3
## 63301  3  3  5  6  5  3  5  5  2  2  1  2  4  6  6  2  2  5  1  3  5  3  3  3
## 63302  1  5  5  2  5  5  5  3  2  4  5  4  4  4  5  2  4  2  3  1  5  2  2  5
## 63307  4  5  2  1  4  5  4  5  4  4  5  5  4  5  3  5  5  5  5  5  4  5  5  6
## 63309  1  5  1  5  6  3  5  5  4  1  1  4  4  5  5  2  5  1  1  1  6  1  6  6
## 63313  2  5  5  4  5  5  4  4  4  5  1  2  5  6  5  3  3  1  2  3  4  4  5  4
## 63317  1  6  6  6  6  4  4  4  2  3  1  5  6  5  5  5  6  6  4  5  5  2  5  6
## 63320  1  6  3  4  2  5  6  5  1  1  2  3  4  5  4  4  1  3  2  5  5  2  6  6
## 63321  3  5  6  6  5  4  4  3  3  3  2  3  5  6  4  1  4  3  2  2  3  5  4  5
## 63322  4  4  2  1  5  6  4  4  2  5  1  4  5  5  4  2  2  1  1  1  6  1  6  6
## 63324  1  1  1  3  1  1  1  1  6  6  1  6  1  2  1  6  4  5  3  5  1  6  1  2
## 63326  2  4  3  2  4  3  3  4  2  3  5  2  2  4  4  1  3  6  5  4  5  1  4  6
## 63328  4  6  6  1  6  6  5  6  1  1  1  3  4  5  5  5  6  5  1  6  5  3  6  5
## 63330  3  5  4  3  4  4  4  4  5  5  5  2  3  4  5  5  5  5  4  3  4  6  3  6
## 63331  1  6  5  5  4  4  2  3  2  2  1  2  5  6  5  2  4  2  1  5  4  4  4  5
## 63332  4  3  1  1  5  6  6  4  1  1  6  2  6  1  5  4  2  1  2  1  6  1  6  6
## 63334  1  6 NA  6  6  4  5  5  6  4  1  1  5  6  6  4  5  5  2  2  5  1  5  5
## 63335  2  5  5  6  5  5  4  4  3  3  2  2  5  5  5  3 NA  5  3  4  5  1 NA  4
## 63337  5  2  2  2  4  6  6  6  1  1  1  1  5  6  6  2  5  1  1  1  6  1  6  1
## 63338  2  5  5  5  2  4  5  4  4  4  2  2  5  5  4  4  5  1  3  4  5  3  5  5
## 63339  2  5  5  2  5  6  5  5  1  2  3  2  5  5  6  1  1  4  4  1  6  1  5  6
## 63340  2  6  6  6  6  6  6  5  1  3  1  1  5  6  5  2  2  2  4  6  5  2  4  2
## 63342  2  5  5  5  5  5  5  4  3  2  1  2  6  5  5  2  3  3  2  3  5  3  5  4
## 63346  1  6  3  5  6  5  5  6  1  4  1  1  4  6  5  4  4  4  2  2  5  2  6  4
## 63351  1  6  6  6  6  5  5  4  2  2  2  2  3  6  5  2  2  2  1  2  5  2  4  5
## 63352  6  5  5  4  5  4  2  4  3  5  2  3  5  5  4  4  4  5  4  5  4  2  5  6
## 63358  4  4  3  5  4  4  5  2  4  5  4  4  3  4  2  6  5  5  5  5  3  6  2  5
## 63361  3  5  5  6  5  3  5  4  2  2  3  4  4  3  4  1  2  1  1  1  4  2  4  5
## 63364  2  5  5  4  5  3  3  4  3  4  1  1  5  6  2  4  2  1  1  4  4  2  4  4
## 63369  2  5  5  5 NA  4  5  5  5  6  1  2  4  6  3  6  5  3  5  6  3  2  5  3
## 63370  2  6  4  4  4  4  4  5  1  2  1  3  4  4  6  4  3  1  1  1  5  1  4  3
## 63371  4  5  4  2  5  3  4  4  3  5  3  4  4  6  4  3  5  4  3  4  5  2  5  4
## 63372  2  5  2  4  6  4  1  2  5  5  1  3  2  5  2  2  2  5  6  6  5  1  5  6
## 63375  2  6  4  3  5  3  3  4  4  4  2  2  5  6  5 NA  2  2  3  3  5  2  5  5
## 63376  1  6  6  6  6  4  6  5  2  2  1  1  6  6  6  1  4  4  4  4  6  1  6  6
## 63378  2  5  6  6  5  5  5  5  2 NA  1  1  4  6  5  1  2  4  2  1  4  1  5  5
## 63379  5  5  4  6  4  6  5  5  2  4  3  4  3  6  4  3  4  5  5  2  4  5  2  5
## 63382  3  5  5  5  5  5  5  5  2  2  2  1  5  6  6  1  1  2  1  1  6  3  5  5
## 63383  5  5  5  4  5  5  4  4  2  3  3  5  5  5 NA  2  4  2  2  1  5  4  4  4
## 63386  2  5  5  4  2  4  4  5  1  4  2  4  3  4  4  1  1  2  4  2  5  1  5  5
## 63389  1  5  5  6  5  5  6  6  1  2  5  2  2  5  5  2  2  1  1  2  5  6  2  2
## 63395  2  2  5  5  4  5 NA  5  1  1  1  2  3  5  5  3  2  4  4  1  5  1  5  5
## 63399  1  6  6  6  1  5  2  5  2  4  2  4  4  6  4  1  1  1  1  2  5  3  1  2
## 63400  2  5  5  6  5  4  5  6 NA  1  2  2  4  4  6  4  4  4  1  4  4  6  4  4
## 63402  1  5  5  6  4  4  4  4  5  6  1  3  3  2  4  6  6  4  6  3  5  5  5  6
## 63404  5  4  2  4  5  5  6  5  2  4  2  5  4  5  4  2  5  5  5  5  5  4  3 NA
## 63406  2  4  6  1  4  6  3  4  3  5  1  1  3  1  6  6  4  1  4  6  1  1  6  6
## 63408  3  5  5  5  6  4  4  6  3  3  2  2  5  6  6  2  2  3  3  3  5  4  5  6
## 63412  2  6  6  6  6  5  5  6  2  1  2  1  6  6  5  2  3  2  2  4  6  4  5  6
## 63413  1  6  6  6  5  6  6  5  1  1  2  3  5  5  5  2  5  6  2  6  5  2  5  5
## 63414  4  6  4  6  4  5  5  4  5  6  1  1  2  5  4  5  6  6  6  6  1  6  2  5
## 63420  3  5  5  5  2  5  3  5  2  5  4  2  4  1  5  3  4  5  4  4  4  1  2  4
## 63421  3  5  5  5  5  5  2  5  2  2  2  2  5  5  5  2  1  2  2  2  3  1  3  3
## 63427  3  4  4  4  2  5  4  5  2  2  2  2  4  6  4  5  5  3  4  1  4  4  4  6
## 63428  6  3  2  4  4  6  6  6  1  2  4  4  5  6  5  1  4  1  1  1  6  2  6  6
## 63430  6  2  1  4  4  6  6  6  1  1  4  4  5  5  5  1  3  1  1  1  6  2  6  4
## 63431  3  4  5  4  6  4  3  4  4  4  4  3  5  5  4  3  5  2  2  2  6  3  5 NA
## 63432  3  5  5  5  5  5  5  5  2  4  5  6  4  5  3  1  1  1  1  2  5  2  4  5
## 63435  4  4  5  4  6  2  2  2  4  6  1  2  4  5  3  1  1  3  4  3  5  4  3  3
## 63437  4  2  5  1  5  2  1  1  4  6  1  1  5  5  1  1  2  4  5  1  6  2  5 NA
## 63438  1  6  6  5  6  4  4  5  3  3  2  3  5  5  5  1  4  3  4  5  4  1  5  6
## 63439  2  5  5  6  4  4  4  4  4  4  2  4  4  4  5  4  4  5  4  3  4  1  5  6
## 63441  2  5  4  4  5  3  3  5  5  5  5  5  3  5  4  3  2  2  6  5  3  5  3  5
## 63442  3  5  5  5  5  4  4  5  3 NA  2  2  4  5  4  1  3  3  1  2  5  4  4  4
## 63444  1  5  4  6  5  4  4  5  3  5  3  5  5  5  4  6  6  5  5  5  5  3  5  6
## 63445  1  5  1  6  6  4  6  4  4  5 NA  2  5  6  5  4  5  5  4  6  6  2  5  6
## 63446  2  5  5  2  4  2  3  2  4  5  4  4  4  3  2  4  5  6  6  5  4  4  5  6
## 63448  1  6  6  4  5  6  4  6  1  2  1  2  3  5  4  1  4  4  2  1  5  2  3  4
## 63450  2  5  5  5  3  5  5  4  3  4  5  4  1  2  5  4  5  5  2  2  6  5  3  6
## 63452  1  6  6  5  5  6  5  4  1  2  2  1  5  5  4  3  3  3  3  4  4  1  6  4
## 63454  5  5  4  5  5  4  4  4  2  4  1  2  5  5  5  2  3  2  1  1  5  2  4  4
## 63455  4  6  5  5  6  5  6  6  2  4  5  4  4  5  6  5  5  4  6  4  6  5  5  5
## 63458  1  4  2  3  4  2  2  4  3  5  5  4  4  4  1  1  1  1  1  1  2  4  2  3
## 63459  1 NA  4  6  3  6  6  2  2  4  1  5  6  6  5  1  2  2  5  3  6  2  5  6
## 63463  1  4  3  6  3  3  1  2  4  6  1  3  4  6  4  5  6  4  5  5  6  6  2  2
## 63464  1  4  5  6  6  6  5  5  1  2  5  2  4  6  5  4  4  2  3  1  4  4  4  5
## 63465  2  6  5  5  5  4  1  5  4  6  1  5  6  4  4  5  6  6  5  4  5  1  6  6
## 63466  1  6  6  6  6  6  5  5  1  1  1  1  5  5  6  1  1  1  1  1  6  2  5  2
## 63467  6  6  6  6  6  6  5  1  1  1  6  6  1  6  6  1  6  1  6  1  6  6  1  6
## 63468  3  5  3  4  2  5  5  4  2  5  3  2  3  2  5  5  4  3  2  2  6  1  6  6
## 63470  4  6  6  6  6  6  6  6  4  1  1  3  6  5  5  1  4  5  5  6  5  5  5  6
## 63472  6  2  4  1  5  5  5  5  2  4  2  4  3  5  5  6  6  6  5  4  4  2  3  5
## 63473  1  5  4  4  4  3  2  5  4  5  5  6  3  2  1  1  1  4  6  1  4  1  4  6
## 63476  3  5  5  6  5  5  5  6  2  3  2  4  3  6  4  3  2  3  2  1  4  3  4  5
## 63479  1  2  5  6  5  3  4  5  1  1  2  2  5  5  5  1  1  2  4  2  5  1  5  5
## 63480  1  6  6  4  5  5  6  5  2  4  2  2  4  4  6  2  2  5  4  1  6  1  5  6
## 63481  2  4  4  4  5  4  4  2  2  4  4  5  2  5  4  1  4  1  2  1  5  1  5  5
## 63485  2  4  3  4  3  2  3  5  4  5  5  5  1  3  4  5  5  5  6  5  5  2  5  6
## 63486  5  4  5  4  4  4  6  4  2  3  1  2  5  4  6  1  4  1  1  1  5  1  5  5
## 63488  1  5  5  6  5  5  5  2  2  2  4  2  4  5  5  2  4  2  2  1  1  4  5  5
## 63491  6  6  6  6  6  6  6  6  1  1  4  1  5  6  5  1  4  5  5  6  4  4  5  6
## 63493  4  6  5  6  5  3  3  2  3  6  6  6  6  1  3  1  2  4  5  1  3  6  4  6
## 63494  4  3  3  4  3  5  5  4  3  5  5  4  2  3  3  3  3  2  3  3  5  1  5  6
## 63496  2  5  5  6  5  3  5  5  2  1  2  2  5  6  5  2  3  2  1  1  5  5  4  3
## 63498  2  5  5  6  5  4  3  3  2  3  5  4  4  5  2  4  4  4  3  3  6  2  4  6
## 63499  1  6  5  4  6  4  2  4  4  5  2  2  5  4  5  4  4  4  4  4  6  2  4  4
## 63501  4  3  6  4  6  2  5  6  1  1  5  2  6  1  2  3  3  1  4  3  4  6  4  6
## 63502  3  4  4  6  4  3  4  4  4  1  1  4  4  4  5  1  4  1  2  4  6  4  4  1
## 63504  1  6  4  4  4  6  2  5  2  1  6  5  1  4  1  1  6  5  4  6  2  6  1  6
## 63505  1  5  5  1  6  6  5  5  1  6  2  1  5  5  6  1  1  5  5  6  4  5  5  5
## 63509  2  4  2  2  3  5  5  5  3  5  4  4  2  5  5  5  5  5  5  3  5  3  4  6
## 63510  6  6  1  3  5  6  6  6  1  1  3  1  2  2  6  1  2  2  3  1  6  1  4  1
## 63512  5  4  1  2  2  5  5  4  4  6  6  4  3  2  2  4  5  2  5  5  6  2  4  6
## 63513  3  4  4  2  3  3  2  3  4  5  4  4  6  2  3  2  3  5  5  2  6  1  5  6
## 63516  2  6  6  6  6  6  6  6  2  5  4  3  5  6  5  3  3  2  4  3  6  1  5  5
## 63518  5  6  6  6  3  5  6  1  6  6  6  6  6  3  6  6  6  5  6  6  6  4  6  6
## 63521  1  6  4  4  5  3  6  3  2  2  2  2  5  5  5  3  4  2  1  2  4  2  5  6
## 63525  3  4  4  2  4  5  4  4  4  2  6  5  4  3  3  3  4  1  1  1  4  3  3  4
## 63528  1  4  2  5  2  1  2  1  2  4  6  6  1  2  1  2  3  4  5  5  3  2  1  5
## 63530  3  5  4  6  4  5  6  5  1  2  1  4  5  5  6  6  6  5  1  2  6  2  5  6
## 63531  2  6  5  2  5  5  2  4  1  3  1  1  5  6  5  3  2  1  2  1  4  3  3  4
## 63533  2  3  4  2  5  5  6  5  1  6  3  5  1  5  4  1  5  1  1  1  5  1  6  6
## 63534  4  5  5  5  3  4  4  4  3  5  3  4  4  3 NA  4  5  4  3  4  3  5  4  6
## 63536  1  6  6  3  5  6  4  6  1  3  3  2 NA  5  6  3  2  2  5  1  6  1  5  6
## 63538  2  5  5  4  5  5  5  5  1  4  3  3  5  5  5  3  3  2  2  3 NA  4  4  4
## 63547  2  4  5  4  4  5  5  2  1  1  5  4  5  3  4  2  4  4  3  3  5  1  4  6
## 63549  1 NA  5  2  4  5  6  4 NA  2  4  4  5  2  5  2  2  3  5  5  5  6  4  3
## 63551  2  6  5  4  6  4  3  4  4  6  4  5  5  5  3  4  5  5  6  6  6  4  4  6
## 63554  4  5  4  6  4  4  5  5  3  6  1  1  4  6  4  3  4  3  1  4  3  3  4  2
## 63555  1  6  5  4  5  5  4  5  3  5  4  3  4  5  4  2  4  2  2  5  4  4  6  6
## 63556  1  3  5  6  6  3  5  4  2  5  2  2  4  6  3  2  3  2  2  4  5  4  4  5
## 63557  3  5  5  6  6  5  5  6  3  4  2  1  6  5  6  1  2  2  1  1  6  2  6  6
## 63558  5  6  6  5  4  4  3  6  4  3  2  1  6  6  4  3  2  3  4  2  4  5  4  4
## 63559  1  6  6  6  5  5  5  6  1  1  2  2  4  4  5  1  2  1  2  1  6  1  5  6
## 63560  1  5  3  4  3  6  6  6  1  4  6  6  3  1  2  4  5  5 NA  2  4  1  6  6
## 63562  2  4  5  4  5  3  4  4  5  6  5  3  3  5  2  4  4  4  5  3  4  4  3  5
## 63567  2  3  3  5  3  2  3  3  3  5  2  5  5  4  2  5  5  5  5  4  5  2  5  6
## 63575  2  5  5  2  5  4  4  3  4  5  3  2  2  4  3  1  2  4  4  2  5  3  6  6
## 63578  1  5  6  6  6  5  4  5  2  4  1  2  5  6  4  2  3  2  5  2  6  1  6  6
## 63579  2  4  5  5  4  6  6  5  1  3  2  1  2  6  5  4  3  2  2  2  6  1  5  5
## 63580  1  4  4  5  4  3  4  3  5  4  1  2  5  5  4  5  3  4  4  4  6  4  4  4
## 63581  2  5  5  4  4  5  5  5  1  3  1  2  5  6  5  2  4  2  2  2  6  1  6  6
## 63582  1  4  4  5  3  2  5  5  2  6  2  2  1  2  5  5  5  5  5  1  2  2  5  5
## 63583  2  4  6  6  6  6  6  3  1  1  5  4  3  5  4  2  2  4  5  2  6  2  5  6
## 63584  3  4  5  4  4 NA  4  4  3  5  2  4  4  5  4  3  3  3  2  3  4  5  3  4
## 63586  2  5  5  5  4  5  5  5  2  4  2  4  4  4  5  2  2  2  1  3  6  1  5  6
## 63587  2  5  6  6  6  5  5  4  4  2  2  2  6  5  5  6  6  6  4  2  5  2  4  6
## 63588  1  6  6  6  5  5  4  5  2  2  2  2  4  3  6  2  4  5  5  4  5  2  4  5
## 63589  2  3  4  4  4  3  3  4  6  4  2  2  5  6  4  5  3  2  2  2  5  3  3  5
## 63590  1  5  1  2  5  5  5  5  2  2  1  1  6  6  5  1  1  3  4  1  6  2  4  3
## 63591  2  5  5  6  4  2  2  2  2  6  2  5  2  5  1  4  5  5  5  5  2  4  2  2
## 63595  4  4  1  1  1  5  5  6  2  2  3  6  5  1  2  1  2  2  6  2  6  1  5  6
## 63596  2  5  4  5  2  6  5  5  2  2  5  5  3  4  3  6  6  6  6  5  3  5  3  5
## 63597  2  4  5  3  5  4  4  4  4  4  4  4  4  4  3  2  4  5  6  3  3  4  4  5
## 63602  1  4  4  6  6  6  6  6  1  1  1  4  5  6  6  3  3  1  2  6  6  6  5  6
## 63608  1  6  6  6  6  1  5  5  1  2  2  2  5  5  2  4  4  5  5  5  2  6  2  4
## 63609  2  2  4  1  4  3  2  1  5  6  2  4  4  3  2  3  4  5  4  2  3  1  2  4
## 63613  1  5  5  6  6  5  6  5  1  1  2  1  6  6  6  1  1  1  1  1  6  1  6  2
## 63616  2  5  5  4  5  4  3  3  3  2  2 NA  3  3  4  2  2  1  1  2 NA  3  5  5
## 63617  2  5  6  6  6  5  5  4  1  4  4  1  4  6  6  5  5  4  4  1  4  5  2  5
## 63618  2  5  6  6  5  6  5  6  2  2  1  4  6  6  5  4  4  3  6  4  6  2  5  6
## 63619  2  2  4  4  5  5  3  2  6  6  6  6  1  2  1  4  4  4  3  4  2  5  2  6
## 63621  4  4  4  4  4  4  5  5  4  5  6  6  3  2  3  4  5  2  4  3  5  2  2  5
## 63623  1  5  5  6  5  4  5  6  1  1  4  4  4  4  4  1  3  3  1  2  3  1  5  5
## 63625  2  6  4  1  4  6  4  5  1  1  3  3  6  5  3  2  2  5  6  1  6  6  6  6
## 63631  3  4  4  2  5  5  5  4  3  4  3  2  5  5  5  3  3  2  3  1  6  1  6  6
## 63636  1  6  6  4  6  6  5  6  3  6  3  1  5  6  5  2  4  4  4  3  5  6  4  6
## 63637  5  5  5  6  4  5  5  5  2  5  5  5  4  5  5  2  4  4  2  2  5  5  5  4
## 63638  2  5  4  4  4  4  4  3  4  6  4  3  2  4  4  2  4  3  2  2  4  4  4  6
## 63642  3  4  6  1  4  5  5  4  3  5  1  1  5  6  5  4  6  2  4  1  6  4  4  5
## 63644  1  5  6  4  6  3  5  5  5  5  2  4  3  5  4  6  6  5  6  6  3  5  5  6
## 63648  1  4  6  5  6  5  4  4  3  1  5  6  5  4  3  1  1  2  2  1  5  1  5  6
## 63649  1  5  5  3  5  4  5  4  4  3  1  2  4  5  3  2  4  2  4 NA  5  4  3  5
## 63655  2  6  5  6  2  5  5  5  2  1  4  1  3  5  5  3  5  3  4  5  3  5  3  4
## 63657  2  4  4  4  6  6  5  5  5  6  1  5  5  4  4  1  1  3  4  4  3  1  4  6
## 63658  2  6  5  3  4  3  4  2  2  2  2  5  1  6  2  3  3  3  2  1  6  6  4  6
## 63659  4  4  4  2  5  4  3  4  3  4  2  2  4  5  6  4  4  4  3  2  6  2  5  3
## 63661  2  5  4  5  5  4  4  4  4  4  2  3  4  5  2  5  5  5  4  3  4  4  4  4
## 63668  4  5  4  4  5  6  6  5  1  1  1  3  1  2  4  3  4  4  5  4  5  1  5  4
## 63669  1  5  6  4  5  4  3  5  5  4  6  4  5  4  3  3  2  2  1  4  4  5  3  5
## 63670  4  4  4  6  3  5  5  3  3  4  5  5  3  3  4  4  5  3  4  2  5  2  4  5
## 63672  3  5  5  6  5  5  4  4  2  2  1  2  2  5  5  2  2  2  2  2  4  3  4  5
## 63675  3  4  6  6 NA  5  4  5  2  4  1  4  5  4  4  1  1  1  2  3  6  1  6  6
## 63676  2  5  6  5  5  4  5  3  2  6  3  4  5  5  4  3  5  4  4  3  5  4  5  5
## 63677  1  6  6  5  6  6  4  2  1  6  6  6  2  4  5  1  6  1  6  1  6  1  6  6
## 63681  2  5  4  2  4  5  5  5  1  5  2  2  2  4  5  5  4  2  5  1  2  2  5  4
## 63682  2  6  3  4  5  3  2  3  2  4  2  3  3  6  5  4  2  1  2  1  5  1  6  5
## 63683  2  6  5  5  5  5  3  4  2  5  2  2  1  4  6  2  5  5  4  1  5  5  6  6
## 63687  2  6  4  5  4  3  4  3  5  6  2  6  3  4  3  6  6  5  5  5  5  1  5  6
## 63690  5  5  2  3  3  4  3  4  3  5  4  1  5  4  5  6  6  6  4  3  5  1  6  2
## 63692  1  6  6  6  6  5  2  4  2  3  2  2  5  6  4  3  2  1  1  2  5  2  5  5
## 63693  1  6  6  5  4  4  4  4  5  5  2  4  4  4  4  4  5  4  4  4  5  3  6  5
## 63696  2  5  5  5  3  3  2  2  4  4  2  4  4  5  5  2  2  2  4  3  5  2  4  5
## 63697  1  5  6  6  5  6  6  4  1  1  4  2  5  5  6  4  5  4  4  3  6  4  5  4
## 63699  5  5  5  6  2  5  4  3  3  1  1  2  5  5  4  5  4  5  2  4  6  5  5  5
## 63700  1  5  4  6  3  5  5  5  2  4  3  4  2  4  4  2  2  2  1  2  4  4  4  2
## 63701  6  6  6  6  6  6  6  6  1  3  5  2  5  5  6  6  6  6  3  1  2  4  5  6
## 63704  1  6  6  6  5  5 NA  5  1  2  2  2  4  6  5  2  2  2  1  2 NA  3  5  5
## 63705  2  4  4  1  2  6  6  6  1  4  6  6  1  1  4  6  6  6  6  6  3  5  1  6
## 63706  1  5  6  6  5  5  4  4 NA  1  4  4  5  3  4  4  4  5  1  1  6  1  5  6
## 63707  1  5  6  5  4  3  4  2  3  4  5  5  4  2  3  1  2  2  5  3  5  2  4  5
## 63709  2  5  5  5  5  4  4  4  3  4  2  2  4  5  5  2  3  3  3  2  4  4  4  3
## 63711  2  5  6  6  5  5  3  2  4  4  1  2  4  5  2  5  5  3  3  2  3  2  5  6
## 63712  1  5  6  6  6  6  6  5  2  4  1  3  6  5  6  4  4  4  3  6  6  1  6  6
## 63713  3  5  5  4  6  6  6  5  1  1  5  4  6  4  6  4  4  4  4  2  6  1  6  2
## 63721  4  6  6  6  6  6  6  6  4  1  5  5  5  5  5  4  4  2  4  4  5  4  4  6
## 63723  1  6  6  6  6  2  5  5  1  2  1  1  5  6  5  2  3  1  1  2  5  4  6  4
## 63724  1  5  5  6  5  2  3  4  4  5  3  4  3  3  4  3  3  2  4  4  3  4  4  6
## 63726  2  3  5  6  5  5  5  5  2  5  5  2  4  3  2  2  1  4  1  1  4  1  6  2
## 63727  4  4  3  5  5  6  5  6  1  2  3  2  2  5  5  3  3  4  2  2  4  3  3  6
## 63728  3  6  6  6  5  3  2  5  4  4  1  3  5  5  6  5  6  6  3  2  6  1  5  5
## 63729  3  5  6  4  5  4  3  4  2  4  2  2  5  4  6  4  5  5  2  2  4  1  5  6
## 63732  1  4  4  4  4  2  3  4  2  2  5  4  4  4  3  2  2  3  5  2  5  3  3  5
## 63734  4  2  2  1  5  3  4  2  4  4  5  4  3  4  1  1  3  1  3  1  5  2  5  5
## 63735  1  6  6  4  5  5  2  4  2  3  2  3  5  5  5  1  1  1  1  1  5  2  6  6
## 63738  4  6  5  6  4  5  5  5  4  4  1  3  4  5  6  4  5  5  4  4  5  4  5  5
## 63739  3  5  5  4  5  6  6  6  1 NA  2  4  6  5  6  5  2  2  1  1  5  1  6  1
## 63742  2  4  4  6  6  6  6  1  1  6  1  6  6  5  6  6  6  6  6  2  6  1  6  6
## 63743  2  5  4  5  5  5  3  3  2  3  3  3  3  5  5  1  1  2  2  2  4  2  4  5
## 63744  2  5  5  4  5  3  5  4  2  5  2  3  4  5  5  4  4  2  3  1  5  1  5  5
## 63745  1  5  5  5  5  5  4  3  3  4  3  4  4  5  4  4  5  4  4  3  5  2  4  5
## 63746  6  5  5  4  5  5  2  5  3  5  5  5  4  2  6  6  6  6  6  2  5  3  4  6
## 63748  2  4  5  1  4  3  1  5  1  4  5  4  1 NA  3  2  6  6  5  6  3  4  1  4
## 63750  4  4  4  3  3  6  4  4  2  4  4  4  3  2  4  3  5  5  4  4  4  2  4  5
## 63752  1  6  5  5  5  6  5  5  1  5  4  4  5  5  4  1  4  4  4  2  6  4  3  5
## 63760  2  4  6  6  5  4  3  3  2  3  5  3  3  4  4  4  4  4  3  2  3  4  3  3
## 63761  2  5  5  4  4  2  2  2  4  5  4  4  4  5  5  1  2  2  5  4  6  5  5  6
## 63762  1  6  6  1  6  1  1  1  6  6  1  6  6  1  4  6  6  2  6  6  6  1  6  3
## 63763  1  6  6  4  1  1  6  5  4  2  6  1  3  5  1  5  5  5  6  4  6  1  6  6
## 63766  3  5  6  6  5  5  4  5  1  1  1  1  3  6  4  1  1  1  1  2  5  1  4  4
## 63767  1  6  6  6  6  6  6  6  1  1  4  1  6  6  6  1  1  1  1  1  6  1  6  1
## 63768  2  5  5  4  5  5  4  5  2  3  5  2  4  5  6  4  2  4  3  2  4  2  4  4
## 63770  3  6  6  6  5  5  5  3  2  4  1  2  5  5  5  4  4  4  3  2  4  2  5  6
## 63773  2  6  5  6  6  6  6  5  1  4  4  2  5  5  6  4 NA  1  1 NA  6  4  5  5
## 63775  1  5  3  4  5  5  4  4  1  2  5  4  2  5  2  1  2  2  1  2  6  1  6  5
## 63776  1 NA  5  6  6  5  6 NA  2  6  1  1  4  6  4  3  5  3 NA  1  4  4  4  6
## 63778  3  5  2  2  4  5  3  6  1  5  3  5  1  4  2  1  3  6  6  6  6  4  3  6
## 63788  1  5  5  6  5  5  5  1  5  6  1  2  5  6  5  2  2  2  4  1  5  1  5  6
## 63789  2  4  3  6  4  4  5  5  1  2  6  5  4  4  4  3  3  4  3  5  5  4  3  5
## 63791  2  6  4  5  4  5  5  5  1  1  2  2  4  3  6  1  2  1  2  1  5  2  6  4
## 63792  4  6  6  6  5  4  3  2  2  3  2  3  5  6  4  4  4  3  3  4  2  3  4  3
## 63793  4  6  6  6  5  4  3  3  2  3  2  3  5  6  4  2  2  2  2  2  3  3  4  3
## 63794  5  5  5  6  4  6  6  4  1  1  2  2  4  5  5  1  2  2  2  5  4  2  5  2
## 63796  1  6  4  6  4  4  3  4  3  6  2  3  4  5  4  6  6  6  6  5  4  3  3  5
## 63798  6  6  6  6  6  6  6  5  1  4  2  4  5  6  6  4  4  6 NA  6  5  3  6  6
## 63799  1  5  6  6  4  4  5  5  1  1  6  4  4  5  4  1  3  4  2  4  4  4  3  4
## 63801  1  5  6  5  5  5  5  4  2  3  1  2  4  5  4  3  4  2  3  5  6  2  4  6
## 63803  1  6  6  5  6  6  4  5  2  4  1  1  4  6  5  1  2  3  1  2  3  4  5  4
## 63807  2  3  4  5  3  3  3  3  2  6  5  3  6  4  4  6  6  5  4  1  3  2  4  6
## 63810  3  5  4  4  5  5  4  4  4  6  4  4  4  4  5  2  2  6  6  5  6  1  5  6
## 63811  5  5  5  6  5  6  6  6  1  3  5  4  4  5  6  5  5  4  2  6  6  3  4  6
## 63812  1 NA  6  6  6  3  5  5  1  2  1  1  5  5 NA  2  2  1  1  2  6  1  5  6
## 63815  2  5  4  6  3  4  5  6  2  1  1  2  4  6  5  2  2  1  1  1  6  1  6  6
## 63816  2  5  4  5  5  6  5  4  1  2  5  3  2  4  3  3  2  2  2  2  2  3  4  3
## 63817  3  5  5  2  6  6  6  6  1  1  2  1  6  6  5  5  4  5  1  2  5  2  5  3
## 63818  1  4  4  6  3  3  5  4  4  4  6  5  1  1  4  6  6  6  4  2  4  2  4  4
## 63820  4  2  1  2  2  5  6  5  2  4  6  6  1  2  5  2  2  1  2  1  2  5  2  5
## 63822  1  5  5  2  5  2  5  2  1  5  5  2  2  2  5  2  2  2  4  4  5  2  4  5
## 63823  4  5  4  6  4  4  4  2  3  4  3  1  4  5  5 NA  4  4  2  1  3  5  3  5
## 63824  1  6  6  6  6  1  6  5  2  5  2  1  6  3  6  1  4  1  5  1  6  1  5  3
## 63825  1  5  6  5  6  4  2  5  3  5  1  2  5  5  4  1  4  1  1  3  5  1  4  5
## 63826  4  4  2  5  3  4  5  5  5 NA  6  5  1  1  2  5  4  4  6  3  2  3  1  4
## 63827  1  6  5  2  5  6  4  5  1  5  3  4  3  5  4  1  1  1  4  1  5  4  2  6
## 63828  3  3  4  5  5  5  5  3  3  6  4  5  3  5  3  1  3  2  2  2  6  3  5  4
## 63829  1  5  5  5  2  3  5  4  2  3  5  2  2  4  6  2  3  4  3  2  5  2  5  5
## 63834  5  6  6  4  6  5  5  4  2  5  2  1  6  5  5  5  5  5  4  1  6  2  6  6
## 63835  5  5  3  6  5  4  5  5  3  3  5  4  2  5  6  1  1 NA  1  1  5  2  6 NA
## 63837  5  3  5  4  4  5  4  3  1  1  3  5  3  3  5  3  3  1  3  2  3  3  2  4
## 63838  1  5  5  5  4  5  5  5  1  1  1  1  5  6  5  1  1  1  1  1  6  1  5  4
## 63839  4  5  1  5  1  4  6  6  6  4  6  4  2  1  6  5  5  4  6  3  6  4  5  6
## 63846  2  6  6  3  5  6  3  5  1  1  3  2  3  5  5  3  4  4  3  4  5  1  5  5
## 63847  5  5  2  5  1  5  5  5  2  3  4  4  5  4  5  2  3  3  2  5  5  1  5  6
## 63849  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  2  4  3  2  6  1  6  4
## 63851  3  4  5  1  4  5  5  6  2  4  5  5  3  3  5  5  5  4  2  2  6  1  5  6
## 63852  4  5  5  5  6  5  5  6  2  4  1  1  5  5  5  3  4  4  1  3  4  4  4  5
## 63853  3  4  3  2  4  5  5  5  2  5 NA  3  5  5  5  2  3  2  5  6  6  5  5  6
## 63854  1  6  6  5  6  6  6  1  2  5  1  1  6  6  6  1  1  2  4  6  6  1  5  6
## 63855  2  5  5  5  5  6  5  6  1  2  1  4  4  4  6  1  4  4  5  6  6  2  4  5
## 63856  2  5  4  6  5  4  5  1  2  6  2  1  6  6  5  5  6  5  3  4  6  1  5  6
## 63862  5  2  1  1  1  2  5  2  3  5  4  6  1  2  1  1  1  1  1  1  6  2  5  6
## 63863  3  5  5  6  4  5  6  5  2  2  5  2  2  4  5  4  4  2  2  2  5  5  5  4
## 63866  4  5  3  5  4  4  2  4  3  4  4  3  2 NA  5  2  4  2  2  3  3  4  4  3
## 63868  2  4  5  4  2  4  3  3  2  4  3  5  2  2  3  5  5  6  4  4  5  2  3  5
## 63871  1  6  6  5  5  6  6  6  1  1  4  5  5  1  5  3  5  1  1  1  6  2  5  5
## 63873  1  6  6  5  5  3  3  4  4  4  4  4  4  4  4  3  4  4  5  2  5  1  5  6
## 63875  5  6  5  6  5  6  5  6  1  3  2  4  2  5  5  1  2  1  2  1  5  2  5  5
## 63877  4  4  4  4  5  6  3  2  5  5  5  4  4  4  4  3  3  4  5  3  6  2  5  6
## 63879  4  4  1  1  2  4  3  5  2  1  1  1  4  2  5  4  5  2  4  2  5  1  6  4
## 63880  2  4  2  5  4  5  5  6  1  5  5  5  2  2  6  2  2  1  1  1  6  1  5  6
## 63881  5  5  5  2  6  5  4  5  5  5  4  5  1  2  4  2  4  1  1  1  5  1  4  3
## 63882  3  5  5  3  5  5  3  4  1  6  6  2  4  2  4  5  5  5  4  2  5  4  6  6
## 63883  3  4  6  6  4  6  2  4  1  2  2  3  5  5  6  4  5  4  2  4  6  6  6  5
## 63884  2  5  5  2  6  4  3 NA  2  4  2  2  3  6  6  1  4  1  2  1  5  2  6  4
## 63885  5  4  1  2  2  5  5  4  2  4  2  4  3  4  4  2  3  2  2  2  4  3  6  5
## 63887  3  4  2  5  4  5  5  4  4  4  3  3  2  4  5  2  5  4  2  6  5  4  5  6
## 63888  6  1  5  4  2  3  4  3  2  3  1  3  5  2  4  5  6  6  2  4  4  5  3  2
## 63890  1  6  5  3  5  4  2  2  2  2  2  2  4  5  5  1  1  1  1  1  5  2  5  5
## 63897  4  5  4  2  4  4  2  5  5  6  3  5  4  3  3  3  5  4  3  1  5  1  4  4
## 63898  1  5  4  5  2  2  5  2  5  2  4  4  4  4  4  1  1  3  2  4  6  1  6  6
## 63899  1  6  5  4  5  5  6  5  4  4  6  1  3  6  5  5  4  6  5  5  6  4  5  6
## 63900  3  5  2  4  2  5  4  6  2  2  5  4  4  5  5  3  3  2  3  1  4  2  4  6
## 63902  1  6  5  6  5  5  5  5  2  2  3  3  4  5  5  1  2  2  2  3  5  2  5  5
## 63907  3  5  4  6  5  6  5  5  2  5  2  4  5  5  3  2 NA  3  6  5  6  1  6  5
## 63909  3  3  4  4  3  3  3  4  2  4  2  2  3  3  2  2  2  2  4  2  3  3  2  5
## 63911  1  6  5  5  6  5  5  5  1  5  3  1  3  5  6  1  2  2  2  2  2  1  3  6
## 63912  1  6  6  6  6  4  3  1  4  2  2  2  5  6  6  1  2  2  1  1  6  3  3  3
## 63913  2  5  5  6  6  6  5  5  1  1  2  1  6  5  5  1  1  1  2  2  6  1  6  6
## 63918  1  6  6  6  6  6  5  5  1  2  1  2  4  6  6  1  1  1  1  3  5  3  5  5
## 63924  4  4  6  4  6  4  3  4  4  3  1  1  4  6  6  3  4  4  1  2  5  6  4  4
## 63925  2  5  5  5  3  4  4  4  2  3  4  4  2  3  3  1  2  2  2  2  4  5  2  6
## 63930  4  4  5  6  5  4  5  5  2  2  2  1  4  5  5  3  2  2  2  4  4  4  4  2
## 63931  2  3  5  4  4  5  5  4  2  5  4  4  4  2  4  2  3  2  3  4  5  1  5  4
## 63932  1  6  6  4  4  6  5  5  2  2  5  3  4  4  5  6  5  5  4  2  5  3  4  6
## 63934  1 NA  6  6  6  5  5  6  1  1  1  1  6  6  6  4  4  3  1  1  6  3  6  4
## 63937  1  5  3  1  4  2  5  5  4  6  4  5  3  1  4  1  1  3  2  1  5  1  4  6
## 63939  2  5  5  2  3  5  4  4  4  4  4  5  2  2  4  3  4  5  5  6  5  3  5  6
## 63942  3  5  5  4  5  4  2  2  6  6  1  2  5  6  4  2  2  4  4  4  6  2  6  6
## 63946  5  1  2  6  2  2  4  2  4  5  4  5  4  1  5  6  6  6  5  4  6  1  3  3
## 63947  2  6  6  6  6  5  5  5  1  1  2  2  5  6  6  5  5  5  2  1  5  2  6  5
## 63948  1  5  3  6  6  4  3  1  5  5  4  2  2  5  2  3  3  2  5  6  5  2  5  6
## 63950  1  5  2  6  4  4  4  3  4  5  3  2  5  5  2  1  2  4  3  2  6  2  5  6
## 63952  2 NA  6  6  6  4  1  5  3  6  1  1  4  6  6  1  4  4  6  6  6  4  6  1
## 63955  2  3  4  2  4  1  4  2  3  6  5  5  4  4  2  4  6  5  2  2  4  5  3  6
## 63956  1  6  5  6  6  6  6  5  3  2  3  3  6  5  6  6  6  6  3  6  6  1  6  6
## 63957  2  3  5  5  4  5  6  5  1  6  6  6  1  1  1  1  1  5  5  1  6  3  2  6
## 63958  2  4  4  4  5  5  4  4  2  5  4  2  4  5  3  2  3  4  3  1  4  2  4  5
## 63959  2  6  6  6  5  5  5  5  5  5  2  4  3  4  4  1  2  5  5  5  5  1  5  5
## 63961  4  1  2  4  5  5  6  4  2  6  5  4  6  2  4  2  5  5  6  5  6  3  5  6
## 63962  1 NA  5  6  6  5  3  6  1  4  1  1  6  5  6  1  2  1  1  1  6  1  5  6
## 63963  5  5  6  1  5  5  4  5  5  6  6  5  3  3  4  2  3  3  3  3  5  3  1  6
## 63966  1  6  5  6  6  4  5  5  4  5  5  4  4  4  5  3  3  5  6  3  5  1  6  6
## 63967  2  5  6  5  5  5  5  6  1  1  3  1  5  5  6  1  1  1  1  1  6  1  6  4
## 63971  3  5  5  5  3  5  5  6  2  4  3  5  2  2  5  3  5  4  3  2  4  2  4  5
## 63977  2  4  5  5  5  6  5  4  2  4  3  1  6  5  6  2  2  1  2  3  6  2  6  5
## 63978  5  5  6  6  5  6  6  6  5  4  6  5  6  6  5  6  6  5  4  6  5  6  5  6
## 63979  3  4  5  5  3  6  6  2  5  5  5  6  2  1  5  1  1  1  5  2  5  2  5  6
## 63980  2  4  4  6  3  4  5  2  3  6  4  4  3  3  2  2  2  2  5  3  2  5  4  3
## 63982  4  2  2  4  3  6  5  5  3  3  3  4  2  1  4  2  2  4  3  2  2  4  4  4
## 63983  2  5  5  2  4  5  3  5  5  5  6  6  1  1  2  2  3  2  4  2  4  2  2  6
## 63984  2  4  3  1  5  6  5  5  1  4  2  6  5  5  5  2  4  6  5  1  6  1  5  6
## 63985  6  6  3  6  6  4  4  4  4  4  5  3  3  6  5  4  5 NA  4  3  4  2  5  6
## 63987  1  6  5  6  4  5  5  4  4  3 NA  3  3  3  4  1  2  2  1  4  5  4  5  6
## 63990  3  5  4  4  5  4  4  3  2  6  1  2  2  5  5  2  2  4  2  1  6  2  4  5
## 63991  3 NA NA NA  3  3 NA NA NA  3 NA  3 NA  3 NA NA  3  3 NA NA NA  3 NA  3
## 63993  2  2  2  5  4  5  2  3  3  4  3  2  3  3  4  4  4  3  4  2  6  1  5  5
## 63997  2  4  4  3  4  4  4  4  3  4  3  3  3  4  4  4  4  4  4  3  5  3  4  5
## 63999  2  4  3  6  4  4  2  4  4  4  4  5  4  2  4  2  3  4  4  3  6  2  4  5
## 64000  3  5  3  6  4  2  2  4  5  6  3  5  5  3  4  1  1  2 NA  4  6  4  5  5
## 64001  3  6  6  3  6  6  6  5  1  5  1  1  6  6  6  4  6  4  1  1  6  1  6  6
## 64003  2  5  5  6  5  4  5  5  1  2  2  1  4  6  5  1  1  2  2  2  5  3  5  6
## 64005  2  5  5  5  3  4  2  6  2  5  1  4  3  5  6  3  4  3  2  4  4  3  5  5
## 64006  1  6  5  5  5  5  5  5  1  1  2  2  5  2  6  3  5  3  2  4  6  5  1  3
## 64010  2  5  6  6  5  4  5  4  4  4  5  3  5  5  5  1  2  1  2  1  5  3  5  5
## 64012  4  6  2  6  6  4  4  5  3  5  1  4  4  4  2  3  5  4  5  5  6  6  1  4
## 64014  1  6  6  4  5  5  3  5  2  2  2  3  3  5  3  2  5  3  2  4  5  2  2  6
## 64016  4  5  5  6  4  6  6  6  1  1  4  1  6  6  6  2  4  5  5  4  6  1  5  6
## 64017  3  4  5  6  6  3  6  6  1  1  3  1  5  6  6  1  1  1  1  1  5  1  6  6
## 64018  1  4  6  6  3  6  5  6  2  2  4  5  2  3  5  2  3  2  4  1  3  2  6  5
## 64020  1  6  6  6 NA  6  2  6  1  2  6  6  5  6  6  1  2  6  1  4  6  1  2  6
## 64021  1  6  6  6  6  2  5  4  1  6  1  1  1  6  3  3  2  1  5  1  6  6  6  5
## 64024  1  6  6  6  6  5  6  5  1  1  1  1  5  6  2  1  2  4  4  1  6  5  6  6
## 64025  1  6  6  6  6  6  4  5  1  2  1  1  6  6  6  1  1  1  1  1  6  1  6  6
## 64028  4  5  3  6  3  3  2  4 NA  4  4  4  4  5  2  1  1  2  2  1  6  4  5  5
## 64029  5  5  5  5  5  5  6  5  5 NA  5  4  6  5  6  5  6  5  4  5 NA  6  5  5
## 64030  5  3  4  4  4  4  1  3  3  4  6  6  1  1  1  2  4  3  4  3  6  1  3  5
## 64031  6  5  4  6  6  6  6  5  3  1  4  4  5  6  6  3  1  2  1  2  5  5  4  3
## 64032  4  4  4  4  4  4  3  3  4  5  4  4  4  3  4  4  4  4  4  4  4  4  4 NA
## 64033  1  5  4  5  4  2  3  3  1  6  3  3  2  2  5  3  2  3  5  3  3  3  4  6
## 64036  2  6  4  6  5  4  5  5  2  2  4  2  6  6  3  2  2  5  4  3  5  4  3  6
## 64044  3  6  5  3  5  3  3  5  5  4  5  6  2  4  4  6  6  4  5  6  4  4  3  5
## 64046  2  5  4  3  4  4  4  4  3  3  5  5  3  4  4  5  5  5  4  5  3  3  4  5
## 64047  1  5  5  2  3  3  4  3  3  4  4  4  5  3  6  6  6  5  6  6  5  1  6  6
## 64049  3  4  1  6  4  2  1  6  2  6  6  6  1  1  3  2  4  1  6  1  6  1  1  6
## 64050  1  6  5  6  5  5  1  4  3  4  3  2  1  4  1  1  2  2  4  4  4  5  3  2
## 64051  2  5  6  5  6  5  5  6 NA  2  2  2  6  6  5  1  1  1  1  1  6  1  4  6
## 64053  1  6  6  6  6  6  5  5  1  1  3  2  5  5  6  2  2  1  1  1  6  1  5  6
## 64056  4  6  6  6  6  2  2  3  5  6  1  2  6  6  5 NA  6  6  4  6  6  6  5  6
## 64057  2  5  5  6  6  4  4  4  5  3  1  5  4  6  3  2  3  4  3  6  3  4  4  5
## 64065  4  5  4  1  4  4  5  6  2  2  1  1  4  6  6  2  4  5  1  1  5  6  4  6
## 64066  1  3  4  4  4  4  1  5  3  2  6  2  1  5  3  1  1  1  1  4  5  5  4  6
## 64069  2  6  5  3  4  2  3  6  5  5  1  3  4  6  5  3  4  5  1  4  4  3  4  6
## 64072  4  3  2  1  4  6  6  6  1  2  3  4  2  4  3  2  5  4  4  2  6  2  6  6
## 64074  1  4  5  6  5  5  5  4  1  2  2  4  4  6  6  2  4  2  2  2  5  1  4  5
## 64075  5  4  1  4  2  6  5  6  1  4  6  6  1  1  5  2  4  1  5  1  6  1  4  6
## 64076  2  5  6  5  5  2  5  5  3  5  5  2  2  5  5  4  5  5 NA  5  5  1  3  5
## 64078  1  5  6  5  6  4  4  2  2  5  1  1  5  6  6  1  1  1  2  4  4  2  5 NA
## 64079  1  1  1  1  5  6  6  6  1  2  2  4  5  5  6  1  2  6  4  6  6  2  6  6
## 64086  2  5  5  4  5  4  2  2  5  5  2  2  5  4  5  4  4  4  3  2  5  2  6  6
## 64087  4  4  2  2  3  5  3  5  3  5  4  4  2  4 NA  2  4  5  5  1  6  1  6  6
## 64089  1  6  4  6  5  5  1  2  5  5  2  2  4  6  5  1  1  2  4  5  2  1  5  5
## 64091  1  4  2  1  5  2  1  1  4  4  3  4  4  5  3  2  2  3  4  3  6  1  3  6
## 64092  2  5  3  5  5  5  5  5  3  3  2  2  4  5  5  2  2  2  2  2  5  3  4  2
## 64094  3  4  4  3  4  5  5  3  4  5  4  3  3  3  4  3  4  2  1  2  6  4  5  5
## 64097  1 NA  6  5  6  3  5  4  2  2  1  1  6  6  5  2  2  2  1  4  5  2  6  6
## 64099  4  5  5  5  5  5  5  4  5  6  2  4  5  6  5  4  4  4  5  6  6  4  5  6
## 64100  3  4  4  6  4  4  6  4  2  4  3  3  3  4  4  4  5  4  3  4  5  2  4  3
## 64101  3  5  5  5  5  5  5  4  2  4  6  4  4  5  4  2  3  1  1  2  5  1  5  4
## 64102  2  5  6  6  5  4  4  4  2  2  4  3  5  5  2  2  3  3  2  3  5  2  6  6
## 64103  4  5  5  3  5  5  4  4  3  2  1  1  5  6  5  2  2  4  4  2  5  2  4  5
## 64108  2  6  6  6  6  5  5  4  1  4  1  1  5  6  5  4  4  4  4  4  6  2  5  6
## 64111  1  5  5  6  4  5  5  5  3  3  6  4  5  4  5  3  3  2  1  2  6  4  5  5
## 64113  1  6  6  6  5  1  4  5  1  4  4  2  5  2  6  1 NA  1  1  1  6  1  5  5
## 64116  1  5  4  5  4  4  4  3  3  4  2  2  3  5  3  5  5  5  3  5  4  5  3  4
## 64119  2  5  4  5  4  2  2  3  5  6  2  2  4  5  6  3  4  3  3  2  5  4  5  5
## 64120  2  6  5  5  6  3  1  3  5  6  1  1  6  6  4  4  4  6  4  4  5  4  6  6
## 64122  3  6  6  6  6  6  6  6  1  1  3  1  3  6  6  1  1  1  1  1  6  1  6  1
## 64125  6  4  1  5  1  2  2  1  2  6  5  6  1  1  1  5  4  2  5  2  6  2  2  6
## 64128  3  4  4  4  4  4  3  3  4  4  3  3  4  4  3  3  4  5  5  2  4  4  3  6
## 64129  1  5  6  5  6  5  4  4  2  4  2  5  3  2  5  6  6  6  5  6  6  1  5  5
## 64132  3  2  4  3  4  3  4  5  4  5  4  3  2  4  4  5  5  4  5  3  4  1  4  4
## 64134  3  2  1  2  4  5  5  4  2  4  3  4  5  3  4  2  3  2  3  1  4  2  5  5
## 64136  3  3  4  5  2  5  4  5  2  4  5  2  4  5  4  2  5  4  2  1  5  2  5  6
## 64137  2  5  5  4  5  5  4  2  4  4  2  2  5  5  4  2  4  4  4  2  6  2  5  5
## 64138  2  5  4  5  5  3  4  2  4  4  2  3  4  3  4  2  3  5  4  4  4  4  5  6
## 64141  2  5  5  5  5  5  5  5  4  4  2  3  5  5  5  2  3  2  3  5  6  5  6  6
## 64142  2  6  5  6  4  4  4  4  3  4  2  3  5  4  5  3  4  4  4  4  5  1  5  5
## 64143  2  6  5  6  5  4  5  5  2  1  1  1  4  5  3  2  4  2  4  2  5  2  6  6
## 64144  3  3  1  3  2  2  2  4  3  4  6  6  1  1  1  5  3  4  6  2  5  1  1  5
## 64147  2  4  6  4  5  4  5  4  4  4  1  2  6  3  5  2  4  1  1  1  5  2  6  6
## 64148  3  4  2  4  4  6  6  4  2  4  4  3  3  5  5  2  2  2  2  6  3  4  4  4
## 64150  3  4  3  5  4  3  3  3  3  5  3  3  3  4  3  1  2  1  3  2  3  2  4  4
## 64151  1  5  6  5  5  5  6  5  1  3  2  4  4  5  5  1  3  1  1  5  4  4  5  4
## 64152  1  5  6  5  5  2  1  4  4  6  2  4  5  5  6  1  1  1  3  2  6  2  4  5
## 64154  2  5  6  5  6  6  6  6  1  4  4  4  5  5  5  5  4  5  5  5  5  3  5  6
## 64155  5  4  4  4  5  4  4  5  2  5  2  4  4  5  5  4  4  4  4  2  5  3  5  5
## 64156  1  4  6  6  6  4  4  5  2  2  2  4  3  6  5  1  2  2  2  2  6  1  6  5
## 64158  2  3  1  1  1  4  2  2  4  6  1  6  1  1  2  5  5  2  6  3  2  5  2  5
## 64163  1  6  6  6  4  6  5  6  1  4  1  2  6  4  5  6  5  6  6  4  5  1  5  6
## 64168  1  6  5  5  5  5  2  3  4  4  4  4  4  5  5  1  2  1  4  4  5  4  4  5
## 64169  2  5  6  6  6  6  6  6  2  1  2  1  5  6  6  2  2  2  2  2  5  2  4  1
## 64178 NA  5  4  6  4  4  5  5  2  2  5  6  2  1  1  6  6  6  6  3  1  1  1  6
## 64179  2  4  3  6  6  6  4  2  2  4  2  1  6  5  6  1  2  1  1  1  6  1  6  5
## 64180  4  2  4  4  4  3  4  5  1  1  5  2  4  5  5  4  2  2  2  3  6  2  3  5
## 64185  2  5  4  4  5  5  4  4  3  5  3  4  4  3  6  4  4  4  3  4  5  3  3  5
## 64192  6  5  6  5  6  1  1  1  6  6  6  1  6  3  1  6  6  6  6  6  6  1  6  2
## 64193  2  5  5  6  4  4  3  3  3  5  2  2  6  5  5  5  5  5  4  2  6  1  5  6
## 64195  2  5  5  6  6  5  5  5  1  2  2  2  4  6  6  2  2  3  3  1  5  1  5  4
## 64200  4 NA  5  6  6  4  4  5  2  3  1  1  6  5  6  1  3  3  2  2  6  3  6  5
## 64202  4  2  2  2  4  1  1  2  6  6  2  6  2  2  2  5  5  2  5  6  6  2  6  6
## 64204  2  5  5  6  5  2  4  5  5  2  5  5  4  3  2  1  2  2  5  5  4  1  2  5
## 64206  2  5  5  4  6  5  5  6  1  4  4  2  5  5  3  1  1  2  4  4  6  2  5  5
## 64212  2  5  3  2  3  2  3  5  5  5  4  5  2  3  4  5  5  4  4  4  5  4  3  6
## 64216  4  4  3  5  5  4  4  4  4  6  4  4 NA  3  6  4  3  4  4  4  5  5 NA  6
## 64217  2  5  6  3  5  5  3  2  4  4  1  2  5  5  5  4  4  2  3  2  6  3  4  5
## 64222  1  6  6  6  5  5  4  5  2  2  5  4  4  5  5  2  3  5  4  1  6  3  5  6
## 64226  2  4  4  2  2  4  2  2  4  6  2  2  4  3  5  5 NA  4  2  4  6  5  3  4
## 64228  1  6  6  6  6  4  4  4  2  5  5  2  6  5  6  2  2  2  2  6  3  3  4  6
## 64231  2  6  6  6  6  1  5  5  1  1  1  1  5  6  6  3  2  3  1  3  6  3  4  5
## 64235  2  5  5  6  4  3  2  4  5  4  2  3  4  5  4  2  2  2  5  3  6  3  4  2
## 64236  2  5  3  2  2  4  2  5  5  5  6  6  4  1  2  5  5  4  6  5  4  5  2  5
## 64240  2  5  5  5  5 NA  5  5  1  1  4  5  5  5  5  2  3  1  2  2  6  1  6  6
## 64241  4  5  3  5  4  3  4  5  3  3  5  5  2  4  4  5  4  4  3  4  5  2  4  6
## 64242  2  6  5  5  4  5  4  5  1  2  3  2  4  5  4  1  2  1  2  1  4  3  4  5
## 64243  2  5  3  5  2  2  4  2  5  5  1  4  4  4  6  5  5  5  6  6  6  6  5  6
## 64244  2  6  6  4  2  6  5  5  1  3  5  4  6  5  5  1  1  1  1  1  5  2  6  6
## 64248  2  5  4  6  4  2  3  2  5  4  4  5  2  3  2  4  5  5  5  4  5  5  4  6
## 64250  1  6  6  1  1  6  6  6  1  6  1  6  5  2  6  6  6  6  6  3  6  3  6  6
## 64251  1  5  3  4  4  3  2  4  4  5  6 NA  2  4  2  3  4  4  6  4  5  3  4  5
## 64254  5  5  5  4  6  4  5  4  2  1  1  2  5  6  4  1  3  1  2  1  6  1  6  4
## 64256  1  6  5  4  6  3  6  6  1  1  3  1  4  5  6  4  1  1  2  4  6  1  6  5
## 64261  3  6  3  5  3  4 NA  2  4  4  4  5  3  2  2  5  5  4  5  4  5  2  2  5
## 64263  2  6  6  5  5  5  3  5  4  4  1  1  5  5  5  4  4  2  3  2  5  3  6  6
## 64264  5  6  6  5  5  3  5  6  5  1  5  5  5  3  6  5  6  6  6  6  6  6  6  6
## 64266  2  5  2  4  2  6  1  6  1  2  5  1  2  1  5  5  5  2  4  4  6  1  4  6
## 64267  2  3  3  4  4  5  5  2  2  4  5  5  2  2  2  1  2  2  3  4 NA  1  4  6
## 64274  2  6  6  5  5  5  5  5  1  4  1  2  3  6  2  1  1  2  2  2  4  3  6  6
## 64275  5  5  3  6  6  6  6  5  2  6  4  3  5  5  6  3  4  4  4  3  6  3  6  6
## 64279  3  3  4  2  2  5  5  4  2  2  5  5  4  2  3  3  4  4  4  4  5  2  3  4
## 64280  3  6  4  6  5  4  6 NA  1  1  2  2  4  4  5  2  4  1  2  4  5  1  4  4
## 64284  1  6  6  6  6  5  5  6  2  3  2  1  5  6  6  2  2  4  3  2  5  3  5  4
## 64286  2  6  6  6  6  5  4  5  2  2  4  1  5  5  4  1  2  2  1  1  6  1  5  5
## 64289  2  4  4  5  4  5  6  5  1  1  1  1  6  6  6  1  2  1  1  2  6  4  5  4
## 64290  2  6  6  6  6 NA  6  5  1  1  6  4  5  4  6  1  1  1  1  2 NA  4  5  5
## 64295  2  4  4  4  3  5  5  4  2  6  5  5  3  3  3  3  3  4  5  5  3  2  3  5
## 64296  4  5  5  6  4  4  5  4  3  6  3  6  3  3  4  6  6  6  6  6  6  1  3  6
## 64297  2  4  3  3  3  4  2  3  2  3  3  4  4  6  3 NA  1  3  3  3  2  2  4  5
## 64298  2  5  6  4  6  4  3  4  3  1  2  4  5  5  5  1  1  1  1  2  6  4  5  6
## 64299  2  4  5  4  6  5  5  6  2  2  3  4  4  5  4  1  3  4  4  4  5  4  4  5
## 64300  5  4  3  2  3  4  6  6  5  4  1  1  4  6  6  4  6  2  1  4  4  6  4  5
## 64303  2  4  4  3  5  5  3  4  3  4  1  2  5  6  5  1  1  1  1  2  5  3  4  4
## 64305  2  4  5  6  4  4  5  5  5  2  2  2  5  5  2  3  3  2  2  2  4  2  4  3
## 64308  1  6  6  6  6  6  5  4  1  5  2  1  4  6  4  1  3  3  1  1  5  2  6  6
## 64310  4  6  5  5  3  5  5  5  2  3  1  2  2  3  6  1  4  1  3  2  5  2  5  5
## 64311  3  3  3  4  4  3  4  4  3  4  4  2  4  3  3  1  2  2  4  3  4  4  4  4
## 64312  5  5  2  4  4  5  6  4  2  3  2  2  2  5  3  4  4  5  4  6  3  5  3  5
## 64315  4  4  4  1  5  6  5  3  3  1  3  3  4  6  5  3  1  2  1  1  5  4  4  3
## 64318  5  5  4  5  5  5  5  5  3  4  4  3  3  6  6  2  4  1  2  2  4  5  4  5
## 64320  1  5  5  5  5  5  4  5  2  3  1  1  5  6  3  4  4  2  4  2  5  3  5  5
## 64321  1  6  6  6  6  6  6  6  1  1  1  4  6  4  3  6  6  6  6  6  6  1  6  6
## 64322  3  5  2  1  5  6  2  4  1  1  2  2  4  2  6  1  1  2  1  1  6  1  5  6
## 64323  3  6  4  6  4  1  6  6  1  1  2  4  2  5  4  1  1  1  1  1  4  4  4  5
## 64324  1  6  6  5  6  4  5  4  5  5  3  2  6  5  4  3  4  3  6  4  6  1  6  6
## 64326  2  5  5  4  6  4  6  5  2  4  6  4  4  5  5  2  2  2  4  4  5  4  4  4
## 64327  1  5  5  6  5  3  4  5  4  4  2  4  5  5  4  4  5  4  4  2  4  6  4  6
## 64329  2  5  5  3  5  3  4  5  4  5  3  4  4  4  4  5  6  5  4  5  5  3  5  5
## 64332  2  4  5  2  5  5  3  5  2  3  2  2  4  6  4  1  2  1  3  2  4  2  5  5
## 64333  2  6  6  5  6  6  5  5  1  1  1  1 NA  6  6  1  4  1  1  1  6  2  6  6
## 64334  1  5  6  4  5  4  3  4  3  3  1  3  5  5  4  2  3  3  2  2  6  2  5  6
## 64335  5  4  3  3  4  6  3  6  1  2  4  1  4  3  6  2  3  2  5  1  6  1  6  6
## 64338  2  4  6  5  5  5  4  5  3  4  2  2  5  5  6  3  2  4  2  1  6  2  3  5
## 64339  1  5  6  6  4  4  4  3  2  5  3  3  5  4  4  5  5  6  5  5  5  2  5  6
## 64340  2  6  5  4  5  6  5  6  1  3  2  3  6  6  6  4  3  2  2  3  5  3  4  5
## 64341  4  6  1  6  6  1  1  6  6  6  4  6  4  1  1  4  3  6  5  6  1  6  2  6
## 64342  2  5  5  5  5  4  4  5  4  3  4  4  4  5  5  3  2  2  2  2  5  2  4  5
## 64344  2  6  5  5  4  4  5  4  5  5  5  5  3  2  1  5  5  6  6  2  4  2  2  6
## 64345  3  5  4  4  4  5  5  5  1  2  1  2  3  5  4  2  2  1  1  2  5  3  3  5
## 64347  2  4  5  5  4  4  4  4  3  5  1  2  4  4  3  3  4  4  2  6  4  5  4  1
## 64349  6  6  5  5  4  5  5  4  1  2  5  6  1  4  1  1  4  1  1  1  5  1  5  1
## 64352  1  5  5  6  5  4  4  4  4  4  4  4  4  5  4  2  2  2  3  3  3  2  4  5
## 64356  2  6  4  2  4  4  6  5  2  1  2  5  3  2  5  5  6  4  5  5  3  2  5  5
## 64359  3  5  5  4  5  6  5  5  2  2  4  1  4  6  5  2  2  2  2  2  4  2  1  4
## 64363  2  5  5  5  5  5  4  2  2  4  3  4  5  6  3  3  4  2  2  2  5  3  3  4
## 64365  3  5  5  2  4  5  5  4  3  6  2  4  3  5  3  4  5  4  3  4  4  1  4  5
## 64367  4  4  5  6 NA  4  5  3  2  2  4  2  5  5  5  3  4  6  4  3  4  2  4  5
## 64368  4  5 NA  5  5  5  5  5  5  4  5  4  5  4  5  4  4  4  4 NA  5  4  5  6
## 64370  4  4  4  5  5  5  3  3  3  3  1  2  5  5  5  2 NA  2  2  2  4  5  5  2
## 64371  3  2  3  5  4  5  5  5  2  2  4  5  2  1  2  1  1  2  5  5  3  2  3  5
## 64372  2  4  4  3  5  3  3  3  5  5  4  4  2  1  2  1  4  4  3  2  4  3  1  4
## 64374  3  4  4  4  5  5  3  4  3  3  2  2  3  6  4  2  3  2  3  2  4  3  4  5
## 64375  5  5  5  5  5  3  2  4  4  6  2  2  2  5  4  5  6  5  6  1  5  2  4  6
## 64377  2  2  2  3  2  4  2  4  4  6  6  6  1  1  3  2  5  5  6  2  5  2  5  6
## 64378  2  5  4  6  4  5  5  5  2  5  4  6  4  6  6  4  6  2  6  3  6  1  5  1
## 64379  2  2  4  1  3  1  1  1  6  6  3  4  5  3  2  5  5  6  6  4  6  5  4  6
## 64382  2  5  4  5  4  5  3  4  4  6  3  4  4  3  2  2  2  5  4  2  6  3  5  6
## 64385  1  6  6  6  5  5  4  4  2  2  2  1  5  6  5  2  2  2  4  2  4  2  4  4
## 64389  1  6  6  6  1  3  6  6  1  1  6  6  2  1  6  2  5  4  6  1  6  5  1  6
## 64390  3  4  5  2  5  5  2  5  2  1  3  2  4  4  5  2  2  1  1  1  5  2  6  5
## 64392  1  1  6  6  5  6  5  5  1  2  2  4  5  5  5  2  2  1  1  1  5  2  5  5
## 64393  2  6  6  3  6 NA  5  2  3  6  4  5  6  4  5  4  5  4  5  2  6  3  5  5
## 64396  4  3  1  6  3  3  4  2  2  2  6  5  3  1  6  1  2  4  2  1  6  1  6  5
## 64399  2  1  1  2  4  2  2  4  3  5  6  6  1  1  2  4  4  3  4  4  2  5  1  4
## 64400  1  6  6  6  6  4  3  4  2  4  1  5  4  3  5  1  2  3  4  1  4  1  4  4
## 64401  2  4  4  5  5  6  4  4  2  3  4  3  4  5  4  2  3  4  3  3  4  2  3  4
## 64403  1  5  5  6  5  6  6  5  1  2  2  4  5  5  5  1  2  3  2  2  4  1  6  6
## 64413  5  4  4  5  4  6  6  6  1  1  2  2  4  5  6  5  5  5  4  5  6  1  5  5
## 64414  1  6  5  6  5  5  4  4  2  4  5  3  4  5  5  3  3  2  2  3  5  3  5  5
## 64417  5  6  5  6  6  5  6  5  1  1  1  1  6  6  6  4  4  1  1  1  5  1  5  4
## 64418  3  4  4  5  5  6  4  5  1  3  1  3  3  6  5  3  4  4  5  5  5  3  2  6
## 64421  4  4  4  4  3  5  4  4  2  4  3  1  4  5  4  3  4  2  4  1  5  4  5  6
## 64422  3  5  5  5  5  5  1  5  2  4  3  3  2  4  6  2  2  4  2  1  5  3  5  6
## 64424  3  4  3  6  6  5  4  3  4  3  3  3  4  6  4 NA  3  2  1  3  5  6  4 NA
## 64425  1  6  6  6  6  3  3  2  2  1  2  4  4  5  5  1  5  1  4  2  4  2  3  4
## 64426  2  4  5  2  6  5  5  5  2  4  2  2  6  6  5  2  2  2  2  1  6  1  6  6
## 64427  4  6  6  6  6  6  5  2  1  4  4  1  6  6  4  1  1  1  2  1  5  5  4  6
## 64429  2  5  5  6  5  5  5  5  1  2  2  2  5  5  1  2  2  2  1  1  6  2  5  4
## 64430  3  3  3  5  5  5  5  5  2  3  5  2  3  5  4  3  5  2  4  4  4  2  4  6
## 64431  3  4  5  6  4  3  1  3  4  5  2  4  4  6  5  3  4  2  1  3  4  6  3  6
## 64432  2  3  3  5  5  4  2  4  2  3  4  5  4  3  2  5  4  3  2  4  4  2  4  6
## 64435  2  5  5  6  5  5  5  5  1  2  4  2  5  6  5  1  1  1  1  1  6  4  4  4
## 64436  2  2  5  3  4  5  5  4  2  4  5  2  2  5  3  3  2  3  3  2  4  5  4  5
## 64437  3  6  5  6  5  5  6  5  2  2  2  4  5  4  6  2  2  3  1  2  6  1  5  4
## 64438  4  3  4  3  1  4  1  5  5  5  2  5  5  3  5  1  2  4  3  5  5  6  1  6
## 64439  4  5  4  6  5  6  6  4  1  3  2  4  4  5  6  3  2  5  3  3  5  2  5  5
## 64440  3  4  5  4  5  3  3  2  5  5  2  4  5  6  5  3  4  4  2  2  4  6  4  2
## 64446  2  6  5  3  5  2  4  4  5  6  6  6  1  3  2  6  6  6  6  6  6  5  4  6
## 64450  2  3  4  6  4  3  4  3  3  2  3  4  2  3  4  2  3  2  1  2  4  1  2  5
## 64453  1  6  5 NA  4  5  6  4  4  2  1  4  4  5  3  6  6  6  6  5  3  4  5  6
## 64456  2  4  3  3  5  4  2  4  4  4  2  2  3  4  3  4  5  2  3  3  4  3  4  5
## 64458  1  2  6  4  6  2  6  1  5  6  1  2  5  6  4  6  5  5  6  5  6  1  6  6
## 64459  5  5  5  3  5  4  4  5  4  4  5  4  2  3  5  3  4  4  4  5  5  5  4  2
## 64460  2  5  5  6  4  2  5  4  3  4  3  2  5  5  5  2  4  3  2  3  5  3  5  5
## 64461  1  5  5  4  6  6  5  6  1  1  2  4  4  5  4  1  3  3  4  5  4  2  5  5
## 64462  3  5  4  5  6  5 NA NA  4  5  2  1  5  6  4  1  1  5  4  1  6  1  5  6
## 64463  1  6 NA  6  5  4  5  6  4  1  4  5  3  6  4  1  4  1  1  4  3  5  4  2
## 64464  2  4  5  6  5  5  6  4  2  4  2  5  5  5  4  3  4  5  5  4  6  5  5  6
## 64466  1  6  4  4  4  4  4  5  2  2  1  2  5  5  5  3 NA  3  2  4  6  2  5  2
## 64467  3  4  5  4  6  3  4  4  4  4  4  4 NA  5  4  2  4  3  3  3  4  3  4  5
## 64468  3  5  5  5  5  5  5  4  2  2  2  2  4  6  5  2  2  2  2  2  4  2  5  4
## 64469  5  6  6  1  6  5  6  2  5  6  1  1  6  6  6  1  5  5  5  4  6  4  6  6
## 64471  4  6  5  2  5  6  5  6  2  5  3  4  6  4  6  6  6  6  6  5  6  4  6  6
## 64479  2  4  4  3  4  3  2  3  4  6  6  5  4  2  4  4  4  4  4  2  5  4  4  4
## 64481  1  6  6  6  4  6  4  6  1  1  1  1  4  5  6  2  3  3  2  2  5  1  4  6
## 64483  2  1  3  4  6  6  5  5  1  1  1  1  6  6  6  2  6  1  1  1  6  1  6  6
## 64484  1  6  5  6  4  5  2  4  1  4  4  4  4  5  4  1  1  1  4  5  4  4  4  5
## 64487  3  6  6  6  5  4  4  6  1  3  4  4  5  3  5  4  5  3  4  6  5  3  5  5
## 64488 NA  6  5  4  6  5  2  6  2  1  2  1  4  6  6  5  5  1  4  3  6  1  3  1
## 64490  1  5  5  5  5  5  4  5  4  4  1  1  4  6 NA  3  4  4  4  1  5  2  6  6
## 64491  3  5  5  6  4  5  5  5  2  2  2  2  4  5  5  2  2  1  2  2  5  2  5  6
## 64493  2  4  5  5  3  6  4  2  5  5  5  6  3  2  5  2  2  1  3  3  6  2  5  6
## 64495  3  5  4  6  5  5  5  6  1  1  6  6  2  2  4  4  4  2  4  4  5  1  5  6
## 64496  2  4  2  1  2  6  6  3  3  2  5  6  2  2  3  2  4  1  2  1  6  2  3  5
## 64499  2  4  2  1  3  6  6  3  2  2  4  5  4  2  4  1  4  2  1  1  6  2  4  5
## 64501  5  5  4  3  4  4  3  4  4  6  3  4  4  5  6  6  6  5  4  4  5  2  4  4
## 64507  1  5  5  5  4  4  4  5  3  5  6  6  2  4  3  2  5  5  5  5  5  2  4  5
## 64508  3  4  3  5  5  5  5  4  4  5  4  2  4  4  3  4  4  4  3  4  3  2  5  5
## 64510  4  5  4  4  5  5  5  6  1  1  3  1  4  6  6  4  2  1  1  5  6  2  5  5
## 64511  1  6  5  6  6  6  6  6  1  1  5  4  3  5  5  5  3  2  4  4  5  2  4  5
## 64512  1  6  5  6  2  6  6  6  2  4  6  6  3  1  4  5  5  6  5  5  6  4  6  6
## 64513  2  6  6  4  6  5  6  4  2  4  5  2  6  6  6  1  2  2  4  1  5  2  6  6
## 64514  5  6  5  5  4  4  6  4  2  2  2  2  4  4  4  3  3  4  4  5  4  3  3  6
## 64516  3  5  5  4  5  4  2  4  3  4  1  4  4  4  5  1  4  1  1  1  6  3  5  6
## 64518  1  6  6  6  6  6  5  5  1  2  3  1  4  5  5  1  3  5  4  4  3  4  5  6
## 64519  2  5  4  6  5  1  5  5  1  2  3  1  5  2  2  1  1  1  1  1  2  1  5  4
## 64520  5  2  3  2  2  6  6  6  1  1  3  4  4  2  6  1  1  1  2  1  5  1  6  5
## 64522  1  6  5  6  5  5  5  4  4  5  2  2  2  5  5  5  5  3  4  5  5  5  4  5
## 64525  1  6  6  6  6  6  2  2  5  6  1  2  5  6  4  2  2  1  1  4  5  6  3  5
## 64528  3  5  5  6  5  4  5  5  1  3  1  2  5  6  6  1  1  2  1 NA  6  2  6  6
## 64530  5  2  2  4  3  5  4  4  2  2  3  3  3  3  3  3  2  4  2  2  5  3  3  4
## 64532  4  5  5  1  6  4  2  3  3  2  4  4  4  6  5  1  4  1  1  1  4  2  4  5
## 64537  3  5  3  5  4  6  5  4  1  1  2  2  3  5  5  3  4  3  3  3  4  3  3  5
## 64540  1  6  6  6  6  6  5  6  1  2  4  4  4  6  4  1  1  1  1  1  4  3  5  6
## 64541  2  5  5  6  6  2  2  2  4  4  1  1  5  6  5  2  2  2  2  2  6  4  5  4
## 64543  1  6  5  6  6  3  4  2  3  5  1  1  6  6  6  2  2  3  3  3  5  2  5  4
## 64544  1  6  6  4  6  4  2  4  2  4  1  2  4  5  4  1  2  3  3  3  5  2  5  5
## 64545  5  5  5  6  6  6  6  6  1  1  6  4  4  4  2  1  1  1  1  2  6  2  3  5
## 64546  6  1  1  2  1  5  5  5  3  4  6  6  1  1  3  2  2  2  1  3  4  2  2  6
## 64547  1  6  6  5  6  5  5  2  1  5  2  2  5  5  5  1  1  1  4  1  5  4  5  5
## 64548  2  4  5  3  3  4  5  4  3  6  3  5  4  5  4  1  2  3  2  3  5  6  3 NA
## 64549  1  6  6  6  6  5  5  6  2  1  1  2  5  6  4  2  1  2  4  3  5  1  5  5
## 64552  2  5  4  5  4  2  2  3  3  5  3  4  3  3  5  5  5  4  6  5  5  5  3  6
## 64555  2  6  6  6  6  6  5  6  2  5  1  1  6  5  6  5  4  5  5  1  5  1  6  6
## 64556  1  6  6  6  5  6  5  5  2  4  2  5  4  5  5  2  5  2  3  2  4  1  6  6
## 64557  2  4  5  2  4  3  4  3  5  5  2  4  3  4  4  4  4  2  5  3  2  6  5  3
## 64562  5  3  4  2  4  2  2  4  4  5  2  3  3  4  2  2  3  2  3  3  5  5  2  3
## 64563  1  6  6  5  6  4  4  6  4  2  1  5  5  5  4  3  4  5  3  6  4  6  5  6
## 64564  1  5  5  6  4  6  5  3  2  3  3  3  6  4  4  3  2  6  4  2  4  2  5  5
## 64565  1  6  6  6  4  5  4  6  1  1  6  5  5  4  6  4  4  1  1  3  4  1  4  6
## 64567  1  4  3  5  3  5  6  5  4  5  2  4  2  2  6  5  5  5  6  6  6  5  5  6
## 64568  2  5  4  6  5  5  5  4  2  4  2  5  4  6  4  4  5  5  4  5  6  2  5  6
## 64571  1  5  6  6  6  5  3  4  2  5  2  4  6  4 NA  5  6  5  5  4  4  5  6  6
## 64572  4  4  1  2  2  4  4  6  3  4  2  5  4  2  5  6  6  4  6  4  6  1  4  5
## 64573  4  4  3  3  4  4  3  5  4  5  4  4  4  3  5  2  2  3  2  2  5  1  5  6
## 64577  3  2  4  4  4  6  5  4  3  1  4  3  4  5  4  3  4  4  4  4  4  2  4  6
## 64579  4  1  1  1  3  3  4  1  4  5  6  6  4  1  2  6  6  5  5  5  6  2  1  6
## 64581  6  4  6  6  5  6  5  5  1  1  5  1  2  5  5  6  4  4  2  2  4  1  5  6
## 64583  1  6  6  6  5  2  3  3  1  4  3  2  4  6  3  1  3  1  2  4  5  2  5  5
## 64585  3  5  5  6 NA  5  5  5  2  2  2  2  5  6  6  2  3  2  2  6  4  5  5  4
## 64586  1  4  4  4  4  4  4  5  3  4  4  4  2  2  3  2  3  3  4  3  5  2  5  5
## 64588  6  3  4  1  5  6  5  3  5  3  1  2  4  6  6  6  6  6  6  5  6  3  5  5
## 64591  1  5  4  3  4  6  6  5  2  5  4  5  1  4  4  2  4  4  4  5  4  2  4  6
## 64593  2  5  5  4  4  4  5  5  2  3  3  3  4  4  4  2  2  2  3  3  4  2  4  4
## 64595  4  2  4  4  2  3  4  4  3  4  5  4  2  3  4  1  3  1  4  2  4  3  4  4
## 64600  1  6  5  5  6  1  5  1  2  5  1  1  5  6  4  1  1  1  2  5  6  5  5  6
## 64603  2  4  4  5  3  6  4  4  2  5  3  3  2  5  3  2  3  3  2  1  6  4  4  6
## 64605  5  4  5  2  5  6  5  4  1  6  2  5  6  2  6  6  6  6  5  6  6  1  6  6
## 64606  1  6  5  2  5  3  4  2  4  5  1  1  4  6  4  4  5  3  5  4  6  2  5  6
## 64607  4  5  4  6  6  6  5  4  2  3  3  2  4  6  5  2  2  2  2  2  3  2  3  4
## 64612  1  5  5  6  5  4  5  4  3  4  2  3  5  5  6  3  3  3  4  1  6  2  6  5
## 64614  1  6  5  5  5  2  3  3  2 NA  5  3  5  3  5  1  1  2  4  2  5  1  4  5
## 64618  2  4  6  6  6  3  4  4  3  3  2  5  6  6  5  4  4  4  4  5  5  3  6  6
## 64620  3  6  3  5  4  2  5  5  2  5  2  2  4  5  5  5  6  6  5  5  6  2  4  5
## 64621  3  6  3  6  1  6  6  5  1  1  1  1  1  2  6  3  4  3  4  5  5  4  1  4
## 64622  1  5  5  4  2  2  6  6  4  4  2  5  1  3  5  3  4  2  6  4  5  2  2  6
## 64623  3  5  6  6  5  4  4  4  3  6  1  4  5  5  5  5  5  4  3  3  6  1  3  6
## 64626  1  6  5  4  5  5  5  4  3  4  3  2  3  5  5  2  2  2  1  2  5  2  4  5
## 64627  2  4  3  4  4  5  5  6  1  3  3  4  4  4  3  2  5  4  2  4  5  2  4  3
## 64630  2  6  6  6  6  4  6  6  1  1  2  2  4  5  5  1  4  2  3  2  5  2  4  4
## 64634  3  3  2  4  3  4  1  2  4  4  4  6  2  2  3  6  6  5  5  3  3  4  2  5
## 64636  5  6  3  6  3  5  5  6  1  1  5  2  3  5  5  2  3  3  2  2  5  4  3  5
## 64638  3  2  4  2  2  3  2  6  2  5  5  6  3  2  1  3  4  4  5  4  2  1  2  5
## 64639  1  6  5  4  5  4  4  6  2  5  4  4  4  5  4  1  4  6  2  1  4  4  3  6
## 64642  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
## 64648  1  6  6  5  5  6  6  5  1  2  1  2  4  5  6  4  5  4  2  4  6  1  5  5
## 64652  1  6  6  6  6  5  5  5  1  4  1  1  6  6  5  1  1  2  2  2  6  1  6  6
## 64656  4  6  5  5  6  6  6  4  3  4  2  2  5  5  5  3  3  5  2  5  6  2  5  6
## 64658  2  5  4 NA  5  5  3  5  3  5  6  6  2  1  5  2  2  4  4  2  5  3  4  6
## 64660  2  5  5  6  5  5  6  6  1  1  5  4  3  4  5  4  5  5  6  6  5  6  4  6
## 64661  2  4  4  4  4  5  5  4  1  2  4  4  4  2  4  1  1  1  1  1  6  1  5  6
## 64664  4  5  3  4  2  5  5  6  1  4  6  5  1  1  5  4  4  2  4  1  6  1  2  6
## 64665  1  5  5  5  5  4  4  6  2  4  2  1  4  6  5  5  4  4  4  3  4  2  5  6
## 64668  3  3  2  2  3  3  5  4  3  5  6  6  1  2  2  1  3  4  6  5  6  2  4  6
## 64669  2  5  3  3  2  6  5  6  2  5  6  6  4  2  1  2  3  4  4  4  3  2  2  6
## 64670  2  4  3  2  3  5  5  4  2  4  4  5  3  3  3  5  5  5  5  4  6  1  3  6
## 64671  2  4  4  5  3  3  3  5  3  4  2  3  4  4  5  5  5  5  2  3  3  5  3  4
## 64673  2  3  1  1  4  6  6  4  2  6  5  5  2  1  1  2  4  4  5  1  6  2  1  6
## 64675  1  4  5  2  2  3  2  2  4  5  4  5  3  2  2  2  3  2  4  1  3  2  5  5
## 64679  4  5  3  4  4  5  4  5  2  3  2  3  4  4  5  3  2  2  4  2  5  2  5  5
## 64680  1  5  5  6  4  5  5  5  3  6  5  5  3  4  6  4  4  4  5  4  4  2  6  5
## 64682  2  4  6  6  5  5  4  4  2  1  3  2  6  5  5  1  2  1  4  2  6  4  5  2
## 64683  3  2  2  6  5  5  2  6  1  1  5  1  6  6  6  1  1  1  1  1  6  1  6  6
## 64685  1  5  5  6  6  6  6  6  1  1  1  1  2  6  6  1  2  2  2  1  6  1  6  5
## 64686  5  4  4  3  1  4  5  1  5  6  6  6  1  4  1  4  4  3  5  6  2  5  3  6
## 64688  2  5  3  5  5  5  3  5  2  4  4  6  2  2  4  3  5  1  2  4  5  2  5  6
## 64689  4  4  5  3  4  1  1  4  6  5  6  6  1  2  2  2  4  2  6  2  2  5  4  3
## 64693  4  5  3  4  3  4  2  5  5  5  5  4  3  3  4  4  5  5  4  3  4  4  3  4
## 64696  1  5  5  6  4  5  5  5  2  1  4  3  3  4  4  1  2  2  2 NA  4  2  2  4
## 64697  1  3  3  5  3  5  5  6  2  1  6  5  1  2  5  2  4  3  3  2  3  4  2  3
## 64698  5  6  6  6  5  5  5  4  1  4  1  1  5  6  6  1  2  4  1  2  6  1  5  6
## 64702  1  4  3  6  4  6  6  4  1  2  2  5  5  2  4  3  3  3  4  1  5  2  5  5
## 64706  2  3  4  6  5  4  4  4  2  2  5  2  3  2  4  3  2  3  2  1  4  3  5  6
## 64707  4  4  2  1  3  5  4  2  3  5  4  6  2  2  3  2  3  5  3  2  6  1  4  6
## 64709  3  6  5  6  5  5  5  6  3  1  2  1  3  6  5  4  3  4  2  6  4  4  3  4
## 64712  4  5  5  5  6  3  5  3  5  6  6  6  6  1  4  1  4  2  5  1  6  6  5  6
## 64714  1  5  4  6  4  3  2  2  4  5  3  2  5  5  4  4  5  4  3  3  4  2  4  6
## 64715  6  2  4  6  3  4  4  5  5  5  6  6  2  3 NA  5  5  5  4  1  5  2  3  6
## 64716  2  6  6  6  6  4  3  4  4  5  4  2  6  6  3  4  2  3  4  1  6  2  6  5
## 64718  2  4  2  4  4  2  5  2  2  6  2  5  1  3  2  3  6  4  4  4  2  3  1  2
## 64720  1  6  6  6  5  5  3  5  1  1  1  3  5  4  6  2  5  4  1  2  5  1  5  5
## 64724  3  6  6  4  3  1  6  6  1  1  1  1  5  3  1  1  6  2  2  3  5  4  6  4
## 64725  1  4  5  5  5  5  3  4  6  4  5  6  5  2  4  4  4  5  5  3  5  2  2  6
## 64727  3  4  4  4  4  4  5  5  5  5  4  3  3  4  4  6  6  5  5  6  4  5  5  5
## 64729  4  5  1  2  2  5  4  4  2  6  2  3  5  2  5  6  6  6  4  6  4  3  3  4
## 64730  2  6  4  6  5  5  5  5  1  4  1  2  4  6  6  5  4  4  1  4 NA  2  4  6
## 64733  3  5  5  4  5  3  2  2  4  6  2  2  5  6  5  4  3  2  3  2  6  2  5  5
## 64735  2  5  4  6  3  5  3  4  3  4  2  4  2  2  6  5  5  2  4  1  6  1  6  6
## 64737  1  5  2  4  2  5  4  4  4  6  5 NA  2  2  2  1  2  3  4 NA  5  5  3  6
## 64738  4  5  4  3  3  5  2  4  5  5  4  5  2  5  2  6  6  6  5  5  4  4  5  6
## 64739  5  4  2  2  3  4  4  6  3  5  5  6  2  3  2  1  2  1  2  1  3  4  4  6
## 64742  2  6  5  4  6  5  4  5  5  5  1  2  5  5  5  2  5  2  1  2  6  4  5  1
## 64744  2  5  5  5  5  5  5  5  2  3  1  2  5  5  5  2  3  3  4  4  5  4  4  5
## 64747  1  5  4  4  4  4  3  4  2  2  3  3  3  3  4  2  4  2  2  2  3  2  5  6
## 64753  4  6  5  5  5  3  2  1  5  6  2  6  1  1  1  6  6  6  6  6  4  2  2  6
## 64754  2  5  6  6  5  3  4  2  2  2  2  2  5  5  5  2  2  1  1  2  3  3  5  2
## 64758  1  4  5  3  4  4  5  4  2  4  4  5  2  3  3  3  4  2  5  4  4  3  4  4
## 64759  1  5  5  4  5  5  6  5  2  2  4  5  2  4  3  2  3  2  5  3  4  2  4  5
## 64763  1  6  6  5  4  5  5  4  2  4  1  3  5  5  4  5  4  5  4  5  6  3  5  6
## 64768  2  4  5  6  5  6  6  5  4  1  1  1  3  6  6  2  2  4  1  1  5  1  5  5
## 64769  5  2  2  6  6  6  5  5  5  2  2 NA  5  5  2  1  2  1  2  1  5  5  4  5
## 64770  2  4  4  1  3  5  6  5  1  3  4  4  3  4  4  5  6  1  6  1  3  1  5  6
## 64771  1  6  5  5  6  5  3  5  1  4  1  2  4  5  4  2  4  2  2  2  5  2  5  5
## 64772  3  4  5  4  5  4  3  3  3  5  1  2  4  4  6  4  3  2  4  2  6  1  6  6
## 64773  2  6  5  5  6  4  4  4  3  4  4  3  5  5  5  2  4  4  5  3  5  3  5  5
## 64774  2  5  4  1  6  5  3  5  4  5  2  3  6  4  4  2  3  3  3  1  6  4  6  5
## 64780  1  4  5 NA  5  4  1  6  5  3  1  1 NA  6  4  6  6  5  2  6  3  3 NA  5
## 64804  2  5  5  6  3  4  5  5  1  2  5  3  2  3  5  3  4  4  3  4  5  2  3  5
## 64807  4  6  6  6  5  6  6  5  1  1  3  1  4  6  6  6  6  3  1  1  5  3  6  6
## 64810  4  2  1  4  1  3  2  1  2  1  6  6  2  1  5  1  1  1  1  1  5  1  6  4
## 64814  2  4  2  2  4  2  2  4  2  5  5  6  3  2  2  1  2  1  2  1  4  1  5  6
## 64815  5  3  2  2  3  5  3  5  3  4  4  4  4  3  3  4  4  4  3  4  4  3  3  4
## 64817  5  4  4  6  4  6  6  3  2  2  2  2  4  6  4  4  4  5  1  1  4  1  2  4
## 64819  4  4  4  5  4  4  4  4  2  4  4  4  4  4  4  4  5  5  2  3  4  3  4  4
## 64822  2  6  6  6  5  5  5  5  1  3  2  2  5  6  4  1  1  1  2  1  5  1  4  4
## 64824  2  5  5  6  6  5  5  2  2  2  2  2  5  6  4  1  1  4  5  4  5  5  5  5
## 64825  4  5  4  5  4  5  5  6  1  1  2  1  3  5  5  3  2  2  4  5  5  4  4  4
## 64826  4  5 NA  6  5  6  5  4  3  4  3  4  4  5  5  5  5  5  4  3  5  3  5  5
## 64830  2  1  4  2  4  6  6  5  6  3  5  5  6  4  2  4  2  6  2  2  5  1  5  6
## 64831  2  1  4  1  4  6  6  5  6  3  5  5  6  3  2  2  2  6  2  2  5  1  5  6
## 64835  1  5  6  5  6  1  1  1  6  6  6  6  6  5  2  6  5  6  6  6  6  1  6  6
## 64838  1  6  6  5  6  5  5  5  2  4  1  1  6  6  5  2  3  4  3  2  4  1  6  4
## 64839  6  6  1  6  5  2  3  4  3  1  1  2  6  1  6  3  4  3  1  2  6  1  6  6
## 64842  3  6  6  5  6  5  6  1  3  6  3  2  6  6  6  3  6  1  5  1  6  1  6  6
## 64843  2  6  6  5  5  5  5  4  2  2  2  2  5  5  6  1  2  2  2  1  6  2  5  5
## 64844  4  2  5  6  1  6  2  1  4  6  1  2  4  5  4  6  6  6  1  5  5  6  3  5
## 64845  1  5  5  4  4  5  5  4  3  4  4  2  4  4  4  2  2  4  4  4  5  2  5  6
## 64846  2  6  4  1  5  5  4  3  2  4  4  5  3  4  4  2  5  3  2  3  5  5  3  2
## 64847  4  5  4  2  6  6  6  6  2  2  5  2  5  4  5  2  3  4  5  4  6  1  6  6
## 64849  1  3  5  5  5  3  3  4  4  4  5  4  6  5  3  1  4  2  5  4  5  2  6  5
## 64850  2  5  4  5  4  5  5  4  5  5  3  6  4  5  4  6  6  6  6  6  4  5  5  4
## 64852  1  6  4  4  5  5  5  6  2  1  4  2  4  6  4  2  5  5  3  1  4  4  4  6
## 64857  1  4  3  6  5  5  4  2  4  5  5  5  1  1  5  6  5  5  6  4  6  3  4  6
## 64861  4  6  4  5  5  5  4  2  2  6  1  1  5  6  6  4  5  6  3  5  5  4  4  5
## 64865  2  5  3  4  4  5  5  3  3  3  2  4  4  3  6  4  4  3  4  3  6  2  6  5
## 64866  1  5  2  4  2  6  4  5  1  2  5  6  1  1  2  2  1  2  4  4  6  2  5  6
## 64874  2  4  3  5  4  4  4  6  2  1  5  2  4  5  4  1  2  1  2  1  5  2  5  2
## 64876  2  5  6  6  5  6  5  3  1  5  3  1  5  6 NA  3  6  4  2  3  5  1  4  5
## 64877  2  4  4  4  2  6  6  5  1  2  2  1  4  5  5  2  3  5  6  2  6  4  4  6
## 64880  4  2  1  1  2  1  2  1  5  6  6  6  4  1  1  6  6  4  6  6  5  3  1  6
## 64886  2  5  6  5  6  6  5  6  1  1  2  1  4  5  6  5  5  5  2  3  6  2  5  5
## 64887  3  5  4  4  4  5  5  4  2  5  2  4  2  5  6  5  6  4  3  3  5  1  5  6
## 64888  3  3  2  5  2  5  5  1  4  6  3  5  5  4  5  6  6  6  5 NA  6  3  4  6
## 64890  4  5  5  5  4  4  3  5  3  2  1  1  5  5  5  1  1  3  4  1  6  1  6  5
## 64891  4  4  5  2  6  5  2  4  3  6  5  6  5  2  5  6  6  5  4  4  5  3  5  6
## 64894  4  4  5  1  5  3  5  2  2  5  1  2  5  5  4  1  2  4  1  2  4  5  3  4
## 64898  1  4  5  6  4  4  5  5  2  6  3  3  4  4  4  2  3  1  2  1  5  3  4  5
## 64902  5  2  4  3  3  2  1  4  4  3  2  2  4  5  3  4  4  6  2  1  4  1  5  4
## 64907  3  5  2  4  5  5  4  5  3  2  4  5  2  2  5  1  1  1  1  1  6  2  5  5
## 64912  1  6  5  6  4  4  3  2  4  5  1  2  5  6  5  5  5  5  4  4  4  4  5  5
## 64914  2  6  5  3  5  5  2  3  6  5  4  5  4  4  5  5  4  5  4  4  5  6  5  5
## 64915  3  5  4  6  5  5  5  3  2  4  3  3  4  6  4  6  6  4  3  3  5  2  4  6
## 64917  1  6  6  5  5 NA  5  5  3  4  5  4  5  2  3  2  4  2  2  5  4  4  5  6
## 64918  1  5  5  6  5  4  5  2  3  4  5  4  2  3  3  2  4  4  3  4  4  2  2  5
## 64919  1  5  3  4  4  6  6  6  1  6  1  6  3  1  4  6  6  6  6  6  6  3  5  6
## 64920  3  4  5  6  3  6  6  5  1  2  3  1  5  5  5  2  2  2  1  1  6  2  5  2
## 64921  3  6  6  3  6  2  3  3  4  4  2  2  5  4  5  4  5  5  2  2  4  4  5  5
## 64926  4  5  2  1  4  5  2  2  3  6  2  3  4  5  5  4  5  2  4  6  5  1  5  2
## 64931  5  6  5  3  6  5  6  4  2  4  2  4  4  4  6  1  2  1  3  4  5  5  3  4
## 64936  1  6  5  6  6  6  5  5  2  5  4  2  5  6  5  4  5  4  4  6  6  3  6  6
## 64937  4  4  5  2  5  5  6  4  3  2  3  2  5  5  5  2  4  4  3  2  5  3  4  4
## 64938  1  6  6  6  6  5  5  5  1  4  2  1  5  6  5  2  4  1  1  1  5  5  6  6
## 64939  4  5  6  5  6  3  2  2  3  6  6  4  4  5  4  5  4  5  5  2  4  6  1  6
## 64940  4  3  3  2  2  4  3  5  2  2  5  5  2  3  3  2  5  6  3  5  2  4  2  3
## 64944  6  4  5  6  5  4  6  6  5  4  1  2  1  5  4  5  6  5  2  4  6  5  5  5
## 64946  6 NA  6  4  5  6  4  5  6  3  4  4  6  6  3  6  4  6  2  5  4  4  3  6
## 64949  1  5  5  4  6  6  6  5  2  1  4  1  5  5  5  1  1  3  3  3  6  1  6  5
## 64950  3  3  3  4  4  4  3  3  4  5  2  3  4  4  4  3  4  2  4  2  4  3  6  6
## 64952  1  6  4  3  5  4  5  4  2  5  2  2  4  5  4  2  3  4  2  2  4  1  5  4
## 64953  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5  5
## 64954  1  6  6  3  6  6  5  5  2  5  2  2  5  5  5  5  6  5  5  5  4  2  4  6
## 64958  5  6  6  1  6  5  6  5 NA  6  1  5  5  5  5  2  3  6  6  4  6  2  5  6
## 64960  1  6  6  6  6  5  5  3  5  5  5  2  4  5  6  2  2  5  2  1  5  3  5  6
## 64961  1  4  3  3  4  5  4  5  2  4  2  4  4  2  3  2  2  2  4  1  6  2  6  6
## 64962  1  6  6  1  1  5  6  6  4  6  1  6  6  1  6  6  6  6  6  6  6  6  4  6
## 64963  3  4  4  4  4  6  5  4  1  1  3  4  5  5  5  1  1  1  1  1  5  2  5  4
## 64967  1  6  6  6  6  5  6  2  5  2  5  2  5  6  6  2  5  4  4  4  5  2  6  6
## 64968  6  5  5  6  6  5  6  6  5  6  3  6  5  6  6  5  6  4  5  5  5  6  5  6
## 64969  6  5  5  6  6  5  6  6  5  1  3  6  5  6  6  5  1  4  5  5  5  1  5  6
## 64970  6  2  5  6  6  5  6  3  5  1  3  6  5  6  2  5  1  4  5  5  5  1  5  6
## 64971  6  2  5  6  6  5  6  6  1  1  3  6  5  6  2  1  1  4  2  5  5  1  5  6
## 64975  6  2  5  6  6  5  4  6  1  1  3  6  5  6  2  1  1  4  2  5  5  1  5  6
## 64978  6  2  5  6  6  5  4  6  1  1  3  6  5  6  2  1  1  4  2  3  5  1  3  6
## 64979  6  2  5  6  6  5  4  6  1  1  3  6  5  6  2  1  1  4  2  6  5  1  6  6
## 64980  6  2  5  6  6  5  4  6  1  1  3  6  5  6  2  1  1  1  2  6  5  1  6  1
## 64981  6  2  5  6  6  5  4  6  1  1  3  6  5  6  2  1  1  6  2  6  5  1  6  6
## 64982  6  2  5  6  6  5  4  6  1  1  3  1  5  6  2  1  1  6  2  6  5  1  6  6
## 64984  3  4  4  1  4  5  4  5  4  3  4  3  3  3  5  1  2  2  2  3  4  3  2  2
## 64987  1  5  1  6  2  5  5  5  3  5  4  6  1  3  4  5  5  6  5  5  4  3  5  5
## 64990  2  5  5  5  2  5  6  5  4  4  1  6  5  5  6  6  6  6  6  6  4  4  6  2
## 64991  2  5  5  6  5  5  6  6  4  2  1  3  3  5  6  5  4  5  3  6  6  4 NA  6
## 64992  2  5  4  4  4  4  4  5  3  3  4  4  4  4  2  3  3  4  2  4  4  4  4  4
## 64993  4  5  4  4  3  4  3  3  2  4  2  4  4  2  5  5  5  5  6  2  4  2  5  5
## 64996  1  1  4  6  6  6  6  4  1  1  5  2 NA  6  5  1  2  4  1  1  4  1  4  1
## 64997  3  6  5  6  6  6  5  5  1  2  3  2  5  5  6  1  2  1  1  2  6  3  4  4
## 65017  4  5  4  4  4  5  5  4  2  3  2  4  4  5  5  2  2  5  4  3  4  5  4  5
## 65018  1  6  6  4  5  3  2  5  4  2  1  2  5  3  6  1  1  2 NA  2  5  2  6  6
## 65020  5  5 NA  5  4  5  5  5  2  5  5  4  1  4  6  2  4  2  2  2  3  4  4  4
## 65022  4  4  4  4  3  4  4  4  3  2  3  4  1  2  5  2  2  2  2  2  4  3  5  6
## 65025  2  5  5  6  5  5  5  5  1  1  3  2  5  5  6  1  1  1  2  2  6  4  4  4
## 65026  5  4  3  4  3  4  2  2  3  2  6  4  4  4  2  2  4  1  4  2  6  1  4  6
## 65027  4  4  4  5  5  4  4  4  2  5  2  2  5  4  5  2  1  2  2  2  3  3  3  2
## 65028  4  1  5  2  5  6  5  2  2  3  6  4  5  3  3  4  5  4  5  2  6  1  6  6
## 65033  3  5  3  6  4  4  3  2  2  5  2  4  3  3  2  1  1  5  4  2  4  3  2  3
## 65041  3  5  1  4  4  4  4  4  2  2  3  4  4  4  3  2  4  5  3  5  3  2  4  4
## 65042  2  4  6  5  5  5  5  5  5  1  2  2  6  5  6  3  2  3  2  2  6  2  5  5
## 65044  2  4  4  6  4  5  6  1  4  6  4  4  1  4  4  6  6  5  5  3  2  5  6  6
## 65047  3  2  2  2  4  5  5  5  3  2  2  2  5  5  5  2  3  2  3  1  6  2  5  6
## 65049  5  3  1  1  3  5  2  5  3  5  3  5  4  3  4  4  5  2  3  4  3  3  3  6
## 65050  1  6  4  6  4  6  6  5  2  1  1  4  5  5  5  4  4  4  4  5  6  1  6  6
## 65052  1  5  5  6  3  5  4  2  2 NA  1  4  4  5  4  3  5  3  2  2  4  1  6  6
## 65054  2  5  4  6  4  5  3  4  3  3  3  3  4  5  4  2  2  2  4  3  3  3  4  5
## 65056  2  6  5  6  5  5  5  5  5  4  3  2  2  4  5  4  3  5  6  2  6  1  6  6
## 65058  3  4  3  1  3  4  3  4  3  4  1  3  4  1  5  4  4  3  4  4  6  1  6  6
## 65059  5  4  5  4  4  4  4  5  2  3  4  3  3  4  4  2  2  1  3  1  5  2  5  6
## 65060  2  5  6  6  6  5  5  5  5  1  3 NA  6  4  6  2  2  1  1  3  6  4  6  6
## 65061  4  4  5  6  2  5  5  5  2  5  4  4  5  6  5  5  6  5  5  1  5  1  6  6
## 65070  2  5  6  5  5  4  4  6  2  4  3  6  3  2  5  5  6  3  4  2  4  1  5  6
## 65071  1  5  5  5 NA  1  6  6  4  5  4  6  1  5  4  4  6  6  6  5  5  6  6  6
## 65075  1  6  6  6  6  6  6  6  1  1  5  1  5  5  6  1  1  5  6  1  5  1  5  5
## 65078  3  6 NA  6  4  6  5  6  1  6  4  3  4 NA  6  4  3  4  5  4  6  4  4  6
## 65079  2  6  5  6  5  6  6  6  1  1  5  1  5  6  6  1  1  1  6  1  5  1  5  5
## 65080  3  4  2  4  1  6  6  5  1  1  6  6  1  2  5  2  4  2  2  5  4  2  2  6
## 65081  1  5  5  5  5  4  4  4  3  6  2  3  4  4  5  1  1  5  4  3  5  2  6  6
## 65082  4  4  5  5  6  5  5  4  2  3  4  5  5  3  4  1  2  3  3  2  6  2  4  5
## 65083  1  5  4  5  4  6  5  6  2  4  5  5  2  5  5  3  3  2  2  1  4  4  4  6
## 65084  1  4  4  3  6  5  4  4  4  4  3  6  2  5  5  3  5  2  2  3  2  4  5  6
## 65086  2  4  4  2  6  3  3  5  5  5  3  1  4  5  3  4  6  6  6  2  6  3  5  6
## 65087  2  5  2  1  2  6  6  3  1  1  1  2  5  5  6  1  1  2  1  1  6  1  6  6
## 65088  2  5  4  5  5  5  5  5  1  2  3  2  5  5  5  2  2  2  2  4  5  3  5  5
## 65091  2  4  4  3  4  5  4  3  3  4  3  4  5  4  3  3  4  4  3  4  6  4  6 NA
## 65092  2  4  4  4  5  5  4  4  2  5  4  4  3  3  5  4  3  2  3  2  5  2  4  5
## 65096  3  6  5  6  5  4  4  4  2  2  1  2  5  6  5  1  1  2  1  4  5  1  5  5
## 65097  1  6  6  6  6  5  4  4  3  4  1  1  6  6  4  1  1  1  1  3  6  4  6  6
## 65099  2  4  4  5  3  4  4  2  5  5  3  3  3  5  4  4  4  4  4  4  3  3  3  5
## 65100  2  4  3  3  3  4  3  4  2  5  5  4  3  2  3  1  2  1  3  1  3  2  3  5
## 65101  4  3  5  3  4  4  3  3  3  3  3  4  4  5  3  4  4  5  1  5  2  4  3  5
## 65105  3  3  4  3  5  6  4  4  5  6  2  5  4  5  4  4  4  4  4  4  4  4  5  6
## 65108  1  5  5  6  5  5  5  6  4  2  1  1  4  6  5  1  2  2  2  4  5  1  6  6
## 65109  2  3  4  5  5  4  4  2  4  2  2  3  4  5  4  3  3  2  2  2  6  1  5  5
## 65111  1  5 NA  5  5  6  5  5  2  4  4  3  2  2  5  4  5  5  5  2  3  2  5  6
## 65114  1  6  2  5  2  5  4  1  4  6  5  6  1  2  1  4  5  5  6  2  2  4  5  6
## 65117  1  2  3  4  2  5  4  4  4  4  4  5  3  2  4  2  2  2  2  2  4  3  5  6
## 65121  2  4  6  5  1 NA  6  5  5  4  3  2  5  5  5  3  3  3 NA  4  6  3  6  4
## 65122  5  4  1  4  3  6  3  4  5  5  1  2  2  5  5  1  3  1  1  3  6  1  6  6
## 65124  2  6  6  4  5  6  6  6  2  1  1  2  4  5  5  2  3  4  1  2  5  2  5  6
## 65126  5  5  5  6  6  6  6  5  2  1  2  1  6  6  6  1  2  3  3  2  6  2  6  5
## 65129  6  2  6  6  6  5  5  6  6  5  4  4  6  5  4  1  2  1  2  4  6  4  4  4
## 65130  2  6  6  6  6  4  3 NA  6  6  1  5  5  6  3  1  4  2  4  1  3  6  5  5
## 65140  2  4  5  6  5  5  5  5  1  2  1  2  4  6  5  1  2  2  2  3  5  3  4  5
## 65142  3  5  4  5  3  3  2  2  5  6  5  6  2  3  2  3  3  4  5  5  4  2  5  6
## 65144  1  6  6  6  5  6  5  5  2  6  1  1  2  5  5  3  4  5  2  6  5  3  2  5
## 65147  1  5  5  6  4  6  5  5  1  3  3  4  3  3  6  4  5  4  3  2  4  2  4  5
## 65150  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  1  1  1  1  6  1  6  6
## 65151  2  6  6  6  6  3  2  2  4  6  4  4  6  5  5  1  1  1  3  1  6  2  5  6
## 65152  2  4  5  6  6  5  3  5  2  2  2  4  4  3  6  2  3  2  3  1  4  2  4  5
## 65156  1  6  6  5  5  5  3  5  2  2  2  2  5  6  6  1  5  1  3  1  6  2  5  5
## 65157  1  6  5  4  5  2  2  3  5  4  1  1  4  6  3  6  6  5  2  5  4  2  4  4
## 65162  4  4  3  4  2  5  5  5  2  3  5  3  3  3  5  2  3  4  4  2  5  3  3  4
## 65163  3  4  3  2  2  5  5  5  2  5  6  6  2  1  5  5  5  2  6  4  6  1  5  6
## 65164  3  5  3  5  3  4  2  4  5  2  2  3  4  4  6  5  5  5  5  5  4  1  4  2
## 65166  2  5  6  5  6  5  4  3  3  4  1  1  5  6  4  2  4  2  3  2  4  4  5  5
## 65168  3  3 NA NA  5  1 NA NA NA  1 NA  1 NA  5  2 NA  5  5 NA NA NA  1 NA  1
## 65169  1  5  5  4  5  4  5  4  2  2  3  1  5  5  5  2  2  1  5  2  4  1  5  6
## 65170  3  3  5  5  5  1  6  6  2  1  1  1  1  5  2  5  5  5  4  3  5  1  1  1
## 65172  3  5  5  4  4  4  3  4  3  3  3  2  3  5  3  2  4  3  3  3  4  4  4  5
## 65173  4  4  4  5  5  4  3  2  5  5  4  3  4  4  4  3  3  5  4  5  4  4  5  3
## 65174  1  6  6  6  6  5  4  6  2  4  5  1  6  5  6  2  3  3  4  4  5  1  5  4
## 65175  1  4  5  6  5  3  4  2  2  2  5  4  5  4  4  1  3  2  2  5  6  2  4  5
## 65179  3 NA  1  4  5  3  2  3  3  3  5  3  4  2  3  2  2  1  1  3  3  1  2  2
## 65180  1  5  6  6  6  6  6  3  1  1  3  1  6  6  6  3  5  5  3  1  5  2  6  6
## 65185  1  5  6  5  4  5  5  5  1  1  4  2  4  3  5  1  1  1  1  2  4  2  2  2
## 65186  3  6  6  5  6  4  4  3  4  1  3  5  4  5  6  2  5  4  1  2  6  3  5  4
## 65188  1  6  6  1  6  5  4  5  4  5  3  6  5  6  5  4  6  3  5  5  4  3  5  6
## 65190  4  3  4  4  1  6  4  5  5  5  6  6  4  5  5  1  3  1  4  1  6  1  6  6
## 65191  4  6  6  6  2  5  6  6  1  1  4  3  6  4  6  2  1  5  5  1  6  1  6  6
## 65193  2  4  5  4  1  4  4  4  5  4  1  2  4  6  5  4  5  5  3  3  2  2  4  5
## 65195  2  5  5  6  5  4  5  4  3  4  2  2  4  5  4  5  5  4  4  3  5  2  5  4
## 65196  2  5  3  4  3  5  3  2  4  4  1  2  4  5  5  2  2  2  5  4  5  3  4  2
## 65197  1  5  5  6  5  4  5  4  4  5  3  2  4  5  5  4  5  4  5  4  5  2  6  6
## 65199  1  6  6  6  6  5  5  4  2  2  2  1  3  6  5  2  1  1  1  1  5  2  4  5
## 65201  3  5  4  3  4  4  5  5  4  2  2  3 NA  5  4  4  2  2  5  4  4  3  4  3
## 65202  2  5  4  5  5  5  5  2  3  2  1  3  4  6  5  4  5  5  3  3  2  3  3  4
## 65204  4  3  6  6  6  5  5  5  3  4  6  1  6  6  6  5  3  5  4  2  5  6  5  6
## 65206  3  3  4  5  6  5  5  2  3  3  1  1  5  6  6  2  2  1  1  1  6  3  5  4
## 65207  1  5  5  4  6  5  3  5  4  4  5  5  5  5  5  2  3  3  3  1  5  4  5  4
## 65212  2  3  4  5  2  6  5  5  1  4  3  2  5  5  6  3  3  2  2  2  5  1  5  2
## 65213  2  2  6  2  6  4  4  5  2  6  4  5  5  6  5  6  6  5  4  6  5  4  5  4
## 65215  1  6  6  6  6  5  5  4  5  4  2  1  5  6  5  1  2  6  5  5  6  1  6  6
## 65220  3  5  4  5  5  4  2  5  4  5  1  5  5  4  6  5  6  6  4  4  6  3  5  6
## 65223  3  5  1  3  4  5  5  3  4  5  5  6  3  4  3  5  6  5  4  4  5  1  6  6
## 65224  4  4  4  2  4  6  6  6  2  2  5  5  3  5  6  3  5  2  2  4  4  3  3  3
## 65229  2  6  6  6  6  4  5  5  1  2  2  3  5  4  5  4  5  5  3  4  5  3  5  5
## 65230  5  4  5  2  5  5  5  5  2  1  1  2  4  5  5  4  4  5  2  2  5  3  5  6
## 65232  4  4  5  1  5  4  3  3  5  5  1  1  6  6  6  3  2  3  1  3  6  1  5  5
## 65235  4  6  5  6  6  4  3  4  3  4  3  6  1  4  5  4  6  6  6  4  5  6  4  6
## 65236  2  5  5  4  5  4  3  3  2  2  4  4  5  5  4  3  3  2  5  2  6  6  5  2
## 65237  3  4  4  4  4  4  4  5  2  3  3  4 NA  4  4  4  3  1  3  2  4  4  3  3
## 65238  1  6  5  5  6  6  6  6  1  1  2  1  5  2  6  1  1  2  2  1  4  1  6  2
## 65240  2  6  6  6  1  5  5  2  2  6  5  6  5  1  6  4  5  5  6  6  4  1  5  6
## 65241  1  6  6  6  6  5  5  5  1  2  1  1  6  6  6  4  2  2  1  2  5  5  4  4
## 65245  2  5  2  6 NA  1  6  1  1  5  3  5  2  5  4  1  3  1  4  1  6  3  4  6
## 65247  3  5  4  6  4  5  2  3  4  5  3  4  4  4  4  6  6  6  5  5  4  5  4  2
## 65249  1  4  2  6  5  5  5  3  2  5  3  6  5  4  5  1  4  2  2  2  5  4  5  5
## 65252  5  5  2  5  2  5  4  4  2  4  5  3  4  4  2  2  2  2  4  2  5  2  5  4
## 65254  3  3  5  1  5  5  5  4  1  4  2  1  5  4  5  2  5  4  4  1  5  2  5  4
## 65255  5  6  5  6  4  6  5  4  1  1  3  2 NA  5  4  1  1  2  2  1  6  1  6  6
## 65256  3  3  1  1  3  5  5  4  2  5  3  6  4  2  6  3  3  3  3  4  2  2  5  4
## 65257  2  5  5  5  4  4  4  6  1  5  4  3  1  4  5  4  5  4  5  5  4  2  5  5
## 65258  1  6  6  6  6  6  6  6  1  1  1  3  6  6  6  6  5  6  6  1  6  4  5  6
## 65260  4  5  5  5  6  5  4  4  2  2  2  2  4  6  5  1  4  2  2  1  4  2  5  2
## 65262  1  5  5  5  6  5  5  3  3  4  2  1  5  5  5  5  6  5  3  3  4  5  5  5
## 65266  1  5  6  6  6  5  6  6  2  1  4  2  6  5  5  1  1  1  2  1  5  2  6  2
## 65267  2  5  5  6  5  5  5  6  2  2  2  2  2  5  5  2  1  1  2  2  5  2  2  5
## 65268  1  5  4  5  4  5  6  6  3  6  2  5  4  5  3  2  3  5  5  6  6  2  5  6
## 65271  1  5  2  5  3  3  2  4  2  5  3  2  4  4  5  3  3  5  4  5  5  3  5  6
## 65273  3  6  3  4  3  5  2  4  5  2  5  5  2  3  3  5  4  4  3  6  4  5  4  5
## 65274  1  4  5  4  5  5  6  3  1  3  3  1  6  6  6  3  2  2  2  4  5  4  5  2
## 65275  2  5  5  6  2  6  5  4  4  6  2  2  2  3  2  2  1  3  2  4  3  2  2  4
## 65278  2  6  4  4  3  5  4  5  3  4  1  4  2  4  5  2  5  4  4  2  5  1  5  6
## 65279  2  5  5  5  5  5  2  2  3  2  3  4  4  5  5  3  3  4  4  4  4  3  3  4
## 65281  3  5  2  2  5  2  3  5  1  2  2  2  3  2  4  2  2  5  2  2  4  2  1  2
## 65282  2  2  2  5  5  6  6  5  1  4  2  3  3  2  4  4  4  2  1  3  6  2  4  1
## 65285  4  4  3  2  5  5  4  4  2  5  5  4  4  3  2  2  4  5  4  5  4  2  5  6
## 65286 NA  6  5  6  6  6  5  5  1  2  2  2  4  5  6  2  1  2  3  2  5  1  6  6
## 65288  4  6  4  6  3  5  2  3  5  4  1  1  4  4  5  4  4  4  4  5  6  2  4  5
## 65289  1  6  6  4  6  2  4  4  1  2  2  1  6  6  4  1  1  1  1  1  3  1  2  1
## 65291  1  5  4  4  5  6  2  3  3  4  3  4  4  3  5  2  2  4  4  2  4  2  4  5
## 65295  2  5  4  5  5  4  3  4  4  3  3  4  1  2  5  4  4  4  4  4  4  2  4  6
## 65296  2  5  5  6  5  5  5  5  4  4  6  5  5  5  4  1  4  1  4  1  2  4  5  3
## 65297  2  4  3  6  4  4  2  2  1  5  1  1  3  6  2  3  4  4  4  3  4  1  2  2
## 65299  1  6  6  5  5  4  2  4  3  5  5  1  5  4  4  3  4  2  2  2  6  1  4  4
## 65300  1  6  6  6  6  6  6  6  1  1  1  2  4  6  5  1  3  3  1  1  6  1  6  5
## 65301  5  4  4  4  3  4  2  2  4  4  2  2  5  4  4  2  2  1  3  1  5  1  6  4
## 65307  4  5  4  5  5  5  5  6  4  4  4  6  4  2  3  1  1  1  1  2  6  2  5  6
## 65309  5  2  1  2  5  2  4  3  4  5  2  5  2  3  5  4  5  5  5  6  3  1  6  6
## 65311  1  6  6  6  6  6  1  6  1  1  1  1  6  6  6  1  1  1  1  1  6  1  1  6
## 65313  1  4  4  6  4  6  6  5  1  5  5  5  4  3  6  5  5  4  5  6  4  1  3  6
## 65314  2  6  4  5  5  5  6  5  1  4  2  5  5  4  6  6  6  5 NA  6  4  3  6  5
## 65316  3  3  4  2  4  5  4  5  3  5  6  5  3  3  4  3  4  4  4  6  3  5  4  5
## 65319  2  4  4  5  4  2  2  4  4  5  4  3  4  5  4  1  3  2  2  1  5  1  4  6
## 65320  2  6  4  6  5  2  5  2  4  5  3  2  4  5  5  5  4  5  4  6  5  4  3  3
## 65322  2  2  4  5  2  6  6  5  2  3  6  5  6  1  2  5  5  4  5  4  6  1  6  6
## 65326  2  5  5  2  5  3  2  4  3  4  2  2  4  5  5  3  4  3  3  2  5  3  4  5
## 65327  2  5  5  5  5  6  5  4  3  4  2  4  4  5  3  4  4  4  4  4  4  4  4  5
## 65332  1  6  5  6  5  3  4  5  5  5  3  5  4  5  5  2  4  3  3  2  5  3  4  2
## 65335  1  6  6  6  5  6  5  5  1  3  3  2  3  6  4  4  4  4  2  3  4  1  5  5
## 65342  2  5  5  2  5  3  2  5  3  4  2  2  4  5  5  2  4  1  2  2  4  2  4  5
## 65343  2  5  5  2  5  3  3  5  3  4  2  2  5  5  5  2  4  1  2  2  4  2  4  5
## 65344  2  6  5  3  5  3  3  4  2  4  2  1  5  5  5  2  4  1  2  2  5  2  4  6
## 65346  2  5  5  2  5  3  3  4  2  4  2  1  5  5  5  2  4  2  2  2  5  2  4  6
## 65347  3  4  4  5  5  5  4  2  2  5  2  4  2  4  4  4  4  4  5  3  4  4  5  4
## 65348  1  4  4  4  4  5  3  4  3  2  3  1  3  5  5  2  3  4  2  3  5  2  4  4
## 65349  3  5  6  5  5  5  6  3  2  5  1  4  6  4  6  4  4  5  6  2  5  1  6  6
## 65352  5  5  2  5  3  6  6  5  1  1  3  4  3  3  5  4  5  2  4  1  3  2  4  6
## 65353  1  5  5  6  6  5  2  2  2  3  2  2  5  6  5  2  3  2  2  1  5  5  5  3
## 65356  1  6  5  5  5  5  2  5  1  4  2  1  3  5  4  2  4  4  2  4  5  2  5  6
## 65359  3  3  4  3  4  5  5  3  3  5  3  5  3  3  2  5  5  6  4  4  5  2  6  5
## 65361  1  6  3  5  4  5  2  4  3  5  6  3  2  3  1  1  2  1  2  3  5  2  3  5
## 65362  4  2  4  5  4  4  4  5 NA  1  5  4  1  3  2 NA  2  1  3  4  5  1  4  2
## 65363  1  6  5  4  6  5  4  4  5  6  4  4  4  3  5  2  5  1  2  4  6  6  5  4
## 65370  2  5  6  6  6  6  5  4  5  5  1  2  3  6  3  4  1  6  6  2  5  1  4  2
## 65372  1  6  6  4  6  6  6  5  1  5  1  4  6  4  5  5  5  6  4  5  6  1  6  6
## 65374  1  6  6  6  5  5  4  5  1  1  4  4  4  5  4  4  4  4  4  2  5  1  4  5
## 65377  1  6  6  6  5  6  6  6  2  1  4  4  4  5  5  1  4  1  1  1  6  2  5  6
## 65378  5  4  2  5  3  5  6  6  1  2  3  2  4  5  4  2  5  2  3  1  6  1  5  4
## 65381  5  2  1  2  2  4  6  6  1  5  1  6  2  5  2  6  6  6  6  6  6  3  5  6
## 65382  5  6  6  6  6  6  6  6  1  3  4  3  5  6  5  1  5  4  4  3  5  2  5  6
## 65385  1  6  4  5  6  2  3  3  4  6  2  4  4  6  2  1  1  1  1  4  3  2  5  6
## 65386  2  5  4  6  4  2  1  2  4  5  4  4  4  4  3  2  3  2  3  2  3  3  4  3
## 65387  3  5  6  6  5  3  6  6  1  1  1  1  6  5  3  1  1  2  2  1  6  1  6  2
## 65388  1  6  6  5  6  6  6  6  1  1  6  4  5  5  6  6  6  5  6  5  3  4  6  6
## 65391  1  6  6  6  6  5  5  5  1  1  3  2  5  5  4  1  1  2  2  1  5  1  5  5
## 65392  4  3  3  5  1  3  5  2  5  5  1  1  4  2  2  6  6  6  6  6  2  5  4  6
## 65395  2  5  5  5  6  4  5  5  4  4  4  2  5  5  4  4  4  5  4  4  4  3  4  5
## 65401  2  4  5  6  5  3  2  5  3  5  4  1  5  3  1  2  5  6  4  2  2  3  5  2
## 65402  1  6  6  4  6  4  4  1  5  5  4  5  5  2  2  5  5  5  6  2  5  1  6  6
## 65403  1  6  6  6  6  6  6  4  1  3  6  4  5  5  6  6  6  3  1  4  3  5  6  4
## 65404  4  5  4  6  5  4  3  1  4  6  3  1 NA  6  6  4  6  5  6  6  6  6  3  6
## 65405  1  5  6  4  6  2  5  5  6  5  2  1  6  5  6  4  5  3  4  4  5  5  6  2
## 65407  1  5  6  6  1  1  6  5  1  1  1  1  5  6  1  5  2  1  5  5  6  4  5  1
## 65408  3  4  3  5  4  5  5  4  3  2  6  6  2  2  3  4  4  2  3  2  6  1  5  6
## 65411  3  6  6  5  5  4  3  4  4  5  2  2  5  6  6  3  5  4  4  5  6  4  4  5
## 65412  6  4  1  5  4  5  4  5  5  6  6  6  4  4  5  1  1  1  1  1  6  5  1  5
## 65413  2  4  4  5  5  5  6  5  1  3  2  3  4  5  4  3  5  5  3  6  4  3  4  5
## 65415  1  5  4  6  4  3  6  5  2  3  5  4  4  5  4  1  1  2  3  4  5  5  5  2
## 65417  1  5  5  6  5  5  4  4  2  5  1  5  5  6  2  1  1  1  2  6  4  2  5  5
## 65419  4  3  5  6  4  4  5  5  1  3  5  3  3  5  3  1  4  3  4  2  4  4  5  3
## 65420  1  6  6  6  3  1  6  5  1  1  2 NA  6  5  5  2  2  1  1  2  5  1  5  5
## 65421  6  6  4  4  4  4  5  5  2  5  5  1  2  6  5  5  4  6  4  5  5  4  4  4
## 65424  1  5  6  5  5  4 NA  5  4  5  4  4  4  4  3  2  4  3  3  2  4  2  6  6
## 65426  2  6  5  5  3  5  5  6  2  2  5  6  4  2  4  5  5  6  5  6  5  1  5  6
## 65428  1  6  6  4  6  4  5  5  2  2  1  1  4  6  5  2  2  2  4  2  5  4  5  5
## 65430  2  5  5  1  4  4  2  5  4  6  4  4  5  1  1  2  4  2  5  4  5  1  5  5
## 65432  5  4  5  6  2  6  4  3  6  4  3  4  5  5  6  5  6  6  3  3  5  2  4  6
## 65433  4  4  4  5  4  3  5  6  3  2  6  4  4  4  4  4  5  5  6  1  5  3  4  6
## 65434  2  6  6  6  5  5  5  5  2  2  1  2  5  6  5  2  2  1  1  2  5  3  5  5
## 65435  5  4  5  4  5  4  5  6  3  3  3  2  6  2  6  6  6  6  6  6  6  4  5  6
## 65437  6  6  6  5  5  6  5  6  1  2  1  2  5  6  6  1  1  1  1  1  6  1  5  1
## 65439  3  1  1  2  1  6  4  2  6  5  6  5  4  6  5  1  4  6  6  6  6  5  1  6
## 65440  2  6  6  2  4  5  4  4  4  6  3  2  4  5  4  4  4  3  5  2  6  1  4  6
## 65442  1  5  6  5  5  5  5  5  1  1  4  4  4  2  5  3  3  5  5  1  6  1  6  6
## 65445  1  6  6  6  4  1  5  6  1  1  1  1  5  2  6  3  4  4  1  1  5  4  4  2
## 65446  2  5  4  3  3  4  4  4  4  6  6  5  3  6  5  4  4  4  5  5  5  3  4  5
## 65448  1  6  6  6  6  5  3  1  6  2  4  2  6  3  6  6  6  6  6  6  6  1  6  6
## 65450  4  5  5  4  5  5  5  4  3  4  5  3  5  5  6  2  2  2  3  1  5  2  5  6
## 65452  3  4  3  1  3  6  4  4  4  5  2  4  2  2  5  3  4  5  3  2  4  1  5  5
## 65453  1  5  6  4  6  6  6  3  2  2  4  2  5  5  6  1  5  6  4  6  4  2  6  6
## 65455  3  5  5  3  5  5  6  3  1  2  6  4  4  5  5  4  4  5  4  4  4  1  5  5
## 65457  1  6  5  4  4  4  5  2  3  5  1  3  3  4  5  2  3  5  6  2  5  1  5  5
## 65458  1  5  6  5  2  5  5  3  2  3  1  1  5  6  5  1  2  5  2  1  6  4  5  2
## 65459  2  5  5  6  5  6  5  5  2  1  1  1  5  6  5  1  1  2  1  1  6  4  5  2
## 65460  1  5  6  5  6  4  4  5  2  4  2  1  6  6  6  2  4  2  4  1  6  1  5  6
## 65462  2  5  5  4  4  5  6  4  2  2  1  2  4  4  6  6  6  2  3  5  5  2  5  5
## 65466  5  5  2  2  4  4  6  5  4  5  4  4  4  6  4  6  6  5  6  4  5  4  5  5
## 65467  2  6  6  6  6  5  5  4  3  2  1  2  5  6  5  3  3  3  2  2  5  5  5  6
## 65470  1  5  4  4  5  5  4  4  1  2  1  1  4  5  5  3  3  2  3  2  4  4  4  6
## 65472  1  6  6  6  6  5  5  4  2  2  2  4  4  5  3  3  4  2  3  3  5  2  4  6
## 65473  1  5  5  6  4  4  4  4  2  2  1  4  3  6  4 NA  4  4  4  6  5  4  4  4
## 65474  4  4  5  4  4  5  3  3  2  3  3  4  5  3  5  2  4  4  3  4  4  2  4  4
## 65475  4  4  4  4  4  5  6  2  2  4  6  4  6  6  4  1  1  2  4  3  6  1  6  6
## 65476  1  6  5  5  5  5  2  5  3  5  4  4  5  4  3  4  4  5  6  4  6  4  6  6
## 65477  1  4  6  2  5  6  6  4  1  4  6  6  6  1  4  5  4  4  4  6  6  2  6  6
## 65479  1  6  5  6  5  6  5  5  2  3  5  6  2  3  4  3  4  2  5  2  4  3  4  5
## 65484  5  3  5  6  4  5  5  3  2  6  1  1  4  5  6 NA  5  6  4  2  6  5  3  6
## 65487  1  6  6  6  6  6  5  5  1  4  1  1  5  6  5  1  1  4  1  5  6  5  6  6
## 65488  1  6  4  2  6  4  4  6  5  1  2  2  2  4  4  3  3  1  1  5  4  6  1  5
## 65490  1  6  6  6  6  5  5  4  4  2  2  1  5  4  5  4  3  3  2  1  6  1  5  5
## 65491  3  6  5  6  6  3  2  4  3  6  1  1  5  6  6  1  2  2  1  1  5  3  5  4
## 65494  5  5  5  5  3  4  5  5  1  2  1  2  4  5  6  5  4  4  2  6  4  5  5  4
## 65496  3  4  3  4  3  3  4  4  3  4 NA  5  3  1  1  3  4  3  4  5  3  4  3  4
## 65499  1  6  6  4  5  5  4  5  1  1  2  1  5  6  6  1  5  1  1  2  6  4  5  5
## 65501  1  4  4  6  4  5  5  4  2  3 NA  4  2  3  4  3  3  4  4  3  3  1  3  5
## 65502  1  6  6  5  6  6  5  4  1  4  2  2  6  5  6  2  2  3  2  1  6  4  6  4
## 65503  5  2  2  4  4  5  5  5  1  1  6  5  2  2  5  3  2  2  5  2  2  1  4  4
## 65504  2  4  5  5  5  3  3  4  5  3  4  4  6  5  5  6  5  6  4  4  5  1  5  4
## 65506  2  6  5  5  5  5  6  5  2  2  1  2  4  6  6  1  2  2  2  3  6  1  5  6
## 65510  1  4  6  5  6  6  4  4  5  6  2  3  6  6  4  1  2  2  5  1  6  2  5  5
## 65511  2  6  4  3  4  1  4  1  4  6  1  6  2  2  6  6  6  6  6  5  3  6  3  5
## 65512  1  4  4  4  4  5  5  3  2  4  2  4  3  4  4  4  4  4  4  5  6  4  4  6
## 65515  2  4  4  6  4  5  6  4  1  5  2  4  4  5  3  4  5  5  5  5  4  2  5  6
## 65519  5  2  2  2  4  2  2  4  6  4  4  4  4  2  2  3  5  4  6  3  6  1  5  6
## 65522  1  5  5  6  5  5  5  5  1  4  2  3  4  5  4  1  1  1  1  4  5  1  4  5
## 65523  1  5  5  5  4  4  5  5  4  6  4  5  5  2  5  4 NA  5  5  4  6  4  5  5
## 65524  2  5  5  5  6  6  5  6  1  1  2  1  6  5  5  2  2  1  1  1  5  1  6  4
## 65526  2  5  5  6  4  4  4  4  2  3  3  3  4  4  4  1  2  1  2  1  4  3  4  4
## 65527  4  5  5  6  4  6  6  6  1  2  2  3  4  4  6  3  4  4  2  4  4  3  6  6
## 65528  2  2  5  5  3  3  4  3  2  3  2  2  3  5  2  3  3  4  2  3  5  1  5  5
## 65529  2  5  4  4  4  3  4  5  2  2  4  5  2  4  3  2  2  2  2  3  3  2  2  6
## 65532  1  4  3  4  5  5  4  5  2  1  5  2  4  4  5  3  2  5  2  4  5  3  4  5
## 65536  4  5  5  6  5  5  5  3  2  4  1  4  4  6  6  1  3  1  1  1  6  2  6  5
## 65538  1  6  6  5  6  6  3  4  1  3  1  1  6  5  6  3  2  1  1 NA  6  1  1  6
## 65545  3  4  4  6  3  4  4  2  2  5  4  4  3  4  3  4  5  4  4  3 NA  5  5  4
## 65547  2  6  5  6  6  6  5  5  2  4  4  4  6  6  6  3  4  4  4  2  5  2  5  6
## 65548  2  4  5  4  4  6  6 NA  1  1  2  2  2  5  5  2  2  1  2  2  5  2 NA  4
## 65549  2  4  4  3  4  2  4  4  6  6  3  4  1  2  6  6  6  3  6  5  5  5  4  1
## 65551  2  5  5  4  5  5  4  4  1  3  2  3  4  5  5  3  4  3  2  2  4  2  4  6
## 65552  1  5  5  6  6  5  6  6  1  1  5  4  5  5  6  1  4  1  4  1 NA  5  5  6
## 65556  1  6  6  6  6  4  4  4  2  2  1  1  6  6  6  1  2  3  1  1  6  1  6  4
## 65557  1  6  5  4  6  5  5  5  2  3  4  4  3  2  3  5  4  6  5  6  6  1  5  5
## 65563  1  6  5  4  5  6  2  5  1  1  1  1  5  6  6  1  1  1  1  1  6  1  6  6
## 65564  2  5  6  5  6  6  5  1  4  1  1  1  5  6  5  1  1  4  1  1  6  6  4  6
## 65565  5  2  3  4  2  6  6  6  1  1  5  5  2  2  5  5  6  2  2  1  5  1  5  4
## 65566  2  6  5  6  3  6  6  6  1  1  5 NA  2  6  5  2  2  1  1  2  6  1  6  4
## 65568  1  6  4  6  4  6  5  5  5  5  4  5  3  2  4  5  6  5  2  4  6  1  4  6
## 65569  2  5  6  4  6  4  5  6  3  2  2  2  6  6  5  4  4  3  2  3  6  2  5  5
## 65571  1  6  6  6  6  5  5  4  3  5  3  5  5  4  5  3  4  2  4  5  6  3  5  6
## 65575  1  5  5  5  5  5  2  2  6  5  6  4  2  6  4  1  2  3 NA  1  6  6  5  2
## 65577  3  2  3  5  3  1  5  2  4  6  5  6  2  1  1  6  6  6  4  5  4  1  1  6
## 65578  3  6  5  6  5  5  5  6  1  1  2  3  4  4  5  4  4  4  3  2  5  4  4  5
## 65580  1  6  6  4  6  5  2  1  5  5  1  1  5  6  5  4  4  6  1  6  6  4  5  5
## 65583  1  5  5  6  4  6  6  6  2  1  2  2  5  6  5  1  1  1  1  1  6  5  5  5
## 65584  1  6  6  5  6  4  3  5  3  2  2  2  4  5  4  2  3  4  3  4  3  4  4  6
## 65586  2  5  6  6  4  5  6  5  1  1  5  1  5  6  6  3  4  3  2  4  5  2  5  5
## 65589  1  6  6  6  6  6  6  3  1  1  1  1  6  6  6  6  6  6  6  3  6  6  6  6
## 65591  3  6  6  5  6  4  3  4  5  1  1  1  5  6  3  2  3  1  4  3  4  4  5  5
## 65592  3  5  6  6  5  4  6  3  3  2  5  3  5  5  5  1  3  4  5  1  5  1  5  5
## 65593  1  6  6  6  6  6  5  6  1  2  1  2  5  5  4  2  5  2  2  1  6  1  6  5
## 65595  2  6  2  6  5  4  5  6  2  3 NA  1  5  6  4  2  2  1  2  2  6  3  5  4
## 65598  1  6  5  5  5  5  5  2  3  5  1  2  4  6  5  1  2  1  2  2  4  1  5  5
## 65599  1  5  2  4  2  5  6  6  5  6  6  5  1  2  5  4  5  4  5 NA  5  6  1  3
## 65600  2  5  6  6  5  4  3  4  5  5  2  5  5  4  4  3  4  4  6  3  6  1  5  5
## 65602  5  5  5  2  6  5  4  4  4  6  2  6  5  5  5  5  6  6  4  6  5  2  5  4
## 65605  2  6  6  6  5  4  4  4  1  1  1  1  4  5  4  1  2  1  1  2  4  2  4  5
## 65606  2  6  6  6  4  3  5  3  4  4  6  5  3 NA  3  2  3  3  5  4  6  1  6  6
## 65612  1  6  4  1  4  5  3  3  4  5  3  4  4  1  4  3  4  5  6  3  5  5  5  6
## 65613  1  5  6  6  4  3  3  1  5  6  5  6  5  3  3  6  6  4  6  5  5  5  2  6
## 65618  3  2  5  4  4 NA  3  4  3  1  3  2  4  5  3  3  3  3  4  4  3  2  3  2
## 65620  1  6  6  4  6  5  5  5  1  2  5  4  5  5  5  4  4  4  2  5  5  2  5  6
## 65628  4  6  5  6  5  4  4  3  2  2  2  1  5  6  6  2  3  2  2  1  6  2  6  5
## 65629  2  5  5  2  5  3  2 NA  2  3  2  3 NA  4  4  5  4  6  4  3  5  2  4  5
## 65630  4  4  2  2  1  2  2  5  5  6  6  6  1  1  2  3  5  4  5  4  4  2  4  6
## 65631  1  5  6  5  6  4  2  5  2  2  1  3  5  5  5  1  1  2  2  2  5  2  6  5
## 65632  1  5  6  6  5  4  5  5  5  2  1  4  3  6  2  1  1  2  1  1  6  4  4  5
## 65633  3  4  2  1  1  6  6  3  1  1  6  3  6  2  6  1  5  4  2  2  6  1  5  5
## 65634  2  6  5  6  6  6  6  4  1  2  3  4  3  5  5  2  5  5  3  5  5  2  6  5
## 65635  1  6  6  6  6  4  4  2  2  2  1  2  5  5  5  1  1  4  4  1  6  1  6  6
## 65636  3  4  4  4  3  6  6  5  2  3  5  5  4  2  4  3  3  3  3  5  5  2  4  5
## 65641  1  5  5  6  5  5  5  4  3  3  2  2  5  6  5  2  2  1  1  3  5  4  5  5
## 65643  5  5  5  4  5  4  2  3  4  5  1  1  5  6  6  2  5  5  5  1  6  4  5  5
## 65646  2  4  5  6  4  5  4  5  2  2  2  2  1  5  5  3  5  5  3  5  5  4  4  5
## 65648 NA  5  6  6  5  6  5  5  2  2  2  2  5  6  6  1  2  3 NA  2  5  4  5  4
## 65649  3  4  5  6  5  4  4  5  2  1  4  3  3  4  4  1  2  4  2  3  4  2  4  5
## 65651  2  6  6  6  5  5  4  6  2  2  2  2  5  5  5  2  3  2  2  4  4  3  4  6
## 65652  2  6  5  6  4  5  5  4  1  2  2  1  6  6  6  1  3  2  1  2  5  1  5  4
## 65653  3  4  4  5  4  4  4  3  3  4  4  4  3  3  3  2  2  3  3  3  3  2  5  4
## 65654  4  4  4  6  3  6  5  6  1  5  4  1  5  5  6  6  6  5  5  4  6  4  4  5
## 65656 NA  5 NA  6  6  4  5  5  4  3  4  4  4  5  4  4  5  4  3  5  4  4  3  6
## 65659  5  3  2  5  2  6  3  4  2  2  1  2  5  5  6  3  5  2  2  3  5  1  5  2
## 65664  3  4  4  6  6  4  5  5  4  2  3  4  5  5  5  6  5  4  3  3  5  4  5  6
## 65668  5  4  4  6 NA  5  6  6  3  1  4  3  4  5  5  3  1  3  4  3  4  3  3  3
## 65671  1  5  6  5  5  2  2  1  3  5  1  2  5  5  6  1  2  2  2  1  6  2  5  4
## 65673  3  4  5  5  5  5  5  4  2  2  4  5  4  3  4  3  4  4  4  3  4  3  3  5
## 65674  2  6  5  6  5  4  3  5  2  3  1  2  5  2  6  4  2  4  5  4  4  2  5  6
## 65675  2  5  5  5  5  5  6  6  1  2  2  3  4  6  5  4  5  2  4  5  5  4  6  5
## 65678  1  5  5  3  4  6  6  4  2  5  3  2  4  5  4  5  5  5  6  1  5  1  4  5
## 65679  1  6  6  6  6  4  5  3  4  4  1  2 NA  6  6  1  4  6  1  1  6  1  6  6
## 65680  2  6  6  6  5  5  4  5  2  2  1  2  5  6  5  4  4  4  4  4  6  1  4  6
## 65682  1  6  6  6  5  4  6  6  1  2  5  2  3  5  5  1  4  1  2  2  5  5  2  6
## 65684  5  6  6  5  6  5  6  6  1  1  3  1  3  6  6  2  4  2  4  1  5  2  5  4
## 65687  5  6  3  6  3  3  6  6  1  3  6  6  2  4  6  6  6  6  4  6  6  6  3  4
## 65694  4  2  5  2  5  6  2  3  4  6  6  6  3  1  2  4  4  6  6  2  6  1  5  6
## 65695  1  6 NA  6  6  5  5  2  1  5 NA  2  5  5  5  4  4 NA  4  2  5  4  5  3
## 65696  1  6  6  6  6  5  5  2  1  5  3  2  5  5  5  4  4  4  4  2  5  4  5  3
## 65698  5  5  2  2  3  5  5  6 NA  3  4  4  4  5  6  2  5  3  3  2  5  5  4  6
## 65699  5  5  2  2  3  5  5  6  3  3  4  4  4  5  6  2  5  3  3  2  5  5  4  6
## 65700  6  6  6  6  5  4  3  3  1  2  5  2  3  6  5  2  4  2  4  3  3  4  4  5
## 65702  5  6  6  6  6  4  3  5  1  2  1  4  2  6  3  3  2  3  2  5  6  2  4  3
## 65703  2  5  3  5  5  6 NA  6  1  4  4  4  2  2  6  2  2  1  1  5  5  1  5  2
## 65704  1  5  5  6  6  6  5  5  1  2  1  1  6  6  6  1  2  3  1  2  6  6  4  6
## 65705  3  4  4  1  3  5  5  4  3  5  5  6  2  1  3  2  6  2  1  2  5  1  6  6
## 65706  6  6  6  6  6  6  6  6  1  1  1  1  6  6  6  2  6  2  6  1  6  1  6  6
## 65708  4 NA  3  6  4  2  1  4  4  1  3  3  5  4  6  5  2  1  1  1  6  1  3  1
## 65709  2  5  3  5  6  3  5  6  3  6  6  6  3  5  5  6  6  6  6  6  4  1  6  6
## 65710  5  4  3  4  3  2  3  2  6  6  1  5  4  4  3  2  3  4  2  1  6  6  6  6
## 65711  3  4  5  6  5  6  5  5  3  3  2  4  4  5  5  1  1  5  3  2  5  1  3  5
## 65712  3  6  5  6  4  5  4  6  2  4  6 NA  3  5  2  3  6  5 NA  1  2  3  1  6
## 65713  1  5  5  6  6  6  5  5  1  2  1  5  5  6  6  1  1  3  2  2  6  4  5  5
## 65714  3  5  6  6  6  4  5  4  4  4  2  2  5  6  5  5  3  3  3  2  4  3  5  5
## 65715  5  1  5  1  4  6  6  5  1  3  2  1  5  6  6  6  6  4  2  5  6  6  5  4
## 65720  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  4  1  5  4  1  6  1  6  5
## 65724  5  2  3  3  3  4  5  3  2  5  5  3  4  3  5  5  5  4  3  1  5  3  5  2
## 65726  2  5  5  6  5  2  6  5  1  2  3  2  4  5  5  4  4  6  3  1  5  5  4  4
## 65727  5  2  6  5  5  6  5  6  6  6  4  6  6  5  1  6  6  6  6  6  6  5  6  6
## 65728  5  3  3  4  4  4  5  5  4  5  5  5  3  3  5  5  5  3  4  4  4  3  5  4
## 65730  2  4  4  6  4  4  3  3  2  3  3  3  3  5  3  3  3  2  3  3  4  3  4  4
## 65732 NA  5  6  5  6  1  5  1  4  1  1  1  6  6  6  6  1  1  1  1  6  1  1  1
## 65733  4  3  2  4  3  6  5  4  2  5  5  3  5  2  5  4  5  2  5  3  5  1  5  6
## 65734  1  5  6  6  6  6  6  6  1  2  3  5  5  1  6  3  4  4  2  5  4  2  5  4
## 65738  1  6  5  6  5  5  5  5  2  1  4  3  4  5  5  2  3  3  4  2  5  1  5  4
## 65740  2  5  5  6  5  5  4  5  4  4  4  2  5  5  4  4  2  3  4  4  5  5  4  5
## 65742  4  4  5  5  5  2  3  2  4  4  6  6  3  6  4  4  4  5  4  1  5  4  3  4
## 65743  1  2  2  6  2  6  5  5  1  2  6  3  1  5  2  5  2  6  6  6  4  4  5  5
## 65744  3  6  3  3  4  5  6  2  2  2  3  6  2  5  3  5  5  5  5  3  6  4  6  6
## 65745  1  5  5  5  4  5  4  5  2  2  2  2  4  2  6  5  5  5  4  5  3  6  3  4
## 65746  5  5  5  6  6  5  5  4  1  3  1  1  5  6  5  4  1  2  2  5  5  2  4  2
## 65747  5  4  2  4  2  4  2  4  3  4  2  6  2  3  6  6  6  6  6  6  2  2  2  6
## 65748  2  6  6  6  6  6  6  5  3  4  6  2  6  5  6  3  4  5  5  5  5  2  5  5
## 65752  1  2  5  6  5  4  4  3  3  2  4  3  4  5  2  5  2  2  4  4  5  1  2  5
## 65758  1  6  5  6  6  5  1  5  1  1  2  1  4  6  6  3  2  2  1  1  5  2  3  5
## 65762  3  4  5  6  5  4  6  5  4  2  1  5  4  6  5  3  3  3  2  3  5  2  4  3
## 65763  1  6  5  5  6  6  6  6  1  1  1  2  6  6  5  1  2  4  4  4  6  1  5  6
## 65764  2  5  2  5  4  4  5  4  2  2  5  4  3  5  3  1  3  1  1  1  4  2  4  5
## 65765  2  5  4  6  5  3  4  4  2  2  3  4  3  5  5  3  4  4  4  2  4  4  4  5
## 65767  4  5  3  2  3  6  5  4  4  6  5  3  3  5  4  3  5  4  5  5  3  1  6  5
## 65777  2  5  5  5  4  4  5  3  2  2  4  3  3  4  3  1  1  1  1  1  4  2  4  5
## 65778  1  6  6  6  4  6  6  6  1  2  1  1  4  6  6  2  2  2  1  2  6  1  6  6
## 65779  6  5  6  5 NA  5  4  4  5  6  5  1 NA  6  4  4  4  5  3  5  5  4  4  6
## 65793  2  5  5  4  5  5  5  6  3  2  1  2  4  6  5  3  3  3  3  2  5  3  5  5
## 65794  1  6  6  6  6  3  6  4  1  1  4  1  5  6  6  2  4  2  1  1  5  1  5  5
## 65798  1  6  5  5  4  4  2  2  4  2  2  4  4  5  4  1  1  1  1  1  6  2  4  4
## 65801  1  6  6  6  6  6  6  6  1  1  1  4  6  6  6  6  6  5  1  1  6  1  6  5
## 65802  1  6  6  6  6  3  5  3  2  2  1  1  5  6  1  5  4  5  5  2  1  4  4  6
## 65803  1  6  5  6  6  6  5  5  5  2  1  1  5  6  6  1  1  4  5  6  5  2  4  6
## 65804  5  4  5  6  4  5  6  6  4  5  4  2  5  5  5  6  5  4  4  2  6  4  5  5
## 65809  1  6  5 NA  5  4  4  5  2  2  5  4  4  2  4  2  5  3  5  4  5  2  4  6
## 65811  2  4  5  4  4  2  2  5  2  4  3  3  2  4  5  3  4  1  1  1  4  2  4  5
## 65813  1  6  5  6  5  4  4  4  3  4  2  2  3  4  4  2  4  2  1  1  3  4  4  5
## 65816  6  6  4  6  3  4  6  3  6  5  1  4  6  6  6  6  6  6  6  6  6  6  4  6
## 65818  3  5  5  6  6  4  6  6  1  1  1  1  5  6  6  4  3  2  3  1  6  1  4  6
## 65820  3  4  5  5  5  5  4  3  1  1  4  4  4  5  5  4  4  4  1  1  3  5  5  3
## 65822  4  5  5  4  5  4  5  5  1  2  2  1  5  6  6  4  4  2  2  1  6  2  5  5
## 65825  5  6  5  6  6  5  5  5  1  1  2  3  5  6  5  2  6  2  2  4  5  4  5  5
## 65826  5  6  3  6  6  5  6  4  1  2  1  1  6  6  6  3  5  2  2  3  6  6  4  6
## 65828  5  5  2  5  6  4  3  5  3  3  3  4  4  4  4  2  3  4  3  2  4  5  4  3
## 65831  6  6  6  6  6  5  5  6  1  3  1  2  5  6  5  5  5  2  4  2  4  4  6  6
## 65834  1  5  5  6  5  5  4  4  2  3  4  4  5  5  5  1  2  2  2  2  4  3  5  2
## 65836  3  6  6  6  6  3  6  1  1  3  1  1  6  6  6  6  6  6  1  1  6  1  6  6
## 65838  1  6  6  6  6  6  5  4  6  4  2  2  5  6  5  2  4  3  4  5  6  5  5  6
## 65839  1  6  5  6  5  5  5  3  5  4  4  1  4  5  6  4  4  3  5  4  4  5  5  6
## 65840  2  6  6  4  6  4  5  4  1  1  4  1  5  6  6  1  1  1  1  1  5  2  4  6
## 65841  3  6  6  6  6  6  6  5  1  1  2  4  5  5  5  3 NA  6  5  2  6  5  5  6
## 65842  5  4  4  3  5  4  4  4  4  5  3  4  4  5  5  3  4  1  3  2  3  1  5  5
## 65844  1  6  6  5  6  5  4  4  3  2  6  4  5  6  5  4  4  2  3  1  4  6  3  3
## 65847  2  5  6  6  5  6  6  6  2  1  4  1  5  5  6  5  4  3  3  4  6  2  5  6
## 65848  2  4  4  6  4  4  5  4  3  2  5  6  1  2  5  3  2  2  4  6  5  5  1  6
## 65849  1  5  4  6  4  5 NA  4  2  4  2  2  4  5  6  5  5  2  2  2  4  1  5  5
## 65851  1  4  4  5  4  4  4  4  2  5  2  5  2  3 NA  2  4  1  2  2  1  3  1  5
## 65852  5  5  6  5  6  6  5  5  1  3  1  1  6  6  6  2  4  2  2  1  6  1  5  5
## 65856  3  5  5  6  6  4  5  5  2  4  1  2  4  6  5  3  3  3  3  3  3  6  4  4
## 65857  4  4  2  6  4 NA  5  2  5  6  5  6  4  5  3  6  6  6  5  6  6  6  4  6
## 65862  1  5  4  6  4  4  3  4  3  4  1  4  5  6  5  4  4  4  5  6  4  4  6  5
## 65863  4  4  4  6  1  5  5  5  4  2  4  3  4  5  2  5  6  4  4  3  4  6  3  5
## 65864  1  6  6  6  1  6  5  6  1  1  5  1  4  5  5  1  1  1  1 NA  6  1  3  4
## 65865  5  6  6  6  6  4  4  4  4  5  2  3  4  6  5  4  3  2  2  2  5  4  4  6
## 65870  2  5  5  4  6  5  4  5  2  4  5  3  4  5  3  2  4  2  2  1  4  1  3  4
## 65874  2  6  6  6  5  4  4  5  3  5  5  2  4  4  5  2  4  3  5  5  4  6  4  4
## 65876  1  5  6  6  6  2  5  6  1  1  3  2  3  6  6  2  4  2  3  3  5  2  3  2
## 65879  1  6  5  4  4  6  2  4  1  2  4  5  3  4  6  5  5  6  5  6  5  2  3  5
## 65880  3  2  4  6  5  5  4  5  1  2  1  2  4  6  4  4  5  2  2  4  5  2  4  5
## 65883  1  6  6  6  4  4  5  5  4  5  6  4  4  4  5  2  4  4  4  2  4  4  4  6
## 65886  3  4  5  6  5  5  5  5  1  1  6  4  4  4  4  4  1  2  2  2  4  3  3  2
## 65888  5  1  6  5  5  5  1  5  1  4  4  1  5  6  5  1  1  1  1  1  5  1  6  1
## 65890  1  5  5  5  5  5  4  5  2  1  1  5  4  5  4  1  4  2  1  1  5  3  4  5
## 65891  1  6  5  6  5  4  4  3  4  2  1  2  4  5  3  4  5  5  5  6  6  1  5  4
## 65892  2  6  4  6  2  4  6  4  3  6  2  4  3  5  5  6  6  6  5  6  3  4  4  5
## 65893  3  5  5  5  4  6  5  6  1  1  1  1  6  6  6  5  5  5  4  2  6  1  6  5
## 65894  1  6  4  6  6  5  4  5  1  1  6  1  3  4  6  1  1  1  1  4  6  2  4  4
## 65895  3  4  5  6  3  3  5  3  1  4  6  6  3  1  2  5  5  6  5  4  3  2  2  6
## 65896  1  5  5  6  5  5  6  4  1  4  1  1  5  6  5  4  4  4  3  2  4  4  6  5
## 65897  2  5  6  5  5  4  4  6  1  3  4  2  4  3  4  3  4  1  2  1  5  2  4  5
## 65899  6  5  6  6  6  6  4  3  5  1  1  1  6  6  5  1  3  2  2  3  6  3  6  5
## 65900  3  3  5  6  4  3  4  3  4  4  3  3  4  4  4  4  4  4  4  4  4  1  4  3
## 65901  1 NA NA  6  5  5  5  5  5  2  5  4  4  5  5  2  1  1  1  2  5  4  4  5
## 65902  4  5  6  6  6  4  5  1  3  4  5  5  4  6  4  2  2  3  4  4  5  6  5  6
## 65903  4  4  4  5  6  6  6  6  2  4  1  3  3  6  5  5  5  3  3  1  5  5  5  5
## 65905  3  6  6  6  6  6  6  5  1  1  2  1  6  6  6  2  2  2  1  2  5  2  5  2
## 65909  2  6  6  6  4  3  5  4  3  4  1  3  3  6  4  3  2  4  4  4  3  1  5  4
## 65913  2  5  5  3  5  5  4  5  3  4  2  3  4  4  4  5  4  3  2  5  6  3  5  5
## 65917  2  6  5  6  6  4  5  5  1  3  1  1  6  5  5  1  2  1  1  1  6  2  5  6
## 65918  1  6  6  6  6  2  6  1  6  1  4  4  6  6  6  6  5  6  6  5  6  1  6  6
## 65921  2  5  5  6  6  5  5  5  4  6  2  2  5  6  5  4  5  3  3  4  6  3  3  4
## 65924 NA  6  5  6  6 NA  6  5  2  2  5  4  4  6  5  6  6  6  6  6  6  6  6  5
## 65925  2  5  2  6  2  6  6  6  2  3  5  6  2  1  3  6  6  6  6  6  6  1  5  6
## 65926  4  4  4  6  5  6  5  3  1  1  5  1  1  4  6  1  1  1  1  4  6  1  6  1
## 65929  5  5  5  6  5  4  5  3  4 NA  2  6  3  5  4  4  5 NA  2  4  4  3  4 NA
## 65930  5  5  5  6  5  4  5  3  4  3  2  6  3  5  4  4  3  3  2  4  4  3  4  3
## 65932  1  6  6  6  6  6  3  4  2  5  2  2  3  6  4  3  4  4  3  4  4  4  4  4
## 65933  3  4  4  4  4 NA  4 NA  3  3  4  4  4  5  4  1  3  3  4 NA  3  3  3  4
## 65936  3  4  4  4  4  4  4  4  3  3  4  4  4  5  4  1  3  3  4  1  3  3  3  4
## 65937  1  6  6  5  6  6  5  6  1  1  5  5  4  5  6  1  1  1  4  1  6  5  5  5
## 65938  5  5  6  6  2  5  5  4  3  4  1  2  5  6  3  3  4  4  3  3  5  4  4  4
## 65940  2  5  5  6  6  4  6  3  1  2  4  1  3  6  4  2  5  3  1  6  6  1  3  4
## 65941  2  6  6  6  5  5  4  5  3  1  2  2  5  5  5  4  4  4  4  3  6  4  4  4
## 65942  2  5  4  4  5  5  2  4  4  4  4  6  2  5  3  3  4  2  4  2  4  2  4  5
## 65946  4  5  5  6  2  3  4  1  4  5  1  2  4  4 NA  5  6  6  1  5  5  2  4  5
## 65948  1  6  6  6  6  5  6  5  1  1  1  1  6  6  6  2  1  4  6  4  6  4  6  6
## 65950  2  3  6  5  5  3  2  2  3  6  2  5  2  5  3  1  4  1  5  3  6  4  5  6
## 65951  5  6  6  6  6  6  6  5  1  1  1  1  6  6  6  1  1  1  2  1  6  1  6  6
## 65959  3  5  5  5  5  6  6  2  1  1  2  1  5  6  6  4  4  2  1  1  6  1  6  1
## 65961  1  6  4  6  5  4  4  3  1  1  5  4  2  4  4  3  3  1  2  5  5  1  3  5
## 65962  1  5  5  6  5 NA  4  2  1  1  3  1  5  6  5  1  1  1  1  2  6  1  5  4
## 65965  1  6  5  6  5  4  3  4  5  5  2  5  1  4  2  1  1  1  4  2  4  5  2  5
## 65969  2  6  6  6  6  5  5  5  4  1  5  4  5  6  5  2  2  4  1  4  1  5  5  6
## 65971  1  5  3  4  5  3  4  4  3  3 NA  3  4  4  3  3  3  2  3  3  4  4  5  5
## 65972  1  5  4  5  4  5  4  4  2 NA  4  4  2  5  4  2  3  2 NA  1  2  4 NA  5
## 65973  1  5  5  5  5  5  5  4  1  2  3  1  4  5  5  2  2  2  1  3  5  3  5  5
## 65974  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
## 65976  1  6  6  6  5  4  4  4  1  2  4  1  5  6  5  3  4  4  3  4  4  2  6  6
## 65977  1  5  5  6  5  6  5  5  1  1  2  5  2  4  3  4  5  4  2  5  2  4  3  6
## 65981  2  4  2  5  2  5  5  5  1  4  6  6  2  2  5  3  4  3  5  2  4  4  1  5
## 65986  3  5  5  6  5  5  5  5  4  2  2  4  4  2  4  4  4  5  4  2  5  4  4  5
## 65987  5  5  3  5  2  5  6  6  1  2  5  6  4  4  4  5  5  6  5  2  6  1  1  6
## 65988  2  6  5  6  5  4  4  4  2  5  5  1  5  5  3  2  2  3  5  1  6  3  5  3
## 65989  1  4  6  5  4  4  5  4  3  4  2  6  2  2  2  4  5  4  3  3  5  4  6  6
## 65990  2  5  5  6  5  4  2  4  4  2  1  6  4  6  5  2  4  1  1  2  4  2  4  4
## 65992  3  5  5  4  5  5  4  5  1  2  2  3  6  5  4  2  2  4  2  2  5  3  4  4
## 65995  2  3  5  1  5  5  2  3  4  5  6  5  1  2  2  2  2  1  2  1  3  5  2  4
## 65998  2  6  3  6  2  6  6  6  1  1  6  6  4  3  1  1  3  3  3  6  3  5  5  2
## 65999  2  4  3  3  3  5  4  4  4  5  6  5  2  5  2  2  5  5  4  4  4  2  4  6
## 66000  1  6  6  6  5  5  5  4  1  2  1  2  5  6  5  2  2  2  2  2  5  2  5  4
## 66001  5  5  4  6  5  6  6  5  5  3  1  4  5  6  6  4 NA  4  3  3  6  5  5  6
## 66002  1  6  6  6  5  6  5  5  1  1  1  5  5  6  6  1  1  2  2  1  6  2  5  5
## 66003  5  6  6  6  6  6  5  6  1  3  1  1  6  6  5  1  2  3  1  1  5  2  6  4
## 66004  1  5  6  6  5  6  6  5  1  1  2  4  5  6  6  4  5  4  4  2  6  2  5  5
## 66006  2  5  1  6  6  6  6  5  1  2  1  1  6  6  6  1  2  1  1  1  6  1  5  6
## 66007  1  6  4  6  6  6  6  6  1  4  1  4  4  6  4  5  4  4  4  3  6  2  3  5
## 66013  2  5  5  6  6  6  4  5  3  1  1  3  5  6  5  4  5  5  3  1  4  5  5  5
## 66014  4  4  1  6  3  5  6  5  3  1 NA  2  4  5  4  3  4  5  6  4  6  3  4  6
## 66015  3  5  5  5  3  5  5  6  2  2  4  4  4  3  5  5  4  4  4  4  5  4  3  4
## 66016  2  4  6  4  6  5  4  6  3  4  4  2  5  5  4  5  5  5  3  3  4  6  4  4
## 66017  6  1  6  6  5  4  1  1  4  4  1  1  6  6  6  6  4  3  4  1  6  1  6  5
## 66022  2  5  5  4  5  5  6  4  1  4  1  4  4  5  5  2  2  2  2  1  4  2  5  5
## 66024  4  5  4  5  5  4  3  5  4  5  1  3  4  6  4  2  4  2  1  4  3  4  4  5
## 66032  2  6  6  6 NA  5  5  5  3  1  1  1  5  6  6  2  4  3  1  2  5  1  6  4
## 66034  2  6  6  6  1  5  6  6  1  4  1  1  6  6  6  4  6  4  1  1  6  1  6  6
## 66037  3  4  3  6  3  4  4  4  2  1  5  4  2  3  3  3  3  3  4  4  3  1  3  3
## 66039  2  5  4  4  5  5  6  5  3  4  2  4  5  3  6  2  3  2  4  4  6  2  4  6
## 66042  2  5  5  3  4  4  5  6  1  1  2  2  3  3  4  3  4  2  4  1  3  2  4  5
## 66045  4  6  6  6  6  4  2  2  4  3  5  1  5  6  6  5  6  4  2  5  6  4  5  5
## 66047  1  6  6  6  6  5  5  4  2  1  2  2  4  5  5  1  1  1  4  6  6  1  6  6
## 66049  2  4  4  5  4  4  5  2  4  3  6  5  4  1  5  4  3  5  4  4  6  3  4  6
## 66050  1  6  6  6  6  6  6  5  1  1  1  4  5  6  6  1  1  1  2  4  6  4  5  5
## 66053  2  5  5  2  4  5  6  5  2  4  3  4  5  5  3  5  4  6  2  4  5  4  6  6
## 66057  5  2  6  4  6  4  3  4  4  5  1  2  4  6  5  5  5  4  2  3  3  5  5  3
## 66058  3  6  4  6  5  6  5  4  2  1  1  1  4  5  5  1  3  2  2  2  3  1  4  6
## 66060  1  6  6  6  6  6  5  4  5  4  2  5  5  2  1  6  5  5  5  6  6  2  5  6
## 66061  1  6  5  6  4  6  6  6  4  2  5  4  4  5  5  3  2  4  4  5  4  2  3  5
## 66062  2  5  5  5  4  3  5  5  3  2  5  2  4  3  5  3  3  3  4  2  4  3  3  5
## 66063  2  6  5  6  6  5  6  6  1  6  6  5  1  2  1  1  1  5  5  4  3  6  5  6
## 66064  1  5  1  5  5  6  5  5  3  6  1  6  1  3  6  5  2  6  6  2  5  1  4  5
## 66065  5  1  3  5  2  6  4  4  6  1  5  1  3  5  3  3  5  4  6  6  3  3  2  5
## 66067  1  6  6  6  6  3  6  6  1  2  3  1  5  6  6  1  3  2  5  4  5  3  6  6
## 66068  3  5  6  5  6  5 NA  6  5  3  2  2  3  2  6  5  5  5  4 NA  3  1  6  4
## 66070  1  6  6  6  6  6  6  5  1  1  1  1  5  5  6  1  1  1  5  1  6  1  5  6
## 66071  4  4  2  2  2  5  6  1  4  6  4  2  2  5  5  4  4  6  5  5  5  1  5  5
## 66072  4  6  5  5  4  5  6  1  5  5  5  3  4  4  6  6  6  6  6  6  5  1  6  5
## 66077  5  5  5  6  5  5  5  4  4  4  5  5  5  4  4  4  4  5  4  5  4  3  4  5
## 66080  2  5  6  6  5  6  5  6  2  3  5  4  5  5  4  4  4  5  2  6  6  1  3  5
## 66081  5  4  2  3  4  5  6  5  2  1  4  5  2  2  6  4  5  6  4  4  6  1  5  6
## 66082  1  6  6  6  5  6  5  6  1  1  4  1  4  5  6  1  2  2  3  1  5  2  6  6
## 66083  1  6  6  6  6  6  2  5  2  1  1  1  5  6  5  2  2  4  1  4  6  1  6  6
## 66086  2  5  4  2  5  1  1  3  4  5  2  4  2  2  4  3  2  1  3  2  5  4  4  5
## 66088  1  6  6  6  6  5 NA  6  4  4  5  4  5  6  5  5  4  5  5  5  6  6  6  6
## 66092  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  1  1  2  1  6  1  6  6
## 66093  1  5  5  5  6  6  5  4  1  1  4  2  2  6  5  5  6  5  4  4  4  1  6  6
## 66094  2  5  5  6  5  5  4  4  2  5  2  2  5  5  3  2  3  3  2  5  4  2  4  5
## 66095  2  4  5  3  5  5  2  5  5  6  3  5  5  4  4  5  5  4  5  5  4  2 NA  6
## 66096  2  4  6  6  6  5  2  4  2  5  1  1  6  6  6  5  6  5  5  5  6  2  6  6
## 66097  1  6  6  6  6  4  4  3  4  6  3  4  6  6  5  2  6  5  6  5  6  1  6  6
## 66098  1  6  6  5  6  5  4  5  1  2  2  1  6  6  5  2  3  1  2  2  5  1  6  5
## 66102  4  4  5  5  5  1  3  2  4  6  1  4  6  2  6  4  6  4  5  1  5  1  6  6
## 66106  1  4  5  6  6  6  6  6  1  1  5  1  6  6  5  1  1  1  6  1  6  1  6  2
## 66107  2  4  5  3  4  5  5  5  1  1  3  2  5  4  6  2  2  2  2  1  6  2  4  4
## 66108  1  5  6  1  4  4  1  5  2  5  1  4  1  5  4  3  4  4  6  5  2  3  4  4
## 66109  2  5  2  4  2  4  5  4  2  3  6  4  1  1  2  1  1  1  5  1  6  2  1  4
## 66114  4  4  2  2  2  2  4  2  3  6  2  4  4  2  4  4  4  2  2  2  6  1  6  2
## 66115  1  6  6  5  6  6  5  5  1  1  4  4  6  3  5  4  4  2  2  2  6  2  4  6
## 66116  1  4  4  5  4  4  4  4  1  2  3  4  4  4  4  3  4  3  3  4  4  3  4  4
## 66117  3  5  6  6  6  4  5  5  3  4  4  4  4  5  5  5  6  6  4  6  4  4  5  5
## 66119  2  6  6  6  6  6  6  6  4  1  6  4  6  5  5  1  2  1  3  2  6  2  6  4
## 66120  4  5  5  6  5  4  2  5  5  6  1  1  5  6  5  3  4  5  3  4  4  6  3  5
## 66121  2  6  4  6  5  4  5  6  2  4  4  5  4  5  5  4  5  4  2  5  5  3  4  6
## 66122  2  6  5  5  6  5  5  6  2  2  2  2  5  5  6  2  3  2  2  5  5  5  5  6
## 66125  1  5  5  6  5  6  5  5  2  2  2  3  4  5  4  1  2  2  2  1  4  3  4  3
## 66127  2  5  6  6  6  5  5  6  2  1  2  3  5  5  5  2  2  4  4  2  6  3  6  4
## 66135  2  6  6  4  5  6  2  5  4  1  1  1  6  6  6  4  3  2  2  1  6  2  5  6
## 66136  2  4  4  4  5  6  2  5  4  1  1  1  5  6  6  4  6  2  2  2  6  2  5  6
## 66138  6  6  4  5  4  4  4  6  3  5  6  4  4  5  3  4  4  5  5  3  3  3  3  5
## 66139  4  1  6  6  5  3  5  6  5  4  4  2  5  6  1  2  2  5  4  4  5  4  4  5
## 66141  6  3  3  6  6  6  6  6  1  1  1  3  6  6  5  1  5  2  1  1  4  5  4  4
## 66144  1  6  6  6  5  4  4  4  2  3  3  3  4  5  3  1  2  2  2  2  5  2  4  5
## 66150  3  5  5  5  5  5  4  5  2  2  3  4  4  5  3  3  3  4  3  5  4  2  3  5
## 66151  2  4  5  6  5  4  2  5  4  5  1  4  4  5  5  2  4  2  4  3  6  1  6  6
## 66153  1  5  5  6  5  5  4  2  3  2  1  2  3  6  5  2  4  4  2  2  4  3  4  4
## 66156  2  5  5  4  5  4  4  5  2  2  2  2  5  6  6  5  5  5  4  3  5  5  5  6
## 66157  4  6 NA  6  5  6  5  5  1  4  1  1  2  6  5  1  1  1  2  1  5  6  4  1
## 66158  4  5  5  5  3  5  5  4  1  1  6  5  4  3  4  3  2  2  2  5  5  2  3  3
## 66161  2  5  5  4  6  5  3  6  2  4  4  2  3  1  4  1  1  1  3  2  6  4  4  6
## 66163  1  5  5  6  6  6  6  5  2  2  1  5  5  6  6  1  2  4  2  5  5  3  5  5
## 66164  2  5  5  6  6  4 NA  5  1  1  3  2  6  5  6  1  4  3  4  4  5  5  4  5
## 66169  1  5  6  6  4  6  5  5  2  4  5  3  4  5  3  1  2  4  3  2  5  2  5  6
## 66170  1  6  6  6  6  4  4  4  1  1  4  4  4  4  4  3  3  4  4  1  6  1  4  5
## 66171  4  4  4  5  4  3  1  2  5  5  4  5  3  2  3  4  4  5  5  6  6  1  5  6
## 66172  2  2  3  2  2  5  4  4  2  2  3  5  4  1  3  2  4  2  4  2  5  1  4  6
## 66173  1  6  5  6  4  1  6  6  1  5  4  6  1  1  6  2  5  2  5  4  4  5  5  6
## 66176  2  6  5  6  4  5  4  4  4  6  1  3  3  4  4  2  2  4  6  1  3  3  5  6
## 66181  1  6  6  6  6  6  5  5  1  1  3  5  4  6  3  2  4  4  2  5  4  4  4  6
## 66187  1  4  4  3  4  2  3  3  3  5  4  4  4  4  4  2  2  1  3  1  6  2  4  6
## 66188  2  5  5  5  5  5  5  4  1  2  2  2  4  5  5  2  3  3  2  2  4  3  4  4
## 66190  1  5  4  4  4  4  5  4  1  3  1  4  4  3  5  5  5  4  3  4 NA  2  5  6
## 66191  3  5  4  2  2  4  4  5  1  2  3  3  5  4  6  3  4  4  3  3  6  2  5  6
## 66195  1  6  5  6  5  5  5  2  2  4  2  2  4  5  4  1  2  2  2 NA  6  2  5  6
## 66198  4  5  5  5  6  5  2  5  1  2  6  2  2  6  5  5  6  5  3  1  4  4  2  5
## 66199  2  4  4  5  4  5  5  4  2  2  4  5  3  4  4  2  2  2  2  3  4  5  4  4
## 66201  5  6 NA  6  6  6  6  6  1  1  6  1  3  5  6  6  6  1  1  1  6  6  4  4
## 66204  2  5  4  6  4  4  3  6  1  2  4  4  2  5  1  1  4  1  2  1  5  5  4  6
## 66205  2  6  6  6  6  4  5  4  1  1  1  2  4  6  5  1  3  1  1  2  5  3  5  5
## 66210  1  6  5  6  6  2  5  6  1  2  2  4  5  4  4  1  2  1  2  4  3  4  2  6
## 66212  1  6  4  3  5  5  3  4  4  4  4  4  4  5  3  1  3  5  4  4  5  1  5  6
## 66215  1  5  5  5  6  4  4  4  2  4  1  2  4  6  2  2  2  3  2  5  3  2  5  4
## 66216  2  5  6  6  6  4  5  3  1  2  3  1  4  6  1  5  4  2  6  5  6  1  5  6
## 66218  1  5  5  4  4  5  2  4  2  6  2  3  2  3  2  3  4  5  5  2  6  1  4  5
## 66219  4  4  4  4  2  5  5  3  2  5  3  4  2  2  4  4  5  4  4  3  5  1  5  5
## 66224  4  3  2  3  4  5  4  4  3  4  5  2  2  3  3  1  1  1  1  1  6  1  6  6
## 66225  1  5  3  4  5  5  5  5  2  3  4  2  3  5  5  1  2  1  2  1  4  6  3  4
## 66227  5  3  2  5  3  6  6  4  1  6  6  6  2  1  3  4  6  5  6  6  4  6  2  6
## 66231  4  5  6  6  5  5  5  6  1  4 NA  4  6  5  5  1  2  4  5  1  5  5  5  6
## 66233  1  6  6  6  6  5  4  4  2  3  4  2  6  6  6  2  1  4  1  1  6  1  5  5
## 66234  3  5  5  6  5  3  4  3  2  4  1  3  4  5  4  2  2  1  2  2  4  4  5  4
## 66237  5  5  6  6  5  5  4  5  2  2  4  5  4  2  3  6  5  5  3  1  5  6  4  6
## 66244  1  6  5  6  5  4  4  5  2  3  4  2  3  5  2  1  1  1  1  3  4  3  4  5
## 66245  3  4  4  4  4  5  5  4  4  4  5  5  3  3  4  3  4  4  4  4  3  1  4  5
## 66246  2  5  5  4  3  3  2  4  3  2  6  6  2  2  3  2  2  2  3  1  6  2  5  5
## 66247  2  6  5  6  4  2  3  3  4  5  3  4  3  4  2  3  5  4  4  4  3  5  3  6
## 66251  2  5  5  4  3  4  4  4  4  5  1  3  4  3  5  5  5  5  4  2  6  2  5  4
## 66253  4  6  4  6  5  4  6  5  3  2  4  4  4  5  4  2  3  4  4  2  4  1  4  5
## 66255  1  5  5  6  5  4  5  6  2  3  3  4  4  5  4  2  2  2  1  4  4  4  4  3
## 66256  3  5  5  3  5  6  4  4  3  5  5  4  3  2  4  2  3  4  5  2  3  3  5  5
## 66257  1  6  6  6  5  6  6  5  1  2  2  5  5  5  5  2  5  4  2  4  5  2  5  5
## 66259  2  5  5  6 NA  5  6  5  1 NA  2 NA  5  5  5  4 NA  4  2  1  5  1  5  5
## 66264  2  5  6  5  6  4  5  5  1  2  2  5  4  5  5  1  2  1  2  4  6  5 NA  6
## 66265  5  6  6  6  5  6  6  6  2  4  4  2  5  5  6  3  4  4  3  4  5  2  6  5
## 66266  1  5  4  4  4  6  4  5  1  2  6  4  1  2  2  1  1  1  5  1  4  1  5  5
## 66271  1  6  6  6  5  5  6  5  1  2  1  1  4  5  5  1  2  1  1  2  4  1  4  6
## 66272  2  6  1  6  5  4  6  5  2  3  2  3  5  1  4  4  4  2  3  2  4  4  5  6
## 66273  1  6  6  6  5  6  5  6  2  4  1  2  5  5  6  4  4  4  4  4  5  3  5  5
## 66274  3  4  6  6  6  3  3  2  3  3  1  1  5  6  4  4  4  3  2  5  5  4  6  4
## 66277  2  5  4  6  5  5  5  5  2  2  2  2  5  5  5  2  3  5  5  4  5  2  6  5
## 66278  1  6  5  1  5  3  2  2  4  6  5  5  3  4  5  2  4  4  5  2  4  4  3  6
## 66279  2  5  4  6  4  4  4  3  3  3  4  5  3  4  3  2  3  4  5  3  4  2  4  5
## 66281  1  6  6  6  5  4  4  4  3  1  3  3  5  5  5  3  3  1  1  2  5  3  5  4
## 66283  3  5  2  4  5  6  1  6  3  2  2  2  2  6  5  1  6  1  1  6  5  2  6  5
## 66286  1  6  5  6  4  6  6  6  1  2  4  6  2  1  5  5  6  6  4  6  4  4  2  5
## 66288  4  4  5  3  4  4  6  5  2  3  3  4  5  5  5  6  6  5  6  6  6  1  6  6
## 66289  5  5  4  5  5  5  5  4  5  5  5  5  5  5  5  4  4  3  4  2  5  5  4  4
## 66291  1  5  6  6  6  5  5  5  1  3  2  1  6  6  6  1  1  1  1  1  6  1  6  6
## 66294  1  5  6  5  5  2  6  3  1  5  2  3  5  4  4  1  2  1  2  1  4  2  5  6
## 66295  2  3  4  4  4  3  3  3  3  3  4  2  5  3  4  1  2  3  2  1  6  2  5  5
## 66297  1  6  5  6  5  4  4  3  4  5  4  5  4  4  3  3  4  1  2  3  6  2  5  6
## 66299  1  6  5  6  6  4  3  4  3  5  2  4  4  5  3  3  3  1  3  2  5  4  3  6
## 66304  2  5  5  5  5  4  3  5  2  4  3  4  3  5  4  3  4  1  3  4  4  2  3  5
## 66306  3  5  5  6  4  4  4  4  2  4  2  3  4  5  5  1  3  2  2  3  4  1  3  4
## 66307  1  6  5  6  5  5  5  4  3  3  1  2  4  6  5  1  2  2  2  2  5  4  5  6
## 66309  4  4  5  4  4  6  6  1  4  6  2  5  4  1  2  5  5  3  6  5  5  1  6  6
## 66311  1  6  4  6  4  5  6  6  2  2  4  4  5  4  6  2  5  1  2  1  6  1  6  5
## 66312  5  6  6  6  5  5  4  3  3  4  4  5  4  6  3  1  2  5  2  2  5  3  5  6
## 66314  3  5  5  6  6  6  5  6  2  1  1  1  4  6  5  2  2  1  1  2  5  3  4  5
## 66317  3  3  2  6  2  5  5  5  3  3  5  5  4  2  5  2  1  1  2  1  4  1  4  5
## 66318  2  6  5  6  5  5  5  5  2  4  3  6  4  3  5  3  5  5  4  6  4  4  3  6
## 66323  3  6  5  6  5  4  5  5  4  3  5  4  4  5  3  2  3  5  4  2  4  4  4  3
## 66324  2  5  4  4  4  3  2  4  2  4  2  3  4  5  5  3  4  4  4  3  6  1  6  6
## 66325  1  5  6  4  6  5  5  4  2  5  2  4  5  4  6  2  2  2  5  1  6  2  6  6
## 66326  2  5  5  6  4  5  5  5  3  2  2  6  2  2  5  1  2  3  2  3 NA  5  5  5
## 66329  2  5  4  6  5  4  4  4  2  3  2  3  5  5  5  2  2  2  2  3  4  3  4  4
## 66331  4  4  2  5  2  5  4  6  1  1  5  4  2  3  5  6  1  5  4  3  6  2  4  5
## 66337  1  6  6  5  5  2  1  2  5  5  1  2  5  5  4  1  3  3  3  4  6  1  6  6
## 66341  2  5  4  5  3  4  4  4  2  2  3  3  3  3  5  5  5  5  5  5  5  3  3  5
## 66344  1  6  6  6  5  4  2  2  4  4  2  1  4  6  5  2  3  2  1  2  6  2  5  5
## 66346  1  5  6  6  5  5  5  5  2  2  3  4  4  2  5  2 NA  2  4  4  6  1  6  6
## 66348  4  6  4  6  4  3  6  4  1  3  2  4  4  3  5  3  5  5  4  4  6  1  6  5
## 66349  1  6  6  6  6  5  6  6  1  1  6  4  1  4  1  1  1  1  2  6  5  4  4  1
## 66357  2  5  4  4  3  5  3  4  4  4  6  5  3  3  4  2  4  4  2  2  4  2  2  6
## 66360  2  5  6  6  6  3  6  3  3  4  1  1  3  6  6  3  4  3  1  3  6  2  6  5
## 66364  1  6  6  6  6  1  1  5  2  6  1  1  1  6  6  1  1  1  1  1  6  1  6  6
## 66368  2  5  5  6  4  4 NA  2  3  4  4  2  4  5  5  1  2  2  2  1  4  2  5  4
## 66370  2  5  5  6  4  5  4  2  3  4  4  2  4  5  5  1  2  2  2  1  4  2  5  4
## 66371  2  5  5  6  4  5  4  2  3  3  4  2  4  5  5  1  2  2  2  1  4  2  5  4
## 66372  2  5  5  6  4  5  5  2  2  3  4  2  4  5  5  1  2  2  2  1  4  2  5  4
## 66373  2  5  5  6  5  5  6  2  3  3  4  2  6  4  2  3  3  5  6  2  6  3  6  6
## 66376  4  6  5  4  5  2  5  4  3  2  4  2  3  5  5  5  4  1  4  2  6  4  5  5
## 66381  6  2  5  2  2  4  2  2  4  3  6  6  2  1  4  1  2  2  1  1  6  1  5  6
## 66382  2  3  4  3  4  6  5  4  2  2  3  2  5  3  6  4  4  3  2  1  6  1  6  4
## 66389  3  5  4  5  2  4  5  2  3  2  4  2  4  4  6  3  4  4  2  2  5  3  4  4
## 66391  1  6  5  1  3  6  6  5  1  4  1  6  4  5  6  1  5  1  6  5  6  3  5  6
## 66392  1  6  6  2  5  4  5  4  1  1 NA  1  4  3  6  5  4  1  4  5  4  1  4  6
## 66396  2  5  4  5  4  4  4  4  3  4  2  4  4  5  3  4  4  4  4  3  4  2  5  5
## 66399  3  6  5  4  5  4  3  5  2  3  1  3  4  4  6  4  4  4  3  4  5  5  6  4
## 66402  6  5  5  3  3  5  4  4  1  3  6  4  3  2  2  1  3  4  5  3  5  2  4  5
## 66403  1  4  4  2  2  4  3  4  4  6  4  5  2  1  2  5  5  5  5  4  5  3  5  6
## 66404  1  6  6  4  4  5  5  5  2  4  4  4  4  4  4  3  4  3  3  3  6  1  5  6
## 66405  1  5  6  4  6  3  2  3  4  4  1  1  6  6  5  5  2  4  4  2  6  3  4  5
## 66406  2  6  4  5  4  6  6  6  3  1  4  1  4  5  5  2  2  1  1  2  6  1  6  5
## 66408  2  5  6  6  5  6  6  5  1  1  4  1  5  6  5  2  2  2  1  2  6  3  6  5
## 66409  3  6  6  3  5  6  5  4  1  1  1  1  6  5  6  3  4  2  1  1  6  1  6  2
## 66410  2  3  4  2  3  3  5  4  4  6  6  4  2  2  4  4  5  5  5  2  5  3  5  5
## 66413  2  2  3  5  5  4  2  3  4  5  5  6  1  2 NA  2  3  2  4  5  6  2  5  6
## 66415  5  5  6  6  5  5  6  4  2  3  1  2  5  6  6  4  4  4  3  4  4  4  5  4
## 66419  4  4  5  4  5  3  3  3  4  4  6  2  4  5  4  3  4  5  3  2  3  4  3  4
## 66421  1  5  5  6  4  4  4  5  2  1  3  3  4  4  4  2  2  5  2  3  5  3  4  5
## 66425  1  6  3  3  4  6  3  6 NA  3  3  2  3  5  4  2  4  5  3  1  4  4  5  6
## 66429  3  5  4  6  4  5  5  5  2  2  4  4  4  4  4  3  3  2  4  2  5  2  4  6
## 66431  1  6  5  6  5  5  5  5  1  1  6  4  4  5  5  1  4  4  1  2  5  1  5  6
## 66434  2  2  5  5  5  5  5  5  2  2  2  2  5  5  4  2  2  2  2  2  4  4  4  4
## 66437  1  6  6  6  6  5  6  6  2  3  1  2  4  5  5  5  4  5  3  2  4  3  4  5
## 66438  1  6  5  6  5  3  4  4  2  2  2  4  4  3  3  2  2  1  4  3  4  2  4  4
## 66439  4  5  5  6  6  5  2  5  2  3  1  1  5  5  4  2  2  4  1  1  4  3  3  2
## 66440  1  5  5  5  6  1  2  5  5  6  2  1  4  3  1  1  1  1  2  1  5  5  2  2
## 66441  2  5  6  6  5  4  4  4  4  4  2  4  3  5  3  1  3  3  3  5  4  3  4  5
## 66444  4  4  3  4  5  5  5  2  1  2  4  1  1  5  4  1  1  1  1  3  3  4  4  4
## 66445  3  6  6  6  2  3  5  5  2  3  1  2  5  6  5  2  4  2  1  2  5  5  3  4
## 66447  5  3  2  4  4  4  6  5  2  2  2  3  5  5  5  5  5  3  2  4  6  3  5  2
## 66450  4  5  5  4  5  4  5  5  2  2  2  2  4  4  5  2  2  2  2  2  6  2  4  5
## 66451  1  5  6  6  6  2  4  4  1  2  3  1  5  5  5  1  1  1  1  1  4  1  3  5
## 66459  3  5  4  4  5  4  3  5  3  3  5  4  4  4  4  3  5  2  2  2  4  2  4  5
## 66463  1  5  6  4  5  2  5  4  3  6  4  6  3  2  2  1  3  3  2  2  4  2  4  6
## 66464  1  4  5  6  4  4  5  5  5  5  6  5  4  5  3  4  5  3  6  4  6  4  4  4
## 66469  1  6  6  5  6  4  4  3  2  4  2  1  6  6  5  1  2  1  3  2  5  2  6  3
## 66472  4  4  6  6  5  6  4  4  4  6  1  3  5  5  4  1  2  3  6  2  2  3  3  5
## 66474  5  6  5  6  6  5  5  6  4  2  5  5  5  5  5  5  4  4  4  5  5  6  4  6
## 66475  1  4  5  3  3  6  6  4  2  6  1  4  4  2  2  3  4  2  6  5  6  6  6  6
## 66476  1  6  3  5  6  6  5  6  1  4  4  4  5  4  2  4  5  6  2  4  5  1  5  6
## 66483  1  5  5  6  6  5  5  4  1  2  3  1  4  5  4  1  2  1  2  2  4  5  4  5
## 66484  1  6  6  6  6  1  5  6  3  4  4  1  5  5  6  1  1  1  1  1  6  4  5  5
## 66485  4  5  4  6  5  4  6  5  1  1  2  3  4  6  5  1  1  1  1  1  5  1  6  3
## 66486  1  6  6  6  5  5 NA  5  1  2  3  2  3  3  2  2  2  1  2  4  3  2  5  6
## 66487  2  5  2  1  2 NA  5  4  1  6  3  5  2  3  5  1  5  5  2  1  4  3  2  2
## 66488  6  5  5  4  5  6  4  5  4  5  3  5  4  5  4  4  5  6  4  5  6  1  5 NA
## 66491  2  5  5  5  6  4  4  5  4  4  4  4  4  5  4  3  2  4  3  4  4  6  2  4
## 66492  2  5  5  6  4  2  2  4  3  2  3  3  2  4  4  2  2  2  3  4  3  2  4  4
## 66493  2  4  2  6  4  3  5  5  3  4  1  3  4  5  6  4  5  3  4  6  4  4  4  5
## 66495  1  6  6  6  6  6  6  4  1  4  1  2  5  6  5  2  3  3  2  4  5  3  4  5
## 66496  2  4  5  5  6  6  4  4  2  4  5  4  2  3  2  1  2  2  2  5  2  5  2  5
## 66497  3  4  5  5  3  4  5  5  3  3  5  2  2  6  2  3  2  3  4  2  3  5  3  4
## 66498  1  5  5  5  6  3  5  2  2  4  3  2  3  5  3  2  2  2  3  4  4  4  4  4
## 66499  2  2  2  4  1  5  5  5  2  3  4  5  3  2  4  3  5  2  2  4  6  2  3  6
## 66500  2  2  1  6  4  6  6  6  1  1  5  5  3  1  2  4  5  2  4  4  4  1  1  6
## 66501  1  6  5  6  4  5  5  5  1  2  3  3  3  4  4  2  3  3  1  2  6  2  4  5
## 66503  1  5  6  6  5  6  4  6  4  2  3  3  3  5  6  2  1  1  1  6  4  1  5  5
## 66504  3  4  4  2  5  6  6  4  2  5  2  2  5  2  5  6  5  6  6  6  5  6  4  6
## 66506  2  3  5  4  5  5  4  5  2  3  2  2  6  6  6  3  4  2  2  1  5  2  4  6
## 66507  4  4  2  5  3  6  6  6  1  2  5  3  4  4  2  2  2  1  1  1  3  5  3  5
## 66509  1  6  6  6  6  6  1  5  1  1  2  1  6  6  6  1  1  1  1  1  6  1  5  2
## 66511  1  6  5  6  4  6  5  5  2  4  2  6  2  3  5  1  4  4  4  3  5  3  6  6
## 66512  2  6  5  6  5  6  6  6  1  1  1  1  5  6  6  2  5  1  1  1  6  2  6  5
## 66513  2 NA  6  4  6  5  3  5  1  1  1  1  4  6  5  1  4  1  1  2  5  3  5  5
## 66514  2  5  3  6  3  4  3  3  5  4  6  6  3  3  1  1  2  3  4  1  4  2  4  5
## 66517  2  4  4  5  5  6  6  5  2  4  3  4  3  2  5  4  5  5  6  5  5  2  4  6
## 66520  4  5  6  4  5  3  1  3  1  2  1  2  5  6  4  4  2  2  3  1  5  6  2  6
## 66522  3  5  4  6  5  5  5  4  2  3  1  1  4  6  5  3  3  5  2  3  5  4  5  5
## 66525  4  4  5  4  5  5  5  5  3  5  2  5  4  5  4  4  5  5  4  5  2  4  3  6
## 66526  1  5  6  5  4  5  5  4  1  3  2  2  3  5  5  2  2  2  1  4  3  4  4  4
## 66528  2  5  4  3  5  4  2  5  2  2  2  2  4  6  5  2  2  1  2  2  3  3  4  3
## 66529  1  4  4  5  6  6  5  6  1  1  2  2  6  5  5  2  4  3  1  4  6  1  6  6
## 66531  3  5  4  4  2  3  4  6  3  3  1  3  3  4  5  2  4  1  1  3  5  4  4  2
## 66532  3  4  4  5  3  5  5  5  3  3  3  4  5  4  5  3  3  4  4  4  5  3  5  4
## 66533  2  6  5  3  6  5  6  4  5  4  4  5  3  3  2  2  2  3  3  6  5  3  5  6
## 66534  2  6  4  6  4  5  5  5  4  6  3  4  4  4  5  4  4  2  2  2  5  5  5  4
## 66538  3  4  3  6  4  3  3  5  3  2 NA  4  3  3  6  3  2  3  2  5  6  2  6  6
## 66540  1  6  6  6  6  6  4  6  1  2  1  2  2  6  3  1  1  1  1  2  4  4  4  6
## 66545  2  4  3  2  4  5  5  5  3  5  4  4  4  2  5  4  4  5  5  4  5  3  4  6
## 66546  6 NA NA NA  4  6 NA NA NA  4 NA  4 NA  6 NA NA  4  6 NA NA NA  4 NA  6
## 66549  2  5  6  6  6  5  5  5  4  4  1  1  5  6  5  1  1  1  1  3  5  5  5  5
## 66550  1  5  5  5  5  5  5  4  2  4  6  2  4  5  5  1  4  2  5  3  6  1  5  6
## 66551  2  5  5  2  5  5  5  4  3  3  2  3  3  3  5  2  4  2  4  3  4  3  4  5
## 66552  1  4  6  6  2  6  6  3  2  1  6  6  3  2  2  2  3  2  6  6  6  2  3  6
## 66553  4  6  5  6  6  4  5  6  1  1  2  2  5  5  2  2  2  6  3  1  6  1  4  3
## 66554  6  1  1  6  1  6  5  6  1  1  6  6  1  1  1  1  1  1  1  1  6  1  1  6
## 66560  3  5 NA  4  4  4  4  5  3  4  6  4 NA  2  4  2  3  2  3  2  4  3  4  4
## 66562  1  6  6  6  6  6  5  5  1  4  1  1  2  5  6  6  6  5  4  1  6  1  6  6
## 66563  4  6  2  2  4  5  4  4  2  4  2 NA  5  4  6  5  5  6  4  2  5  2  5  5
## 66564  1  4  4  1  6  5  4  4  4  6  1  1  4  6  6  5  6  4  6  6  5  1  6  2
## 66566  3  4  3  1  4  2  2  1  4  5  4  5  1  2  5  4  4  3  6  5  6  1  6  6
## 66568  5  4  5  6  3  4  5  6  2  1  1  3  3  5  6  4  6  4  4  4  6  6  6  3
## 66569  2  4  6  4  6  5  5  4  1  2  2  1  6  5  6  1  2  2  1  1  6  1  6  5
## 66570  4  4  4  4  4  4  5  4  4  5  2  4  5  4  4  3  5  3  3  4  4  5  4  5
## 66572  5  5  4  6  4  3  5  5  3  1  6  3  4  5  2  1  1  1  1  2  5  1  4  5
## 66574  4  4  3  4  2  3  3  4  5  5  3  5  4  4  5  5  5  4  5  5  4  4  4  6
## 66575  6  6  6  6  6  6  4  1  2  1  1  1  6  6  6  6  6  6  1  4  6  1  6  3
## 66576  1  6  5  5  5  3  4  6  4  5  1  5  4  5  4  5  5  5  6  6  5  4  4  5
## 66582  1  5  4  5  2  4  4  4  1  4  2  5  1  4  4  5  5  4  5  4  5  2  5  5
## 66583  1  4  4  2  2  5  3  6  2  6  5  6  1  1  1  5  6  6  5  6  5  5  4  6
## 66585  2  5  4  6  4  4  3  5  3  4  3  5  3  3  4  2  4  2  3  5  2  4  4  4
## 66588  1  6  6  6  5  4  6  6  1  3  4  4  5  4  6  2  2  2 NA  5  6  4  5  5
## 66589  3  4  5  6 NA  5  5  5  4  3  5  4  4  3  4  2  3  4  5  4  5  4  4  4
## 66591  2  3  3  5  4  5  5  3  3  4  4  4  4  5  3  3  4  5  4  4  4  3  4  5
## 66596  1  5  5  6  5  5  5  5  2  1  3  5  4  2  6  2  5  2  2  3  5  1  5  6
## 66598  2  6  6  6  6  5  6  6  1  2  1  2  5  6  5  1  2  2  2  4  5  3  5  6
## 66601  5  4  4  6  3  3  4  5  3 NA  4  3  3  2  3  2  4  4  5  3  5  3  4  4
## 66604  1  6  6  5  6  5  5  4  1  2  2  3  4  5  5  2  2  5  4  3  6  2  4  6
## 66605  4  4  6  3  6  5  5  2  4  6  2  3  6  6  4  3  4  5  2  3  6  5  6  6
## 66606  4  4  5  4  5  6  5  4  2  2  4  5  5  5  4  2  2  2  2  2  6  1  5  6
## 66607  2  6  5  6  5  4  6  5  3  3  2  3  4  5  4  2  3  4  2  3  5  3  4  5
## 66609  3  5  3  3  4  5  5  5  4  4  4  4  2  2  4  2  4  4  4  4  4  2  5  5
## 66610  5  4  4  5  2  4  5  3  5  6  2  6  2  5  4  5  6  4  5  4  4  2  5  5
## 66612  2  5  4  4  5  6  6  5  2  6  5  5  3  3  6  4  4  5  6  1  5  1  4  5
## 66615  2  4  5  6  4  5  5  2  3  3  2 NA  5  5  5  2  3  2  3  1  6  1  5  3
## 66617  4  5  6  6  5  6  6  4  2  4  2  4  5  5  5  2  4  2  4  4  6  1  5  6
## 66619  3  5  2  6  2  6  5  5  1  1  5  5  4  5  4  5  4  2  1  1  5  2  5  5
## 66620  1  5  5  5  5  5  5  4  3  6  5  6  4  5  4  5  6  4  5  6  5  2  5  5
## 66621  1  6  6  6  6  6  6  6  1  1  6  6  3  1  4  6  6  6  6  6  6  4  2  6
## 66622  3  4  5  5  4  4  2  2  5  5  1  1  4  6  5  4  5  4  2  4  4  1  3  3
## 66623  3  3  3  4  5  4  5  3  3  5  3  2  4  5  4  2  2  4  3  2  6  2  4  5
## 66630  2  5  5  6  5  4  3  5  3  2  1  2  4  6  6  2  2  3  2  1  5  5  4  5
## 66635  5  2  5  6  2  2  5  2  5  6  5  5  3  4  2 NA  5  6  5  5  6  1  5  6
## 66637  3  3  3  6  4  3  4  5  3  2  3  3  4  5  3  2  4  2  5  5  3  4  3  4
## 66638  4  2  1  2  2  5  4  3  2  2  3  6  3  4  5  2  2  2  2  1  6  1  5  6
## 66642  3  6  6  4  3  5  6  5  4  3  6  5  4  6  5  6  6  4  5  5  4  5  4  5
## 66645  2  5  5  5  5  6  4  4  3  3  4  6  3  3  4  3  4  3  4  3  5  2  4  4
## 66646  1  6  6  6  6  6  5  5  2  5  2  2  4  6  5  1  2  1  2  2  6  2  5  5
## 66647  1  6  6  6  5  5  5  5  4  4  5  3  6  2  2  4  5  4  4  6  4  5 NA  5
## 66648  1  6  5  6  4  5  5  2  2  2  4  2  4  5  5  2  3  1  1  1  5  2  6  5
## 66649  4  4  4  3  3  5  4  4  1  4  1  2  3  4  5  4  4  5  3  2  6  3  4  5
## 66651  1  4  5  1  5  4  5  2  3  3  2  2  3  5  5  3  4  3  3  4  4  4  4  6
## 66653  3  4  5  1  5  5  4  5  2  6  5  4  1  5  3  4  5  1  2  6  4  2  3  4
## 66657  2  6  6  6  6  5  6  6  3  1  1  1  6  6  5  1  1  2  2  2  6  4  4  6
## 66660  4  4  5  2  3  4  4  5  3  3  2  2  6  6  5  3  3  3  4  1  6  3  6  6
## 66662  2  5  6  5  6  6  5  6  2  1  2  1  6  6  6  1  1  1  1  1  6  2  5  6
## 66663  3  5  4  6  5  4  5  4  4  4  2  5  2  5  3  3  3  4  4  2  4  2  4  5
## 66664  2  5  4  5  5  5  6  2  2  2  6  4  2  5  2  2  2  2  4  6  2  5  2  2
## 66665  2  5  5  1  5  4  3  4  2  3  3  4  4  4  4  2  3  2 NA  3  3  2  3  5
## 66666  2  5  5  6  5  5  6  5  2  1  4  4  4  5  6  2  2  2  2  2  5  1  4  6
## 66668  1 NA  4  6  4  4  6  4  1  1  4  4  5  6  4  4  4  4  4  2  5  4  5  2
## 66669  1  5  5  4  4  4  5  5  2  4  1  2  4  5  4  4  5  5  3  4  4  4  5  6
## 66671  2  5  5  4  5  4 NA NA  2  2  2  2  5  5  6  2  2  1  5  2  4  2  4  5
## 66674  1  5  4  6  5  6  6  6  1  1  1  2  4  6  5  2  2  2  1  4  6  1  6  6
## 66676  1  5 NA  6  4  2  3  4  3  2  1  1  2  1  3  2  4  3  2  5  5  4  4  4
## 66679  4  4  5  6  3  5  3  4  4  4  3  3  5  5  5  5  4  5  3  1  6  1  4  5
## 66680  1  4  5  2  3  5  4  4  2  4  1  2  3  5  5  4  3  2  3  4  4  5  2  5
## 66681  3  5  6  6  6  4  6  4  2  2  2  1  4  6  6  3  5  2  5  6  6  6  5  5
## 66682  5  3  3  6  2  5  6  4  1  2  1  2  3  5  5  5  5  3  2  4  5  2  3  5
## 66683  1  5  5  4  5  4  3  4  3  3  2  2  5  5  5  4  4  4  4  4  6  1  4  4
## 66684  1  5  4  6  5  5  5  3  2  3  5  2  2  5  5  4  4  5  2  3  4  2  4  5
## 66685  1  6  6  5  5  5  5  4  2  2  3  3  5  4  6  2  4  4  3  3  4  2  5  4
## 66689  5  5  3  6  4  4  3  5  4  4  2  4  4  5  5  4  4  3  3  4  4  4  3  4
## 66690  2  4  1  1  5  3  2  4  3  4  1  4  5  6  3  4  4  2  2  4  6  5  4  6
## 66692  3 NA  6  4  6  6  6 NA  5  1  1  1  6  6  6  4  5  2  2  6  6  3  5  4
## 66694  4  6  6  6  6  5  4  5  2  3  2  1  6  5  5  1  1  2  2  2  4  2  3  4
## 66700  4  3  5  4  2  6  6  5  1  2  6  6  6  1  2  5  6  6  6  6  6  1  5  6
## 66701  1  5  6  6  6  5  6  6  3  4  2  3  5  6  5  2  5  5  4  4  5  4  4  5
## 66703  1  5  4  6  5  5  4  6  4  4  1  1  6  6  6  2  2  3  1  2  6  4  6  5
## 66704  2  5  3  5  4  3  3  3  5  5  2  5  2  5  4  3  4  6  4  3  5  4  3  6
## 66708  4  6  2  5  5  6  5  6  2  3  2  2  5  5  6  3  4  4  3  3  6  2  5  5
## 66711  1  6  6  6  6  3  3  5  3  5  3  5  5  6  1  2  2  2  4  6  2  5  4  6
## 66712  2  4  5  3  4  5  5  5  4  3  2  5  5  2  5  4  5  5  5  5  6  1  5  6
## 66713  2  4  1  2  2  5  5  4  1  6  2  2  2  5  5  1  4  2  2  1  2  4  4  4
## 66716  4  5  4  2  4  5  6  5  2  6  5  4  4  4  5  2  4  4  6  5  4  6  4  5
## 66717  4  4  3  3  3  3  4  2  5  6  4  5  3  2  5  4  5  6  4  5  6  3  4  6
## 66718  2  5  3  6  5  2  4  5  3  4 NA  5  5  5  5  3  4  5  4  5  5  3 NA  4
## 66722  3  5  6  6  6  6  6  3  1  2  4  2  6  5  6  4  4  2  2  2  5  1  6  6
## 66723 NA  6  6  6 NA  2  6  4  3  6  1  6  5  5  3  1  3  3  5  6  4  5  3  6
## 66724  1  6  5  4  5  5  5  6  3  3  4  3  2  4  5  2  3  2  3  5  3  3  5  6
## 66727  1  6  6  4  5  6  6  6  1  1  1  1  6  6  6  5  5  5  4  2  6  1  6  6
## 66728  1  5  5  3  4  4  5  5  2  3  5  5  4  1  4  3  3  4  4  4  5  4  2  5
## 66729  4  5  6  1  6  6  5  5  1  5  1  1  6  6  6  2  5  1  4  1  6  1  6  6
## 66730  1  5  5  6  6  2 NA  3  2  6 NA  2  5  5  5  1  4  2  1  4  4  6  5  4
## 66731  3  5  5  3  3  6  5  5  3  3  2  5  3  2  4  3  5  5  4  4  6  1  6  5
## 66733  1  4  4  4  5  4  4  4  2  4  2  2  4  6  1  2  2  4  2  4  2  6 NA  5
## 66734  2  5  5  1  5  5  3  4  2  4  2  4  3  5  5  1  3  2  4  1  4  2  3  5
## 66737  1  6  6  6  6  4  4  5  1  1  1  1  6  6  6  2  2  2  1  1  6  2  5  5
## 66739  2  6  5  6  6  4  4  5  4  5  1  6  5  1  5  2  2  3  6  2  6  1  6  4
## 66741  2  5  5  3  5  5  4  6  3  4  2  2  5  6  6  4  5  4  2  2  6  2  5  5
## 66743  2  5  5  3  6  5  5  3  2  2  4  5  2  5  3  1  1  1  4  3  6  1  6  3
## 66744  1  5  5  4  5  5  5  4  2  5  4  4  4  2  3  3  4  6  6  3  4  2  5  6
## 66745  1  6  5  6  5  5  6  5  1  4  2  4  4  6  5  5  4  1  1  5  6  6  5  6
## 66748  3  2  5  6  6  6  6  6  1  1  6  5  5  1  4  6  6  6  5  1  6  1  6  6
## 66749  2  5  3  1  4  6  6  5  1  1  2  4  5  5  6  3  4  5  4  2  6  1  5  5
## 66751  1  6  6  6  6  5  5  5  1  1  4  1  4  5  5  2  1  1  4  3  5  4  4  5
## 66755  2  5  5  5  5  4  5  4  3  3  4  3  4  5  4  2  2  4  2  3  4  2  5  5
## 66756  5  3  6  6 NA NA  6  5  5  1  5  5  5  6  6  1  5  3  5  2  5  3  4  4
## 66757  1  5  4  2  3  4  4  4  4  4  2  5  3  3  5  4  5  5  5  4  5  2  5  6
## 66760  2  2  4  6  4  4  4  4  2  2  4  6  3  2  3  1  3  3  2  2  5  3  2  5
## 66764  2  5  5  6  5  1  5  5 NA  2  1  2  5  5  5  1  4  4  2  5  4  3  4  3
## 66766  2  5  6  5  6  3  2  2  5  5  2  2  6  5  5  1  2  6  3  4  6  6  4  5
## 66768  3  5  2  6  2  6  5  6  1  1  5  4  2  1  5  2  4  1  1  1  2  4  2  5
## 66769  5  6  5  6  6  5  5  4  4  2 NA  2  6  6  5  5  2  6  4  2  5  5  4  4
## 66770  4  5  5  3  6  6  5  5  4  4  4  2  2  5  5  2  2  5  4  4  6  1  4  5
## 66771  2  4  4  5  4  2  2  2  5  5  5  5  2  5  3  5  5  6  6  2  4  5  3  4
## 66772  5  4  4  4  3  6  5  5  4  2  5  3  4  2  5  5  5  2  2  1  6  1  5  6
## 66775  1  6  6  5  6  5  5  5  1  2  4  3  2  5  6  1  1  1  4  1  5  2  5  5
## 66778  1  6  5  5  5  6  5  5  1  1  4  3  4  5  4  3  4  3  5  2  3  2  5  3
## 66779  1  6  5  6  6  5  5  5  1  3  2  1  6  6  6  1  1  1  1  1  6  1  6  6
## 66785  1  6  6  5  6  3  3  6  1  1  2  6  5  2  5  1  1  1  5  1  4  2  4  4
## 66788  5  6  5  6  5  5  6  6  2  6  2  1  5  5  6  5  6  6  6  6  6  2  4  6
## 66790  1  5  5  5  4  5  6  5  1  5  1  1  5  5  6  4  5  5  4  4  4  2  5  5
## 66792  3  4  5  6  5  2  6  5  2  1  5  4  3  5  4  1  2  1  2  1  5  5  4  4
## 66793  2  6  6  6  3  4  5  5  1  2  4  4  1  4  4  2  2  1  1  1  5  4  5  5
## 66797  1  5  4  6  5  5  5  2  2  5  3  2  4  5  4  4  5  5  3  1  5  1  5  6
## 66800  1  6  6  6  6  5  5  5  1  2  1  1  6  6  6  4  5  4  1  2  6  1  6  6
## 66801  1  5  5  6  5  4  5  5  1  3  1  2  5  6  5  1  1  1  2  4  5  1  4  6
## 66804  1  6  6  6  6  6  5  4  1  1  2  6  6  5  4  1  2  4  4  6  5  1  4  5
## 66806  3  5  5  5  5  4  5  5  3  3  6  3  5  5  4  2  2  1  2  2  2  5  5  5
## 66807  1  6  5  6  6  2  4  4  4  3  1  1  6  6  5  1  6  2  2  3  4  5  5  6
## 66810  2  4  3  5  5  5  4  5  2  5  6  5  2  4  4  1  1  1  2  2  4  5  2  5
## 66812  1  5  6  5  6  5  5  5  2  6  3  6  6  6  5  2  2  3  2  1  6  2  3  6
## 66813  3  5  6  5  5  5  4  2  4  4  1  1  3  6  4  1  1  1  2  2  5  3  4  3
## 66814  1  6  6  5  6  5  6  4  2  4  2  1  6  5  6  2  4  2  2  3  5  5  6  6
## 66817  1  5  5  6  5  3  2  4  5  4  4  3  2  5  2  1  1  1  1  3  4  4  4  5
## 66819  5  6  6  5  5  4  3  5  3  6  3  3  3  2  6  1  2  1  2  1  5  1  5  4
## 66820  2  5  4  5  3  6  5  4  2  4  3  2  4  5  5  2  4  2  3  1  6  1  5  5
## 66824  3  4  4  6  3  4  6  5  3  4  4  4  3  3  4  3  5  4  3  3  4  5  3  4
## 66826  2  5  5  4  6  2  2  4  3  4  2  1  6  6  6  5  6  5  4  2  6  3  5  5
## 66830  1  5  5  6  5  3  2  3  4  4  1  1  5  6  4  3  4  5 NA  4  4  3  5  4
## 66831  5  5  5  5  4  5  4  5  3  2  2  5  4  5  3  2  3  5  2  3  5  4  4  5
## 66832  2  4  4  5  4  3  1  3  5  5  5  4  2  3  2  2  2  2  4  3  4  5  2  5
## 66833  1  5  4  6  4  1  6  6  1  3  6  6  2  2  2  4  4  5  3  4  2  5  1  4
## 66838  1  6  6  6  5  6  6  5  2  2  6  6  5  1  5  2  2  6  4  2  6  1  6  6
## 66839  2  5  5  4  5  4  2  2  2  3  1  2  5  5  6  4  5  6  3  4  5  2  5  6
## 66840  4  6  5  6  4  6  4  5  2  2  3  2  5  5  4  2  4  1  2  1  6  4  4  6
## 66842  3  6  5  5  5  5  4  3  1  1  6  3  6  5  5  4  4  3  2  1  5  2  6  2
## 66843  3  4  4  2  6  5  3  5  5  5  2  5  4  5  5  3  3  5  5  2  6  2  4  5
## 66845  1  4  6  2  6  5  5  5  1  3  1  1  6  6  6  4  3  3  2  4  6  6  5  6
## 66847  1  4  4  5  4  4  3  2  2  4  2  3  5  5  4  4  4  2  2  2  4  1  3  3
## 66848  1  6  6  5  6  6  6  6  1  2  2  1  6  6  5  3  4  4  2  5  6  4  5  5
## 66850  4  4  4  4  4  4  5  4  2  2  4  5  3  2  5  2  4  3  3  3  4  1  4  5
## 66853  1  6  5  5  5  5  4  5  2  2  2  2  4  5  5  2  2  4  3  2  4  3  4  5
## 66855  1  5  5  6  5  5  4  4  2  5  1  3  4  3  3  2  4  5  5  3  5  3  4  5
## 66856  1  6  5  6  6  4  5  4  2  4  1  4  3  6  6  5  4  5  5  6  6  3  5  6
## 66857  3  2  2  4  4  3  5 NA  2  5  3  6 NA  1  4  2  3  2  5  2  6  3  4  6
## 66858  1  5  5  2  5  5  3  5  2  6  2  4  4  4  5  4  4  4  6  5  6  5  5  6
## 66860  2  5  5  4  5  5  4  4  3  4  4  3  5  4  4  1  1  1  2  2  4  4  4  5
## 66863  1  5  5  4  5  4  5  4  3  6  6  6  4  2  4  3  4  4  4  4  5  4  4  6
## 66864  5  5  4  5  4  5  6  5  3  6  4  2  2  5  4  3  2  3  3  1  5  2  6  6
## 66867  1  4  5  4  5  3  5  4 NA  2  4  2  5  4  4  3  3  3  2  4  5  3  6  5
## 66868  3  2  2  1  5  2  1  1  4  3  5  5  5  2  4  2  4  4  5  3  4  1  5  6
## 66869  2  4  5  5  5  5  5  2  2  2  2  3  4  3  3  2  2  1  3  4  6  2  5  5
## 66872  2  5  5  6  5  5  6  4  2  3  2  4  5  5  4  6  6  5  6  5  5  2  5  2
## 66873  1  4  2  4  6  5  4  6  1  1  3  4  6  6  6  6  6  4  4  1  6  1  6  6
## 66879  1  6  6  1  6 NA  4  5  2  2  1  1  6  6  5  1  2  3  6  2  5  1  6  6
## 66886  1  6  6  6  6  6  6  5  1  1  1  1  6  6 NA  1  1  1  1  1  5  3  6  3
## 66887  4  1  2  4  2  5  5  4  1  2  5  5  4  1  3  6  6  6  5  6  5  1  6  6
## 66890  1  6  6  5  6  1  1  3  5  6  4  1  5  6  5  2  2  2  2  1  5  1  6  6
## 66892  2  5  5  6  4  6  6  6  1  2  4  4  5  4  6  4  4  4  5  4  4  2  4  6
## 66896  3  3  1  4  3  5  4  2  3  2  3  2  3  3  5  2 NA  1  1  1  6  1  6  6
## 66897  4  4  3  1  3  5  5  6  1  2  2  4  4  4  4  4  5  6  4  5  5  3  4  5
## 66898  2  5  6  4  4  4  4  4  3  5  5  5  3  3  3  5  5  5  6  5  2  5  3  6
## 66899  5  2  1  1  4  4  2  3  5  6  5  4  4  5  3  6  5  5  6  1  5  6  2  6
## 66902  3  4  2  2  3  3  6  6  1  4  3  3 NA  5  6  5  5  5  4  5  6  4  4  4
## 66903  3  4  3  4  5  3  4  2  4  5  3  5  1  3  2  4  4  3  4  5  4  6  3  5
## 66905  4  4  4  5  4  4  4  5  4  2  5  4  4  4  4  4  4  4  4  5  4  4  4  4
## 66911  4  6  4  2  5  5  4  5  2  5 NA  4  4  4  5  1  3  1  2  1  4  2  4  4
## 66916  3  2  2  2  2  5  5  4  3  2  6  4  3  1  1  1  2  2  4  3  2  4  4  4
## 66917  4  1  3  3  5  4  2  4  4  4  4  5  4  4  1  1  2  4  5 NA  4  1  6  4
## 66918  1  6  5  5  5  5  2  1  1  6  2  4  5  4  3  1  2  4  5  2  6  1  5  6
## 66919  2  4  4  2  2  5  5  6  2  4  4  4  2  5  1  6  6  6  6  5  6  1  5  6
## 66920  2  5  5  5  4  5  5  6  1  5  2  4  3  5  2  4  5  2  4  4  2  2  3  5
## 66921  2  5  5  5  6  4  3  3  4  4  3  2  6  6  5  2  2  2  2  2  6  2  5  6
## 66924  4  4  3  6  5  4  5  4  1  3  2  3  4  4  5  4  4  4  4  3  4  3  2  4
## 66925  1  6  5  1  5  6  5  5  2  1  3  3  5  5  5  1  2  3  2  2 NA  1  6  6
## 66926  1  5  6  6  6  5  5  5  1  5  2  4  6  5  4  4  5  4  3  5  6  4  5  6
## 66927  1  6  6  6  6  5  5  5  2  4  5  4  5  2  4  2  2  1  1  1  4  2  4  6
## 66929  1  5  4  6  4  6  5  5  3  4  5  5  2  4  3  1  1  4  4  2  5  2  5  6
## 66930  2  6  5  6  4  4  5  5  2  2  3  4  4  5  5  2  2  2  2 NA  5  1  5  4
## 66932  4  2  1  1  2  6  5  6  2  4  6  6  1  1  3  2  4  2  1  3  1  2  1  4
## 66934  2  5  4  6  2  5  2  4  2  3  3  5  4  4  4  2  4  2  2  1  6  2  6  6
## 66935  1  5  5  1  2  5  4  3  2  5  2  5  4  2  4  6  6  2  2  2  6  1  4  6
## 66937  1  6  6  3  6  6  5  6  2  2  4  2  6  6  6  1  3  1  4  4  6  2  6  6
## 66944  4  4  4  5  5  5  5  3  4  3  3  2  4  6  4  5  3  3  3  4  4  4  4  3
## 66945  2  4  3  6  5  5  6  5  1  2  2  2  2  6  1  3  4  4  4  5  3  5  4  4
## 66946  1  5  3  6  3  2  1  4  5  4  5  2  2  3  6  5  4  4 NA  3  4  2  3  4
## 66947  1  6  5  5  4  5  5  5  2  4  2  3  5  2  6  3  3  3  3  2  6  1  6  6
## 66949  1  6  4  4  2  5  6  3  3  5  1  1  6  5  6  4  5  2  3  1  6  1  6  6
## 66953  1  4  4  4  5  2  1  3  6  5  2  2  5  5  5  5  4  6  4  4  5  3  5  6
## 66960  2  5  5  5  5  3  4  5  4  4  4  6  3  3  4  2  3  3  4  3  4  3  4  5
## 66962  2  5  5  5  4  5  5  5  3  5  2  4  4  4  5  4  4  2  3  5  4  5  3  5
## 66965  4  4  2  4  6  5  4  4  3  4  2  4  5  3  5  1  1  1  2  2  5  1  5  4
## 66968  3  3  4  2  4  5  4  5  5  6  1  3  4  3  5  5  5  5  4  5  4  3  6  5
## 66970  4  2  6  6  2  6  6  1  3  1  2  1  5  6  1  4  3  4  1  2  5  2  4  5
## 66982  1  6  6  5  5  5  6  5  1  1  1  2  5  3  6  2  2  2  2  4  6  1  6  5
## 66983  3  5  4  5  5  6  5  6  5  1  5 NA  5  4  3  1  1  1  1  1  4  2  4  3
## 66985  2  4  5  5  4  5  5  5  2  2  4  4  4  5  5  1  2  1  3  1  5  4  5  5
## 66986  5  4  3  4  5  3  3  2  3  5  3  3  4  4  5  3  2  3  5  3  4  2  3  4
## 66987  1  5  4  5  2  2  5  2  1  4  4  6  4  3  1  3  1  4  6  6  2  4  2  5
## 66988  1  5  5  5  6  6  4  5  2  5  1  2  4  5  4  3  4  2  4  2  5  2  6  6
## 66994  4  4  4  4  4  6  5  2  4  6  6  6  1  1  2  5  5  6  6  5  5  1  5  6
## 66995  1  6  5  4  5  4  6  5  4  5  4  5  5  4  4  5  5  4  4  5  6  1  5  6
## 66997  2  1  1  1  2  4  1  6  2  4  5  6  1  1  2  3  2  1  5  2  2  5  5  4
## 67000  1  5  5  5  4  1  1  1  1  4  2  4  3  5  4  2  4  4  1  1  5  2  4  3
## 67003  1  5  4  2  2  3  1  5  4  6  6  6  1  1  2  5  5  6  5  6  3  2  4  6
## 67007  3  2  2  2  3  5  6  2  2  4  6  6  2  2  2  2  2  2  6  3  4  1  4  6
## 67008  5  5  5  6  5  5  6  5  4  3  4  4  5  5  4  4  4  5  5  4  5  4  5  5
## 67013  1  6  5  5  6  4  2  4  4  4  2  2  5  6  3  1  1  1  1  1  5  5  4  5
## 67014  2  6  5  4  5  5  4  5  5  2  4  1  2  4  5  2  2  2  1  1  4  3  5  6
## 67017  1  5  5  2  6  6  5  4  2  6  5  5  1  5  4  1  4  5  6  6  5  2  4  6
## 67018  1  6  6  4  6  6  6  5  1  3  1  1  6  6  6  1  1  1  1  1  6  1  6  6
## 67019  4  5  4  6  5  6  6  4  1  2  3  2  5  4  4  1  2  4  3  4  5  1  4  5
## 67022  1  4  5  5  4  3  5  2  4  2  5  4  4  2  2  3  4  5  4  5  5  4  5  4
## 67023  2  4  5  2  5  5  5  4  1  3  1  2  5  5  6  3  5  2  1  1  5  1  5  4
## 67024  5  2  3  3  2  6  4  6  2  3  4  5  4  3  5  5  1  2  2  1  5  1  6  6
## 67025  1  6  6  6  6  6  6  5  1  2  1  3  5  6  6  3  3  5  2  5  5  3  4  5
## 67026  3  5  3  5  5  2  3  5  3  5  2  1  5  2  5  5  6  4  2  2  6  3  5  3
## 67027  2  5  5  4  5  5  3  5  2  4  2  5  5  6  4  4  3  4  4  4  5  4  5  5
## 67029  5  4  2  6  4  5  6  4  2  5  1  6  4  5  4  5  5  4  4  4  6  4  4  5
## 67031  2  4  3  4  4  5  5  5  2  3  4  5  6  5  5  3  3  4  4  4  5  2  5  5
## 67033  1  6  5  3  5  5  5  6  3  2  4  5  3  4  4  3  3  4  4  4  4  1  4  5
## 67034  4  4  5  4  5  4  4  4  3  2  2  2  4  4  4  5  5  6  4  5  4  4  4  4
## 67036  3  5  4 NA  6  4  5  5  1  2  2  1  5  6  5  3  4  3  5  4  5  4  5  3
## 67039  2  6  5  4  4  4  4  4  4  6  1  4  4  6  5  4 NA  5  4  1  3  5  2  2
## 67040  2  2  1  2  3  3  3  2  3  4  4  6  3  2  2  1  4  3  6  1  6  1  2  6
## 67041  1  5  5  6  6  6  5  6  1  1  4  1  6  6  5  3  4  1  1  1  6  4  6  5
## 67042  2  4  4  3  4  4  4  4  3  2  5  5  3  3  3  2  2  3  4  3  6  2  4  5
## 67043  3  5  5  6  5  5  5  5  2  2  1  4  4  5  5  3  4  5  2  5  5  3  5  5
## 67045  1  5  4  5  6  6  6  4  1  2  1  2  4  5  4  1  2  1  2  6  4  1  5  6
## 67046  4  4  5  6  5  6  5  6  1  4  6  6  1  2  1  1  2  1  5  4  5  1  4  6
## 67049  2  5  6  4  5  5  6  5  1  1  4  2  2  5  6  2  4  2  2  2  5  2  3  5
## 67055  1  5  5  5  5  6  5  6  1  2  2  4  2  5  5  1  2  1  1  1  5  1  4  4
## 67056  1  6  6  6  6  6  5  6  2  5  5  1  6  6  6  2  5  4  2  2  6  1  5  6
## 67057  2  3  4  5  4  6  5  5  1  2  2  5  2  5  4  5  5  6 NA  4  5  1  6  6
## 67059  2  6  4  4  4  4  6  3  1  3  6  5  4  4  3  2  4  6  4  6  3  5  2  6
## 67064  2  5  6  5  5 NA  6  5  4  4  2  2  6  5  5  2  2  2  5  4  5  5  5  2
## 67065  1  6  5  2  5  5  2  4  2  2  4  2  3  5  5  1  4  2  1  1  5  3  5  3
## 67066  1  6  6  5  6  5  5  2  2  6  1  1  5  6  5  4  5  4  5  1  5  3  6  6
## 67070  2  4  4  6  3 NA  6  4  2  2  1  1  4  5  2  1  2  2  5  2  2  5  2  3
## 67072  3  3  4  4  5  4  5  5  2  1  5  3  5  5  3  4  4  3  2  4  4  5  4  5
## 67073  6  6  6  6  6  3  6  6  1  1  6  1  6  6  4  6  6  6  6  6  6  1  6  6
## 67075  2  5  5  5  5  5  3  4  2  3  2  2  4  4  5  2  2  1  1  2  5  2  5  2
## 67078  1  6  6  5  3  5  4  5  2  5  2  4  5  1  5  2  2  3  3  3  6  1  6  5
## 67079  1  5  5  6  6  5  5  5  1  2  1  1  5  6  5  1  1  1  1  2  5  1  5  4
## 67080  1  5  6  5  6  1  1  2  6  6  2  4  5  3  5  2  4  5  5  1  6  1  5  4
## 67082  4  5  5  5  5  5  6  5  5  5  1  3  5  6  4  6  4  5  3  6  4  5  5  5
## 67085  1  6  6  5  4  6  5  5  2  1  5  5  4  2  5  4  4  4  2  1  6  1  6  6
## 67087  3  4  4  5  4  5  4  4  2  2  3  2  3  5  5  3  3  4  2  4  3  3  3  4
## 67091  5  1  4  3  4  3  5  3  3  4  6  4  2  2  2  1  1  4  4  1  5  1  2  5
## 67093  4  6  5  5  5  3  4  2  4  4  2  4  5  6  5  2  2  2  1  3  6  4  5  6
## 67095  6  6  5  1  6  6  6  4  3  6  1  5  5 NA  6  4  1  3  1  6  5  6  6  6
## 67096  1  5  5  6  5  3  2  4  3  6  4  2  4  4  4  2  2  2  3  1  4  2  6  6
## 67098  1  6  6  6  6  6  6  6  1  1  2  1  5  6  5  1  1  1  1  1  5  4  1  4
## 67101  4  5  2  6  4  3  4  4  2  2  2  1  3  4  6  4  3  2  2  3  6  1  5  3
## 67104  2  6  5  6  5  3  4  4  4  4  1  2  6  6  5  3  2  2  4  4  6  4  4  6
## 67107  5  2  3  2  4  6  5  4  2  4  6  5  2  3  5  6  6  4  2  1  6  5  4  6
## 67109  2  6  5  6  5  5  5  5  1  2  1  1  5  5  5  1  4  3  2  1  5  1  5  6
## 67115  3  4  4  3  5  5  5  4  3  4  4  5  3  5  4  4  3  4  4  3  5  4  5  4
## 67116  3  4  4  4  4  4  3  3  2  6  1  4  3  5  6  6  6  5  5  1  5  4  5  4
## 67118  4  3  3  2  3  2  4  1  6  6  3  5  3  4  3  1  4  5  4  3  5  6  5  6
## 67119  2  5  4  6  4  1  6  2  1  4 NA  4  5  4  5  4  4  4  2  1  5  1  6  5
## 67121  1  5  6  5  3  3  3  5  2  4  6  4  1  5  2  1  4  2  1  1  5  6  1  4
## 67123  1  4  3  5  3  5  4  4  1  1  5  4  2  5  2  1  2  1  1  2  3  1  5  5
## 67124  1  4  6  4  6  1  3  1  4  5  1  1  5  6  4  1  1  1  1  1  6  1  6  6
## 67126  1  5  5  6  6  6  6  3  1  4  3  1  6  4  5  1  2  1  1  2  4  3  5  3
## 67132  4  6  4  5  5  5  4  3  2  6  5  4  1  4  1  1  2  2  3  2  2  6  2  4
## 67134  4  4  6  2  6  4  2  1  4  6  1  2  3  5  5  6  4  5  3  6  2  6  5  5
## 67135  1  6  6  6  5  4  4  5  2  4  2  2  4  4  5  1  4  1  1  4  6  1  6  6
## 67136  5  5  6  2  5  4  4  5  6  2  4  1  6  5  4  2  2  5  5  1  5  4  4  5
## 67140  2  4  3  4  4  5  5  5  3  4  4  3  3  4  6  1  2  1 NA  1  6  2  5  3
## 67143  2  6  6  6  5  4  5  5  1  4  1  2  5  4  6  5  5  3  4  5  6  1  6  6
## 67144  4  6  5  5  6  5  6  5  3  2  1  2  5  6  5  4  2  3  3  6  6  5  5  4
## 67145  1  6  5  6  4  2  3  4  5  6  2  5  5  3  5  6  6  6  6  2  6  2  6  6
## 67146  4  5  5  4  2  2  2  4  3  1  5  5  2  6  3  6  4  3  4  4  5  1  3  1
## 67148  3  3  4  4  3  3  3  3  2  4  1  4  3  4  4  3  3  3  2  3  4  4  4  4
## 67149  3  3  5  6  5  5  2  5  6  4  2  2  1  6  5  1  1  4  2  1  5  2  5  1
## 67152  4  5  5  5  5  5  6  5  1  1  1  4  5  5  6  1  1  2  2  3  6  4  5  6
## 67154  1  6  6  6  5  2  5  5  5  2  1  1  5  6  3  2  2  4  2  5  5  1  5  5
## 67155  5  2  2  5  4  5  6  1  3  1  2  1  4  6  5  6  6  6  1  4  5  5  6  5
## 67156  1  2  3  5  1  5  6  5  4  3  2  1  1  4  4  4  3  4  5  1  4  2  4  1
## 67157  4  5  4  6  4  4  5  4  3  3  5  4  3  5  2  5  3  3  2  4  4  2  3  4
## 67158  4  3  6  6  6  6  5  5  3  3  3  5  4  6  1  1  3  4  1  3  4  4  5  5
## 67161  4  5  1  5  4  5  6  6  2  1  2  1  4  6  6  6  6  6  5  4  6  3  6  5
## 67162  3  3  4  5  4  2  4  4  4  2  5  3  3  3  3  2  2  2  3  3  2  5  3  3
## 67168  4  5  5  6  4  6  6  4  4  2  1  5  1  5  6  6  6  6  3  1  6  5  5  5
## 67174  3  3  5  5  5  5  4  3  2  2  2  2  4  4  5  2  3  3  2  2  4  2  5  3
## 67179  5  4  1  1  1  6  6  5  1  1  6  1  5  3  6  6  6  4  6  1  6  1  5  6
## 67180 NA  2  2  5  2  5  2  5  4  5  1  1  5  4  6  6  6  5  2  6  6  2  5  5
## 67183  2  5  2  6  3  4  5  3  1  4  1  3  2  5  5  4  4  3  4  2  5  2  4  2
## 67184  6  4  4  1  6  4  2  3  3  4  2  4  3  3  1  3  2  3  6  5  5  4  4  1
## 67185  5  2  2  6  2  5  4  5  2  4  5  6  2  1  3  5  6  6  5  5  5  1  3  4
## 67186  5  5  6  6  4  6  4  1  3  2  1  5  4  5  4  4  5  4  6  4  3  1  4  6
## 67188  1  1  1  2  1  1  1  4  5  5  6  6  1  4  1  6  6  6  6  4  3  6  1  6
## 67189  3  3  2  2  6  6 NA  3  1  1  5  1  1  6  6  3  2  4  2  4  3  1  2  3
## 67190  4  4  5  3  5  5  4  3  4  5  2  1  5  5  4  4  6  6 NA  5  6  6  6  6
## 67191  1  4  5  2  4  3  3  3  5  6  4  5  4  5 NA  3  5  6  4  3  3  2  4  5
## 67197  3  3  5  5  4  5  4  5  4  2  4  5  3  4  4  4  4  5  3  4  4  4  5  4
## 67202  5  2  1  2  2  3  2  5  6  6  1  2  4  6  5  5  5  2  1  2  5  6  5  4
## 67203  5  3  4  6  2  6  6  5  3  3  3  4  4  6  3  4  3  5  3  4  5  5  6  4
## 67206  4  6  5  6  5  6  6 NA  3  4  1  1  2  6  6  6  6  1  1  2  6  4  2  4
## 67213  4  4  4  5  4  4  3  4  4  3  2  4  3  4  4  5  4  3 NA  4  3  4  4  3
## 67215  3  2  3  1  3  4  2  5  4  4  1  4  6  5  5  2  2  2  1  2  5  6  1  2
## 67220  2  5  4  3  3  2  3  4  4  4  5  5  3 NA  3  4  2  4  5  3  4  2  3  4
## 67222  1  5  5  5  4  5  4  6  2  4  2  3  4  4  5  2  4  5  3  4  4  2  4  5
## 67223  1 NA  6  6  6  6  6  6  1  1  4  1  6  6  6  1  4  1  1  1  6  1  6  5
## 67224  2  3  4  3  3  3  5  2  3  5  5  6  2  1  2  2  4  2  5  3  4  3  4  6
## 67225  3  5  5  6  2  6  5  3  1  4  2  5  4  1  5  6  6  5  6  2  6  2  5  6
## 67226  5  5  3  2  5  1  1  4  5  6  6  5  4  3  1  1  1  4  3  4  2  2  5  6
## 67229  1  5  5  2  5  1  1  2  5  6  1  6  4  1  5  6  5  4  5  3  4  3  5  6
## 67230  5  4  5  2  4  4  4  6  3  3  5  3  3  5  5  3  4  2  1  1  5  2  4  4
## 67232  6  6  5  6  6  5  5  4  1  1  3  1  4  6  5  1  1  2  1  2  5  2  4  6
## 67234  4  6  5  6  4  6  5  5  2  6  6  4  4  3  5  1  4  5  3  3  6  2  2  6
## 67237  2  5  5  5  4  5  5  5  2  2  1  4  4  4  5  5  5  2  4  4  4  5  4  5
## 67238  5  3  5  3  3  6  5  2  5  5  6  4  3  4  5  4  5  1  1  2  5  2  5  4
## 67239  4  2  2  4  3  6  6  5  2  4  5  5  2  1  3  1  1  1  5  1  5  2  3  6
## 67240  2  6  4  5  4  4  5  2  2  6  4  5  5  3  1  1  4  3  2  4  4  4  2  6
## 67242  4  2  4  4  4  4  3  3  3  3  2  2  5  4  4  3  3  2  2  1  4  3  3  4
## 67246  2  5  5  5  4  4  4  4  2  2  2  2  5  5  5  4  2  3  4  3  5  4  4  4
## 67247  4  6  5  5  4  4  4  3  4  4  2  1  4  5  4  4  3  3  1  2  5  4  3  3
## 67251  6  5  5  6  5  5  5  6  1  1  5  3  5  6  5  2  6  5  3  2  5  6  4  6
## 67254  2  5  4  6  2  2  6  3  4  5  5  6  3  2  2  3  3  3  1  6  5  2  6  6
## 67255  5  6  6  6  6  6  6  6  1  1  2  1  6  6  6  1  1  2  1  1  6  1  3  1
## 67257  2  5  6  6  5  4  5  4  4  5  2  2  4  6  6  4  4  6  4  5  3  4  5  5
## 67258  2  5  6  4  6  6  5  4  2  5  4  5  4  5  4  1  4  6  4  4  6  2  4  6
## 67259 NA  6  4 NA  4  4 NA  6 NA  1  1  5 NA  6  6 NA  5  6  4 NA  4  5 NA  6
## 67260  1  1  2  2  1  4  2  1  2  2  1  2  1  5  2  2  2  1  2  1  3  1  2  1
## 67262  1  5  5  5  4  4  5  6  1  2  1  1  4  5  2  5  5  4  2  1  5  1  4  1
## 67263  3  3  3  2  2  4  3  4  3  4  2  4  3  4  3  3  4  4  4  3  4  4  3  4
## 67269  1  5  6  6  5  4  3  6  4  1  5  2  3  4  5  5  5  1  4  1  6  1  3  4
## 67270  2  5  2  4  3  5  5  5  2  4  4  4  3  5  5  2  4  1  2  2  3  2  4  3
## 67271  3  3  4  2  5  3  4  4  3  4  4  2  3  6  5  5  4  4  5  1  4  4  4  3
## 67272  4  3  1  3  3  2  3  4  5  2  1  1  2  6  3  1  3  3  1  1  1  3  2  3
## 67274  4  5  6  6  6  3  4  5  6  6  4  5  5  5  5  5  6  5  5  5  6  2  6  6
## 67275  3  3  5  6  5  6  5  5  1  1  1  1  3  4  5  1  1  1  1  6  5  1  4  3
## 67277  1  6  6  5  6  4  4  5  2  2  2  2  5  5  5  1  1  2  1  2  5  1  5  3
## 67278  1  5  6  6  5  4  5  2  4  6  1  1  5  6  6  4  5  1  4  2  5  1  6  4
## 67279  2  5  4  4  3  5  3  5  2  2  5  4  4  4  4  2  3  2  2  2  3  2  3  4
## 67283  1  6  3  2  5  6  5  5  1  4  2  3  4  5  4  1  1  1  1 NA  6  2  2  6
## 67284  1  6  4  5  5  3  2  4  2  4  2  4  4  4  4  4  5  5  4  2  6  2  5  6
## 67286  6  3  2  3  5  5  5  3  1  1  2  5  5  4  5  5  6  6  5  3  6  2  4  2
## 67287  2  1  6  6  6  6  6  4  1  2  1  5  6  6  6  1  1  1  1  1  6  1  6  6
## 67288  6  6  6  6  6  6  6  1  1  1  6  6  6  1  6  1  1  1  1  6  6  5  6  6
## 67289  1  6  5  6  6  5  4  5  2  4  1  2  4  4  5  3  4  4  2  3  5  2  6  5
## 67294  4  5  6  5  5  4  4  4  4  5  1  2  4  6  5  5  3  4  4  2  5  4  4  5
## 67295  2  6  5  5  6  6  6  5  1  1  2  1  6  6  6  2  2  3  2  1  6  1  5  4
## 67298  1  6  6  6  6  5  5  6  3  1  5  2  5  6  5  3  3  4  2  4  5  2  6  5
## 67299  2  6  5  5  5  6  4  4  3  3  2  5  3  5  5  4  5  4  4  6  6  2  5  5
## 67303  5  5  4  5  4  3  4  5  3  3  2  2  3  4  4  2  2  2  1  2  4  5  4  3
## 67307  5  2  3  2  2  2  1  1  6  6  5  6  4  1  2  3  3  2  3  1  5  3  5  6
## 67309  1  6  6  6  6  3  5  5  3  3  1  1  6  6  6  4  5  6  5  6  5  4  5  6
## 67310  3  4  5  6  4  4  4  4  3  4  4  4  3  4  5  4  4  5  5  3  5  3  4  5
## 67312  4  5  5  6  4  3  4  4  4  5  3  4  4  4  4  4  4  5  4  4  5  4  3  5
## 67313  1  6  6  5  2  6  6  2  1  4  4  5  2  4  4  6  6  3  3  6  4  1  5  3
## 67315  3  4  4  6  5  5  5  5  1  1  4  3  4  6  3  2  3  4  3  4  4  3  4  3
## 67316  4  3  4  4  3  4  4  4  2  3  5  2  4  4  3  2  4  3  4  2  4  5  4  2
## 67322  2  6  6  5  6  2  3  4  2  5  1  1  5  5  5  2  4  3  3  1  6  1  4  4
## 67324  4  4  4  3  4  5  6  5  4  4  3  4  3  3  4  2  2  3  3  3  4  3  3  3
## 67325  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  1  3  2  1  6  1  6  6
## 67328  2  1  3  1  3  2  2  4  5  3  4  4  2  2  2  4  3  2  3  3  5  1  4  6
## 67331  2  2  5  5  4  5  5  5  4  5  4  6  5  1  2  3  4  3  6  4  6  1  5  6
## 67332  2  6  5  3  5  5  4  5  3  2  1  1  5  6  6  4  4  3  1  3  6  3  4  5
## 67334  3  6  6  5  6  5  6  6  1  3  1  1  6  6  6  6  4  5  4  2  5  1  6  5
## 67335  2  5  4  6  5  4  5  4  2  2  3  3  4  5  5  3  4  4  3  4  3  3  3  3
## 67336  2  4  3  3 NA  5  5  5  2  5  4  2  3  4  5  4  4  2  2  1 NA  1  5  5
## 67338  1  6  6  5  5  4  5  5  2  4  3  2  4  5  4  1  2  2  4  2  5  4  4  5
## 67339  2  5  5  5  5  6  6  5  1  2  2  2  4  5  5  2  2  3  2  2  5  1  5  5
## 67341  1  6  6  6  5  5  4  5  2  1  1  1  4  6  4  2  2  2  1  1  6  2  5  5
## 67342  2  6  5  5  5  4  4  6  1  1  2  2  4  5  4  1  1  1  1  2  4  2  3  4
## 67344  2  2  1  3  3  3  1  1  6  5  5  6  1  1  1  3  4  2  6  5  3  1  6  6
## 67345  5  1  2  1  2  5  5  1  5  5  6  6  1  1  2  3  3  1  3  2  6  2  4  6
## 67346  2  5  5  5  5  3  6  3  2  6  3  6  4  3  3  1  2  3  3  5  3  2  4  6
## 67347  1  5  5 NA  5  2  4 NA  4  4  1  1  5  5  6  3  4  2  4  1  6  1  6  1
## 67352  3  6  6  3  2  5  6  6  1  4  6  5  5  1  6  5  6  6  6  1  6  1  6  6
## 67355  1  6  6  2  6  6  5  6  1  2  4  1  6  6  5  1  1  1  1  1  6  1  5  6
## 67356  5  4  4  1  6  6  5  6  1  2  6  5  1  5  2  4  5  1  4  1  1  3  3  6
## 67357  4  2  5  5  2  5  2  4  2  5  4  2  1  2  2  4  4  5  6  2  6  1  5  6
## 67360  2  4  3  5  4  6  4  6  2  5  1  2  3  5  5  3  5  5  5  5  6  2  4  6
## 67363  2  5  5  5  6  3  2  4  4  1  1  1  6  6  5  2  4  3  1  3  6  2  6  6
## 67364  1  4  5  5  2  6  6  2  4  4  5  6  4  1  1  4  5  2  5  4  5  2  5  6
## 67365  1  6  6  6  6  6  6  6  1  1  1  1  6  6  6  1  1  1  1  1  6  3  6  6
## 67366  3  5  2  6  5  5  6  4  2  2  6  6  4  2  6  2  1  3  5  1  6  2  2  6
## 67367  1  5  5  6  6  6  6  6  1  2  4  2  5  6  4  2  2  5  2  5  5  2  5  4
## 67368  5  6  4 NA  6  2 NA  6 NA  3  3  1 NA  6  4 NA  4  3  6 NA  6  2 NA  3
## 67370  4  4  6  6  6  5  5  6  5  4  1  3  6  6  2  4  4  4  6  4  6  2 NA  5
## 67371  4  4  6  6  6  5  5  6  5  4  1  3  6  6  2  4  4  4  6  4  6  2  5  5
## 67374  2  4  3  3  2  5  4  3  2  6  5  5  2  2  5  5  5  4  5  6  4  5  3  6
## 67376  1  5  5  5  6  6  6  5  3  3  1  4  5  5  5  3  4 NA  4  3  5  2  5  5
## 67377  2  4  5  4  4  4  4  4  3  4  4  3  4  5  5  2  3  4  4  2  5  3  5  6
## 67378  3  5  5  3  5  4  4  4  3  5  2  5  2  5  4  4 NA  5  4  3  4  5  5  5
## 67379  2  5  5  6  4  5  3  5  3  2  4  3  4  4  5  2  2  3  3  3  4  3  4  5
## 67380  1  6  4  4  6  2  1  4  6  4  2  1  5  5  5  1  1  1  1  2  5  2  5  3
## 67382  3  5  5  4  4  5  4  4  1  3  2  4  4  5  5  4  4  3  3  3  5  1  4  6
## 67388  2  4  5  5  5  5  4  5  2  2  2  2  5  5  1  1  1  1  1  1  5  3  5  2
## 67390  1  5  4  5  1  4  5  6  4  5  6  6  3  5  4  1  1  2  5  2  4  3  4  5
## 67392  6  4  4  6  6  6  5  4  3  4  3  5  4  5  2  3  6  5  4  4  3  3  4  6
## 67393  4  5  5  6  5  3  5  5  2  5  5  6  5  2  2  5  5  5  3  2  6  1  5  6
## 67395  4  4  4  6  4  5  5  4  5  5  2  3  3  4  2  4  5  5  6  6  6  4  5  6
## 67396  2  5  3  3  3  4  4  4  4  5  6  6  1  1  3  3  4 NA  1  2  4  5  1  1
## 67397  4  5  5  6  5  4  5  5  3  1  1  5  4  6  5  5  3  4  2  5  4  3  4  2
## 67399  1  5  5  5  5  3  3  4  4  4  2  6  3  2  2  5  4  2  5  5  3  4  4  4
## 67401  1  5  5  6  4  6  5  5  1  1  3  2  5  5  6  2  4  3  4  2  5  1  5  4
## 67403  3  2  1  2  2  2  2  4  5  5  2  4  4  2  5  3  3  3  3  3  3  1  4  4
## 67406  1  5  6  6  5  5  4  2  5  6  4  4  4  5  5  6  6  6  5  6  4  2  5  5
## 67408  3  4  4  3  4  6  6  6  1  3  5  4  4  2  5  4  5  3  6  2  6  1  5  4
## 67413  1  1  6  1  1  1  1  1  1  6  1  1  6  6  6  3  6  1 NA  1  1  1  1  1
## 67415  3  4  4  5  5  6  6  3  1  1  1  1  5  4  6  3  4  3  2  5  6  1  5  4
## 67417  1  5  5  6  4  1  3  2  5  6  1  4  3  4  4  4  4  4  4  2  6  5  6  6
## 67418  2  3  2  5  4  5  5  5  2  5  5  5  4  2  4  4  5  5  2  4  5  2  4  6
## 67420  1  6  5  2  5  4  4  5  3  5  3  2  6  5  6  2  2  3  4  2  5  3  5  6
## 67421  4  5  6  4  5  6  6  6  2  1  4  3  6  4  3  2  3  2  3  3  6  2  6  6
## 67426  1  5  4  5  4  5  5  5  2  5  4  6  4  5  3  1  2  2  3  2  4  5  4  6
## 67427  2  4  3  4  5  5  1  2  6  4  2  2  5  5  5  5  5  6  6  5  5  6  5  6
## 67429  3  3  2  1  2  5  3  5  3  5  6  5  2  2  3  5  5  5  5  2  2  2  2  6
## 67431  4  4  5  5  4  4  5  5  2  4  5  5  5  3  6  5  5  5  6  6  6  1  5  6
## 67436  2  4  5  5  5  5  4  5  3  4  1  2  4  5  4  2  2  2 NA  2  4  2  3  4
## 67438  6  3  3  3  3  5  4  4  3  2  4  2  3  5  2  3  3  4  5  5  6  2  4  3
## 67439  5  6  5  5  6  5  4  4  3  2  4  3  4  6  5  6  5  5  6  1  5  1  3  4
## 67440  2  3  4  2  5  4  6  3  4  5  3  3  5  6  4  2  2  6  5  4  6  3  5  6
## 67441  2  4  4  6  5  4  3  4  2  3  3  5  2  4  2  2  3  3  4  2  3  2  3  5
## 67442  3  2  5  5  3  6  6  2  3  3  5  1  4  4  6  2  2  2  1  3  6  1  4  5
## 67445  2  4  4  6  4  5  4  5  2  2  3  2  2  4  4  3  2  1  1  1  5  3  5  3
## 67446  1  5  4  2  5  3  3  5  2  2  5  2  2  5  5  2  4  1  2  2  5  2  2  5
## 67447  1  6  5  5  5  5  5  6  3  4  3  4  5  5  4  4  5  5  2  6  5  3  3  5
## 67449  6  5  2  4  5  6  4  2  5  6  4  2  5  4  2  1  1  1  5  1  6  1  5  4
## 67451  1  6  6  2  6  2  4  4  1  2  3  1  4  6  4  3  4  4  4  4  2  3 NA  3
## 67453  3  6  5  6  5  6  5  5  1  4  1  1  6  6  6  4  6  5  5  1  6  1  6  6
## 67454  1  6  6  5  6  5  5  3  2  4  1  5  4  4  2  1  1  1  4  2  6  1  6  6
## 67455  1  6  6  6  6  6  6  6  2  1  4  3  6  6  6  2  6  4  5  5  6  1  6  6
## 67458  3  2  3  3  1  3  3  1  3  4  6  6  1  2  1  1  4  4  6  2  5  2  5  5
## 67460  2  6  6  6  6  3  3  6  3  6  1  4  3  4  6  3  3  1 NA  3  3  5  1  6
## 67462  6  5  5  4  4  5  4  4  3  5  6  4  3  1  4  6  6  1  1  1  1  2  1  5
## 67465  6  5  6  6  6  6  6  6  6  6  6  4  6  4  6  6  6  6  6  6  5  6  5  6
## 67471  1  6  3  1  4  4  4  4  2  5  1  5  2  1  5  3  4  3  4  4  4  2  4  4
## 67473  2  5  5  5  5  4  5  5  2  2  4  2  4  4  5  4  4  2  4  2  5  2  5  4
## 67479  2  5  5  6  3  4  3  3  4  2  1  4  4  5  6  2  3  1  2  2  6  1  6  6
## 67480  6  1  2  2  2  3  6  1  5  6  6  6  1  5  5  2  2  2  3  1  3  5  6  5
## 67483  2  5  5  5  5  5  3  4  2  3  4  3  5  5  5  2  2  4  5  3  4  4  4  4
## 67485  2  2  5  6  6  6  5  5  1  5  5  6  2  5  2  1  1  1  1  1  3  2  4  5
## 67487  2  5  5  4  6  6  5  5  1  1  5  1  1  3  6  4  5  3  2  1  5  2  1  4
## 67488  2  5  3  6  3  5  3  5  3  3  2  6  1  1  6  4  5  4  3  4  4  1 NA  1
## 67489  2  4  4  5  4  4  4  3  3  4  3  3  4  5  5  5  5  4  3  4  4  3  3  5
## 67490  3  5  3  5  4  6  5  5  5  3  4  4  1  5  5  3  4  3  5  6  4  1  4  5
## 67495  2  4 NA  5  5  4  4  2  2  2  4  1  5  5  6  4  4  4  4  2  5  4  4 NA
## 67497  2  5  4  6  5  5  6  5  1  2  2  1  4  3  4  1  4  2  1  1  4  1  5  4
## 67502  3  4  3  4  4  4  4  4  4  3  6  4  2  2  5  2  4  4  5  4  3  1  5  6
## 67503  2  3  4  6  2  2  4  4  3  3  6  6  2  1  1  4  5  6  6  6  5  4  1  5
## 67504  4  4  5  1  4  5  3  3  5  5  3  3  5  4  4  2  6  4  5  2  6  1  4  6
## 67505  2  5  5  5  5  5  4  5  1  2  2  4  2  2  5  5  5  5  3  2  2  5  4  4
## 67506  1  6  5  6  4  6  6  6  1  1  5  4  4  4  6  4  4  5  4  5  5  6  2  5
## 67507  3  4  3  6  4  4  6  4  1  2  4  6  3  6  4  4  4  4  6  6  4  3  4  5
## 67508  2  5  4  4  5  5  4  4  2  2  3  4  3  3  4  2  3  2  2  2  5  2  5  5
## 67509  6  4  5  5  5  6  6  5  2  6  3  3  2  5  5  1  1  3  1  1  6  1  5  5
## 67510  3  4  3  5  5  2  4  4  5  1  1  4  2  5  4  6  1  3  3  4  1  1  4  6
## 67512  1  5  5  6  6  6  5  2  4  1  5  2  4  5  5  1  1  1  1  1  5  1  2  6
## 67516  2  5  4  4  3  3  5  4  4  4  3  6  1  2  3  3  3  5  6  4  3  1  5  5
## 67518  3  5  4  3  4  5  5  5  3  3  2  4  3  5  5  6  5  4  5  6  5  3  2  5
## 67521  2  5  5  5  5  5  6  5  2  2  4  4  4  5  4  2  2  2  2  3  5  3  4  5
## 67522  1  6  6  6  6  6  6  5  1  1  1  1  6  6  6  1  1  1  1  1  6  1  6  5
## 67523  1  6  6  6  6  5  6  6  1  1  5  1  5  6  5  1  1  1  1  3  6  1  6  5
## 67524  5  6  4  1  5  6 NA  5  2  2  3  2  3  2  6  6  6  6  6  1  6  1  5  6
## 67525  1  6  1  6  6  6  6  5  1  3  1  3  5  5  5  1  2  2  4  2  5  6  4  5
## 67526  1  6  4  6  3  5  5  5  2  5  6  6  1  1  1  2  2  5  4  2  5  1  6  6
## 67528  3  5  6  6  6  5  5  4  4  5  2  1  5  5  5  4  5  1  4  2  5  2  5  5
## 67529  1 NA  6 NA  2  5  5  5  2  3  1 NA  6  6  4  3  4  5  4  4  5  1  5  6
## 67530  1  5  6  5  6  5  4  5  2  3  1  2  6  6  4  3  4  5  4  4  5  1  5  6
## 67531  2  5  4  5  4  6  5  5  2  4  6  5  2  3  5  1  1  3  4  1  5  1  4  6
## 67533  2  6  6  6  5  5  6  5  1  2  1  1  6  5  6  4  4  5  2  5  6  2  6  6
## 67534  1  4  3  5  5  5  2  2  4  3  5  5  3  5  4  4  4  4  3  1  6  1  5  5
## 67535  2  6  5  6  6  5  5  5  4  1  2  1  5  5  5  3  4  2  2  1  6  1  5  4
## 67537  2  6  5  4  5  4  4  1  4  1  1  5  4  5  5 NA  1  4  2  4  5  4  5  5
## 67539  3  4  4  3  5  6  6  5  2  1  2  2  4  5  5  4  4  3  2  2  5  4  4  3
## 67540  2  5  3  5  4  5  4  3  4  4  5  2  3  2  3  1  4  5  5  2  4  2  4  5
## 67541  4  4  5  1  2  3  5  3  6  4  4  4  4  3  4  4  4  6  6  4  5  4  5  2
## 67544  5  5  5  6  5  6  6  2  4  5  5  1  5  6  4  5  4  5  3  4  4  5  5  4
## 67547  3  4  3  1  3  5  4  5  3  4  3  5  2  3  1  5  6  5  5  6  6  1  4  5
## 67549  5  5  5  5  3  5  4  2  3  5  3  5  5  6  5  4  5  3  5  2  6  1  5  6
## 67551  6  1  3  3  3  6  6  6  1  1  1  4  5  5  6  1  1  1 NA  1  6  1  6  6
## 67552  2  4  4  3  5  2  3  4  4  3  2  2  4  4  3 NA  3  2  3  3  6  3  5  4
## 67556  2  3  5  2  5  5  5  5  1  1  2  2  6  3  6  3  4  3  3  1  5  1  6  4
## 67559  5  2  2  4  4  5  5  5  2  6  2  2  4  5  4  5  5  6  4  1  5  2  5  5
## 67560  2  3  1  4  2  5  5  3  3  3  3  3  1  2  2  1  2  2  1  1  3  1  3  5
##       O5 gender education age
## 61617  3      1        NA  16
## 61618  3      2        NA  18
## 61620  2      2        NA  17
## 61621  5      2        NA  17
## 61622  3      1        NA  17
## 61623  1      2         3  21
## 61624  1      1        NA  18
## 61629  3      1         2  19
## 61630  1      1         1  19
## 61633  2      2        NA  17
## 61634  3      1         1  21
## 61636  4      1        NA  16
## 61637  2      2        NA  16
## 61639  4      1        NA  16
## 61640  5      1         1  17
## 61643  2      1        NA  17
## 61650  3      2        NA  17
## 61651  4      1        NA  17
## 61653  2      2        NA  16
## 61654  2      2        NA  17
## 61656  4      1        NA  17
## 61659  2      2        NA  17
## 61661  2      1         5  68
## 61664  1      2         2  27
## 61667  2      1         1  18
## 61668  3      2         3  20
## 61669  1      2         5  51
## 61670  3      2        NA  14
## 61672  1      2         3  33
## 61673  1      2         3  18
## 61678  5      2        NA  17
## 61679  2      2         3  41
## 61682  1      1         5  23
## 61683  2      2        NA  17
## 61684  3      1         3  20
## 61685  3      1         3  23
## 61686  3      1         3  20
## 61687  2      1         3  21
## 61688  1      1        NA  30
## 61691  1      2         5  48
## 61692  2      2         3  40
## 61693  5      2         4  27
## 61696  3      1         1  18
## 61698  4      1         4  20
## 61700  1      2         5  24
## 61701  1      1         3  25
## 61702  2      1         2  22
## 61703  2      2         1  18
## 61713  1      2         1  43
## 61715  1      1         3  20
## 61716  2      2         3  24
## 61723  3      2         4  26
## 61724  6      1         4  26
## 61725  4      2         3  25
## 61728  2      1         4  25
## 61730  1      1         5  26
## 61731  3      2         3  21
## 61732  5      1         5  24
## 61740  1      2         2  50
## 61742  2      1         5  29
## 61748  5      1         1  32
## 61749  2      1         1  18
## 61754  3      2         4  32
## 61756  1      2         3  26
## 61757  3      2         5  27
## 61759  1      2         3  19
## 61761  1      1         4  21
## 61762  1      1         3  21
## 61763  2      2         5  36
## 61764  2      2         2  48
## 61771  2      2         3  22
## 61772  3      2         2  23
## 61773  3      1         3  21
## 61775  2      2         3  20
## 61776  2      2         3  23
## 61777  4      2         4  43
## 61778  1      2        NA  16
## 61780  3      2        NA  14
## 61782  4      2         3  54
## 61783  1      1         2  20
## 61784  2      1         4  28
## 61788  1      2         4  38
## 61789  1      1        NA  38
## 61793  2      1         3  27
## 61794  1      2         1  18
## 61797  4      1         3  29
## 61798  4      2         4  50
## 61801  2      2         3  50
## 61808  2      2         3  20
## 61812  3      2         3  19
## 61813  2      2         4  56
## 61816  2      2         4  29
## 61818  5      2         5  29
## 61819  1      2         5  48
## 61821  6      2         1  30
## 61822  4      2         2  21
## 61825  1      1         3  19
## 61826  1      1         5  42
## 61829  4      2         3  18
## 61831  3      2         4  50
## 61834  1      2         3  24
## 61835  2      1         5  25
## 61838  1      1         5  47
## 61839  6      2         1  18
## 61840  3      2         4  37
## 61841  2      2         4  33
## 61847  1      2         5  40
## 61848  2      1        NA  18
## 61851  2      2         3  21
## 61852  4      2         3  27
## 61854  1      2         3  19
## 61856  3      2         4  36
## 61857  2      2         3  19
## 61861  2      2         5  29
## 61862  1      2         5  23
## 61865  5      1         5  23
## 61868  1      1         3  20
## 61873  2      1         4  24
## 61874  2      1         5  24
## 61880  1      1         5  26
## 61886  3      2         3  25
## 61888  4      1         4  24
## 61889  1      1         5  24
## 61890  2      1         5  28
## 61891  1      1         4  22
## 61895  1      1         5  26
## 61896  2      1         5  25
## 61900  2      1         4  23
## 61901  2      1         3  22
## 61907  3      2         3  19
## 61908  3      2         4  25
## 61909  2      1         3  25
## 61911  6      1         5  27
## 61913  3      2         3  20
## 61915  2      2         3  25
## 61918  1      2         3  49
## 61921  2      2         3  26
## 61922  3      2         3  25
## 61923  4      2         3  25
## 61925  2      1        NA  18
## 61926  3      1         3  21
## 61928  5      2         3  22
## 61932  3      2         3  37
## 61935  3      2         3  20
## 61936  2      2         1  22
## 61939  1      2         5  41
## 61944  1      2         5  22
## 61945  2      1         5  24
## 61949  1      2         4  23
## 61952  1      1         4  32
## 61953  2      1         5  43
## 61954  1      2         4  30
## 61957  2      2         2  50
## 61958  2      1         1  18
## 61965  5      2         3  16
## 61967  3      2         5  34
## 61968  2      2         2  18
## 61969  1      2         5  24
## 61971  1      1         2  18
## 61972  5      2         3  22
## 61973  4      2         2  36
## 61974  2      2         3  19
## 61975  2      1         3  20
## 61976  6      1         3  24
## 61978  4      2         3  20
## 61979  6      1         5  34
## 61983  2      1         3  21
## 61986  2      1         3  19
## 61987  1      2         2  18
## 61989  1      2        NA  25
## 61990  5      2         5  27
## 61992  3      1         5  33
## 61993  5      1         3  20
## 61994  1      2         3  19
## 61999  3      2        NA  16
## 62001  4      2         3  18
## 62003  1      2         4  35
## 62004  3      2         3  23
## 62005  4      2         5  27
## 62007  1      1         3  18
## 62009  1      1         2  31
## 62011  3      2        NA  17
## 62013  4      1         1  53
## 62014  2      1         5  29
## 62015  1      1         2  19
## 62022  6      2         1  29
## 62023  1      1         5  41
## 62024  2      2         5  31
## 62025  2      2         3  45
## 62026  1      2         2  47
## 62029  2      1         4  27
## 62031  1      2         2  24
## 62032  3      1         4  20
## 62033  5      1         2  23
## 62034  2      1         5  28
## 62038  4      2        NA  16
## 62039  2      1         1  18
## 62041  3      2        NA  16
## 62042  3      1        NA  17
## 62043  1      2         1  18
## 62044  5      1        NA  16
## 62047  1      2        NA  16
## 62048  3      2         1  18
## 62051  2      1        NA  17
## 62052  3      1        NA  17
## 62054  1      1        NA  16
## 62055  3      2         1  18
## 62056  1      2         5  50
## 62059  3      2         4  25
## 62060  1      1         5  48
## 62063  1      2         4  27
## 62064  2      2         3  22
## 62067  4      1         3  20
## 62070  4      2        NA  17
## 62073  1      2         5  59
## 62075  2      2         1  17
## 62077  1      2         3  32
## 62079  3      1         3  22
## 62082  2      1         3  21
## 62084  2      1         5  29
## 62090  3      1         1  18
## 62092  1      2         3  40
## 62094  5      2         5  48
## 62099  3      2         4  39
## 62101  1      2         4  50
## 62102  1      2         5  26
## 62103  3      2         2  21
## 62105  1      1         4  55
## 62106  2      2         5  37
## 62107  2      2         5  38
## 62111  3      1         3  19
## 62115  3      2        NA  17
## 62118  2      2         3  20
## 62119  2      2         5  34
## 62120  1      2         3  38
## 62121  4      2         3  18
## 62124  2      2         5  32
## 62128  3      1         3  19
## 62130  2      1         3  19
## 62132  3      1         3  21
## 62133  2      2         3  22
## 62136  2      1         3  19
## 62137  1      2         5  41
## 62142  3      1         3  40
## 62144  1      2         5  44
## 62147  5      1         3  25
## 62151  4      2        NA  15
## 62156  5      1         3  24
## 62160  2      2         3  23
## 62161  3      2         1  22
## 62162  3      2         3  19
## 62163  2      2         3  23
## 62164  1      2         3  38
## 62165  1      1         2  26
## 62166  4      2         3  46
## 62168  3      2         2  24
## 62170  2      2         1  18
## 62171  2      1         2  48
## 62173  1      2         3  30
## 62176  4      1         2  22
## 62179  4      1         3  20
## 62180  1      1         5  36
## 62181  6      1         1  18
## 62182  2      1         3  27
## 62183  5      2         2  30
## 62189  3      1         3  18
## 62192  2      1         3  20
## 62197  2      2         3  55
## 62198  3      2         3  17
## 62199  6      1         4  28
## 62201  2      2         3  19
## 62202  3      2         3  19
## 62203  3      2        NA  16
## 62204  2      1         1  31
## 62205  1      2         3  50
## 62206  4      2         3  31
## 62208  2      2         5  27
## 62209  4      1         3  16
## 62212  1      1         3  18
## 62213  3      2         3  20
## 62214  3      1         3  21
## 62215  2      2         5  32
## 62216  4      2         3  30
## 62219  2      2         3  24
## 62220  4      2         1  35
## 62224  2      2         3  19
## 62225  2      2         3  23
## 62226  4      2        NA  16
## 62227  1      1         4  21
## 62228  1      2         3  22
## 62231  4      2         3  20
## 62233  2      1         4  26
## 62237  4      1         3  19
## 62239  3      2         5  25
## 62240  1      2         5  28
## 62242  2      2        NA  17
## 62244  5      2        NA  16
## 62245  3      1        NA  17
## 62246  4      1         1  29
## 62252  3      2         2  19
## 62259  1      2         4  47
## 62260  2      2         4  52
## 62261  3      2         4  22
## 62263  5      1         3  18
## 62264  1      2         3  30
## 62265  1      2        NA  17
## 62266  3      1         3  31
## 62267  5      1         2  56
## 62272  4      2         4  28
## 62276 NA      2         4  33
## 62278 NA      2         3  30
## 62279  4      2         3  23
## 62280  2      2         3  20
## 62281  4      2         2  27
## 62282  1      1         2  25
## 62287  1      2         2  27
## 62288  1      2        NA  56
## 62289  2      2         3  18
## 62290  1      1         1  18
## 62293  1      1         3  21
## 62295  1      1         2  19
## 62296  4      2         2  18
## 62298  1      1         4  29
## 62299  3      1         4  33
## 62300  3      1         3  31
## 62301  1      2         5  33
## 62303  4      2         5  28
## 62305  2      2         3  21
## 62307  1      2         4  45
## 62312  2      2         5  44
## 62313  1      2         3  18
## 62316  2      2         5  27
## 62317  4      2         4  45
## 62325  1      2         2  18
## 62327  4      2         3  24
## 62328  1      2         2  48
## 62330  4      2         3  29
## 62333  1      2         1  51
## 62335  4      2         2  50
## 62336  3      2         2  36
## 62339  4      2        NA  18
## 62342  1      2         4  52
## 62343  4      2         5  38
## 62344  1      2         3  17
## 62345  2      2         5  53
## 62346  2      2         5  35
## 62347  2      2         3  21
## 62348  4      1         3  29
## 62349  1      2         5  36
## 62350  4      2         3  19
## 62351  2      2         3  23
## 62352  3      2         2  39
## 62353  1      2         3  19
## 62354  3      2        NA  17
## 62358  4      2         3  18
## 62359  3      2         3  25
## 62360  4      2        NA  15
## 62362  1      1         3  20
## 62363  3      2        NA  14
## 62366  2      2         3  20
## 62367  2      1         1  25
## 62368  1      2         5  64
## 62369  1      2         2  18
## 62370  2      2         3  20
## 62371  3      2         1  19
## 62375  1      2         5  32
## 62376  3      1         2  49
## 62377  2      1         2  45
## 62380  2      1         1  18
## 62382  2      2         5  28
## 62384  2      2         5  22
## 62387  2      2         4  25
## 62390  1      2         5  34
## 62391  1      2         5  42
## 62394  1      2         3  37
## 62397  1      2         3  42
## 62401  1      2         5  23
## 62408  5      2         4  29
## 62412  3      1         2  18
## 62416  6      2         3  22
## 62419  1      2         3  30
## 62421  3      2         3  38
## 62423  2      2         2  53
## 62426  5      1         3  28
## 62433  4      1         3  18
## 62434  2      2         4  31
## 62435  2      2         1  32
## 62438  2      2         5  40
## 62440  3      2        NA  15
## 62443  2      2         2  23
## 62444  2      2         4  34
## 62447  1      1         5  29
## 62448  5      2         3  51
## 62450  2      2         3  22
## 62453  2      2         3  38
## 62454  2      2         5  26
## 62457  5      2         2  36
## 62462  3      2         3  19
## 62463  3      2         3  33
## 62464  2      2         1  40
## 62467  4      2         5  26
## 62468  3      2        NA  12
## 62469  1      2         3  30
## 62470  3      2         1  59
## 62474  1      2         3  32
## 62476  3      1         2  30
## 62479  2      2         4  32
## 62480  1      2         5  29
## 62481  4      1         3  27
## 62486  5      2         3  48
## 62489  2      2         4  39
## 62491  4      2         3  22
## 62493  1      2         3  26
## 62494  1      2         3  26
## 62496  1      2         2  39
## 62497  5      2         3  32
## 62498  5      2         3  52
## 62499  4      2         3  40
## 62500  3      2         2  40
## 62502  1      2         3  40
## 62505  1      2         3  40
## 62508  4      2         2  24
## 62509  1      2         3  23
## 62512  1      2         3  26
## 62514  1      2         3  26
## 62518  1      2         2  51
## 62520  1      2         1  39
## 62522  3      2         3  20
## 62526  5      2         1  19
## 62527  2      1         5  28
## 62528  1      1         1  35
## 62529  1      1         1  35
## 62530  1      1         1  35
## 62531  1      1         1  35
## 62532  1      1         1  35
## 62533  1      1         1  35
## 62535  2      1         1  35
## 62537  4      2         4  32
## 62538  1      2         3  24
## 62541  1      2         1  23
## 62542  1      1         3  39
## 62543  1      1         4  48
## 62545  2      2         1  26
## 62546  2      1         3  28
## 62547  2      2         1  23
## 62548  2      1         3  24
## 62550  3      2         3  29
## 62551  1      2        NA  19
## 62552  4      1         3  29
## 62553  1      2         3  26
## 62555  3      2        NA  15
## 62556  2      2         3  37
## 62557  1      1         3  30
## 62559  1      2         3  36
## 62561  2      2         3  33
## 62562  4      1         3  23
## 62565  1      2         2  22
## 62567  1      2         3  17
## 62570  1      1         2  28
## 62573  3      2         3  36
## 62574  3      2         3  29
## 62577  2      2         5  59
## 62578  2      2         3  19
## 62582  1      1         3  27
## 62589  2      2         4  41
## 62590  2      2         4  27
## 62594  2      2         2  24
## 62597  1      2         5  60
## 62599  4      2         3  52
## 62604  1      2         3  21
## 62605  3      2         3  20
## 62606  4      2         3  25
## 62610  4      2         3  24
## 62611  4      2         2  25
## 62612  3      2         2  30
## 62613  2      2         3  19
## 62615  3      1         3  17
## 62617  1      2         3  52
## 62618  5      2         3  27
## 62622  1      2         3  55
## 62623  1      2         5  39
## 62625  2      2         3  39
## 62627  3      2         3  39
## 62635  2      1         3  18
## 62638  1      2         3  51
## 62640  5      2         3  25
## 62642  1      2         1  15
## 62643  3      2         2  42
## 62644  1      2         4  24
## 62645  1      2         3  46
## 62646  1      2         3  37
## 62647  3      2         3  24
## 62648  2      1         3  20
## 62650  1      2         4  50
## 62652  4      2         3  46
## 62653  1      1         2  23
## 62654  2      2         3  18
## 62657  2      1         2  21
## 62662  5      2         3  26
## 62664  1      2         3  53
## 62665  1      2         2  26
## 62667  2      1         3  30
## 62668  5      1         2  51
## 62669  3      2         3  34
## 62670  2      2         3  28
## 62673  2      2         2  42
## 62675  2      1         3  21
## 62677  6      2         3  20
## 62679  1      1         1  26
## 62681  1      2         3  18
## 62682  4      2         3  39
## 62683  5      2         3  45
## 62684  2      2         3  20
## 62685  3      1         3  43
## 62686  2      2         3  23
## 62687  4      2         3  25
## 62688  2      2         3  51
## 62690  1      2         3  26
## 62692  1      1         3  28
## 62694  2      2         3  23
## 62698  2      2         3  34
## 62700  2      1         3  23
## 62703  3      2         3  29
## 62706  5      2         3  35
## 62707  4      2         3  40
## 62708  1      2         2  27
## 62710  2      1         4  45
## 62712  1      1         2  60
## 62715  3      2         3  27
## 62716  2      1         3  20
## 62717  2      2         3  21
## 62718  4      2         3  25
## 62719  1      2         2  51
## 62720  5      2         3  27
## 62722  2      1         3  24
## 62726  3      2         1  21
## 62728  1      2         2  55
## 62729  3      1         2  30
## 62731  4      1         3  31
## 62740  2      2         2  22
## 62741  3      2         3  28
## 62744  1      2         3  24
## 62745  3      2         3  31
## 62749  2      2         3  43
## 62750  3      1         3  60
## 62751  5      1         3  36
## 62757  2      2         4  40
## 62758  1      1         3  21
## 62761  1      2         4  21
## 62764  3      2         1  19
## 62765  1      2         3  36
## 62766  4      1         4  42
## 62767  6      1         2  24
## 62768  4      2         3  44
## 62770  4      2         3  30
## 62772  2      2         3  23
## 62776  1      2         2  26
## 62778  1      1         3  32
## 62779  3      1         3  29
## 62780  3      2         3  47
## 62781  2      1         3  44
## 62783  5      1         3  25
## 62785  4      2         3  28
## 62786  2      2         4  32
## 62787  6      2         3  37
## 62788  2      2         3  39
## 62789  2      1         2  40
## 62790  4      2         4  26
## 62792  6      1         3  27
## 62795  6      2         3  41
## 62796  4      2         3  34
## 62797  3      2         3  23
## 62800  2      1         3  31
## 62801  3      2         3  38
## 62803  4      2         3  44
## 62804  1      2         3  31
## 62805  2      1         5  33
## 62809  3      2         3  28
## 62810  2      1         3  46
## 62816  2      2         3  36
## 62817  5      2         3  28
## 62819  6      2         3  28
## 62821  1      2         3  42
## 62822  3      2         3  32
## 62825  2      2         3  19
## 62826  4      2         3  25
## 62827  5      2         5  37
## 62828  3      2         3  29
## 62831  6      2         3  32
## 62832  4      1         3  27
## 62834  2      2         3  27
## 62835  2      1         3  39
## 62837  1      1        NA  45
## 62839  4      2         3  38
## 62840  2      2         1  22
## 62844  2      2         1  23
## 62846  1      2         3  25
## 62847  4      2         3  35
## 62849  4      2         3  33
## 62851  6      2         2  28
## 62853  2      2         3  43
## 62856  3      1         1  30
## 62857  4      2         3  27
## 62858  4      2         3  19
## 62861  1      2         2  23
## 62863  2      2         3  31
## 62864  1      2         1  22
## 62867  1      1         3  40
## 62869  3      2         3  40
## 62870  1      2         3  55
## 62872  1      2         3  55
## 62874  1      2         3  54
## 62876  1      2         1  53
## 62877  1      1         3  20
## 62878  3      1         3  52
## 62879  1      2         3  25
## 62881  1      1         3  46
## 62883  5      1         3  19
## 62887  5      1         3  38
## 62889  2      2         3  27
## 62890  2      2         3  27
## 62891  1      1         3  34
## 62897  1      2         3  21
## 62898  2      2         2  29
## 62899  5      2         3  27
## 62901  4      2         2  41
## 62903  2      2         3  52
## 62908  4      2         3  30
## 62910  2      2         2  50
## 62911  3      2         3  43
## 62916  2      2         5  32
## 62918  3      1         3  19
## 62920  2      2         4  22
## 62922  4      2         3  21
## 62926  2      1         5  50
## 62931  6      2         4  27
## 62933  2      2         3  48
## 62934  2      2        NA  12
## 62936  2      2         3  43
## 62938  2      1         3  37
## 62939  1      2         3  18
## 62941  2      2         3  18
## 62942  2      2         3  24
## 62948  1      2         3  23
## 62949 NA      2         3  20
## 62950  2      2         2  32
## 62951  2      1         4  37
## 62953  2      1         3  19
## 62954  1      2         3  29
## 62957  2      2         3  20
## 62962  1      2         4  26
## 62965  1      2         4  33
## 62968  4      2         5  38
## 62969  3      1         2  26
## 62971  5      2         3  30
## 62974  4      1         3  36
## 62976  1      2         3  41
## 62983  2      2         5  34
## 62984  1      2         3  35
## 62989  2      2         3  40
## 62990  1      2         3  33
## 62991  4      2         3  28
## 62994  2      2         3  29
## 62995  2      2        NA  17
## 62996  2      2         3  50
## 62997  3      1         3  20
## 63004  5      2         3  19
## 63007  4      2         2  25
## 63013  3      2         3  31
## 63017  3      2         4  32
## 63018  2      2         3  32
## 63021  2      2         3  19
## 63023  1      2         3  22
## 63026  3      2         3  23
## 63027  2      2         1  18
## 63030 NA      2         3  19
## 63034 NA      2         3  24
## 63035  2      2         3  30
## 63036  3      2         3  33
## 63037  1      1         2  51
## 63038  1      2         4  44
## 63039  1      2         3  23
## 63040  5      1         3  22
## 63042  2      2         3  26
## 63047  2      2         3  24
## 63048  2      2         3  52
## 63049  2      2         3  43
## 63050  5      1         3  25
## 63051  3      2         3  26
## 63054  2      2         2  26
## 63055  2      2         4  25
## 63059  2      2         2  26
## 63062  4      2         2  41
## 63063  1      2         1  21
## 63069  4      2         3  23
## 63070  2      1         4  34
## 63071  1      2         3  41
## 63073  1      2         3  23
## 63075  4      1         2  24
## 63077  2      2         4  45
## 63081  5      2         3  43
## 63083  3      2        NA  15
## 63084  2      2        NA  15
## 63089  2      1        NA  16
## 63090  2      1        NA  16
## 63092  1      1        NA  15
## 63094  2      1        NA  16
## 63096  2      2         4  27
## 63097  2      2         5  37
## 63099  5      2         2  25
## 63100  3      2        NA  16
## 63102  4      2         3  21
## 63103  5      1        NA  16
## 63104  3      1        NA  16
## 63108  3      1         3  27
## 63109  1      2         3  27
## 63112  2      1         3  30
## 63115  5      1         3  23
## 63116  3      1         3  41
## 63120  2      2         3  26
## 63121  3      2         3  17
## 63122  2      2         3  35
## 63123  1      1         3  18
## 63125  5      1         3  19
## 63127  2      1         2  42
## 63128  2      2         3  19
## 63130  2      2         3  35
## 63131  2      2         3  52
## 63135  4      1         3  19
## 63136  1      2         3  41
## 63139  2      2         4  23
## 63141  1      2         3  42
## 63142  2      1         1  19
## 63146  1      2         3  45
## 63147  2      2         3  44
## 63152  2      1         3  21
## 63154  3      2         1  19
## 63155  2      1         3  18
## 63158  1      1         5  34
## 63161  1      1         5  25
## 63163  1      2         5  53
## 63165  2      2         3  36
## 63171  6      1         1  19
## 63172  3      2         4  31
## 63173  2      1         5  23
## 63176  2      2         3  19
## 63181  2      2         3  26
## 63182  3      2         2  23
## 63183  2      1         3  25
## 63187  3      2        NA  17
## 63192  4      2         1  17
## 63193  5      2         1  17
## 63194  3      1        NA  17
## 63197  2      2         3  16
## 63200  3      1        NA  17
## 63201  3      1        NA  17
## 63203  4      1        NA  17
## 63209  4      2         3  20
## 63215  4      2        NA  17
## 63222  1      1        NA  17
## 63223  2      1        NA  16
## 63225  3      2        NA  17
## 63227  3      2        NA  17
## 63228  2      1        NA  17
## 63233  1      2         3  24
## 63237  2      1         3  18
## 63238  2      1         3  22
## 63239  1      2         3  27
## 63242  3      2         3  32
## 63245  1      1         1  34
## 63246  1      2         4  22
## 63250  3      1         5  21
## 63252  2      2         3  24
## 63253  3      2         3  19
## 63258  1      2         3  30
## 63261  2      2         3  20
## 63264  3      2         2  19
## 63266  3      2         4  23
## 63271  4      1         1  19
## 63277  1      2         3  21
## 63278  3      2        NA  17
## 63280  1      1         3  21
## 63281  2      1         3  25
## 63286  2      2         3  22
## 63287  1      1         3  21
## 63289  1      2        NA  14
## 63292  3      1         3  21
## 63293  2      2         2  19
## 63294  3      2        NA  13
## 63301  3      2         2  31
## 63302  2      2         4  34
## 63307  3      2        NA  15
## 63309  5      2         1  37
## 63313  2      2         5  39
## 63317  2      2        NA  17
## 63320  1      1         1  16
## 63321  1      1         1  16
## 63322  1      1        NA  16
## 63324  6      1        NA  40
## 63326  1      2        NA  17
## 63328  1      2         1  17
## 63330  2      1        NA  17
## 63331  3      1        NA  17
## 63332  1      1         5  74
## 63334  2      2         1  17
## 63335  1      2         3  30
## 63337  1      1         4  48
## 63338  2      2         3  32
## 63339  1      2         4  44
## 63340  4      2         3  40
## 63342  2      2         4  23
## 63346  4      2         3  40
## 63351  2      2         3  39
## 63352  1      1        NA  17
## 63358  4      2         3  25
## 63361  2      2         1  24
## 63364  3      1        NA  14
## 63369  3      2         3  26
## 63370  1      1         4  34
## 63371  2      2         3  20
## 63372  1      2         3  63
## 63375  3      2         1  18
## 63376  1      2         5  28
## 63378  4      2         2  48
## 63379  2      2         3  39
## 63382  2      1         4  35
## 63383  4      2         2  46
## 63386  1      1         3  20
## 63389  4      2         3  23
## 63395  2      2         3  39
## 63399  3      2         2  42
## 63400  4      1         3  26
## 63402  2      2         3  19
## 63404  2      1         1  38
## 63406  2      2         3  22
## 63408  3      2         3  23
## 63412  3      2         3  24
## 63413  1      2         4  25
## 63414  6      2         3  21
## 63420  3      2         4  39
## 63421  2      1         5  31
## 63427  4      1         1  18
## 63428  1      1         3  20
## 63430  1      1         3  20
## 63431  4      1         2  23
## 63432  3      1         4  24
## 63435  2      2        NA  57
## 63437  2      1         3  20
## 63438  3      1         3  22
## 63439  3      2         3  21
## 63441  4      2         4  23
## 63442  3      2         3  22
## 63444  5      2         3  20
## 63445  2      2         3  31
## 63446  2      1         2  48
## 63448  4      2         5  29
## 63450  2      2         3  23
## 63452  1      2         1  34
## 63454  2      1         3  21
## 63455  5      2         3  27
## 63458  5      2         4  28
## 63459  1      1         3  19
## 63463  3      2         1  16
## 63464  3      1         4  41
## 63465  1      2         2  34
## 63466  1      1         4  32
## 63467  1      1         1  31
## 63468  1      2         3  22
## 63470  5      2         3  31
## 63472  1      2        NA  33
## 63473  4      1         2  35
## 63476  3      2         2  48
## 63479  2      1         5  34
## 63480  1      2         5  31
## 63481  3      1         4  32
## 63485  6      2         3  20
## 63486  1      2         3  19
## 63488  3      2         5  50
## 63491  6      2         3  35
## 63493  4      2         2  23
## 63494  2      1         1  18
## 63496  2      2         1  21
## 63498  2      2         3  20
## 63499  4      1         5  54
## 63501  3      2         3  51
## 63502  1      2         2  20
## 63504  1      2         1  38
## 63505  4      2         4  53
## 63509  2      2        NA  17
## 63510  3      2         1  33
## 63512  6      2         3  17
## 63513  2      2        NA  15
## 63516  1      2         2  38
## 63518  1      2        NA  13
## 63521  2      2         5  34
## 63525  1      1        NA  14
## 63528  3      2         1  20
## 63530  1      2         4  27
## 63531  2      2         2  42
## 63533  2      2         1  18
## 63534  2      2         3  20
## 63536  1      2         5  56
## 63538  5      1         3  20
## 63547  2      1        NA  37
## 63549  4      2        NA  15
## 63551  2      2         1  20
## 63554  3      2         3  19
## 63555  3      1         3  20
## 63556  3      2         3  19
## 63557  1      1         3  20
## 63558  3      2         1  43
## 63559  1      2         5  43
## 63560  1      2         4  26
## 63562  4      2        NA  18
## 63567  1      1         4  24
## 63575  2      2         3  20
## 63578  1      2         2  23
## 63579  5      2         3  25
## 63580  5      2         4  25
## 63581  1      1         5  37
## 63582  2      1         5  51
## 63583  1      2         3  36
## 63584  4      1         3  21
## 63586  1      1         5  56
## 63587  3      1         3  19
## 63588  2      2         5  41
## 63589  3      1         3  20
## 63590  1      1         3  22
## 63591  3      2         3  38
## 63595  1      1         5  52
## 63596  3      2         3  37
## 63597  2      2         2  27
## 63602  4      2         3  19
## 63608  5      2         2  45
## 63609  2      2         1  28
## 63613  1      2         3  31
## 63616  2      2         1  19
## 63617  6      2         5  31
## 63618  4      2         1  28
## 63619  4      1         3  21
## 63621  5      2         2  19
## 63623  3      2         3  27
## 63625  1      1         3  21
## 63631  2      1         3  23
## 63636  4      2         4  29
## 63637  4      1         3  24
## 63638  4      2        NA  16
## 63642  2      1         3  22
## 63644  3      2         4  41
## 63648  2      1         3  26
## 63649  3      1         5  47
## 63655  5      2         3  50
## 63657  3      2         5  29
## 63658  2      1         3  20
## 63659  2      2         5  55
## 63661  3      2         3  22
## 63668  1      2         3  35
## 63669  5      2         3  20
## 63670  2      1         2  49
## 63672  2      2         5  39
## 63675  3      2         3  23
## 63676  2      2         3  25
## 63677  1      1         5  25
## 63681  2      2        NA  36
## 63682  2      1         4  38
## 63683  1      1         1  17
## 63687  3      1        NA  17
## 63690  3      2         3  19
## 63692  3      2         4  56
## 63693  4      2         4  28
## 63696  3      2         3  17
## 63697  6      2         3  26
## 63699  1      2         3  46
## 63700  4      2         3  21
## 63701  2      2         3  46
## 63704  2      2         2  39
## 63705  5      2         3  19
## 63706  2      2         3  25
## 63707  2      1         5  22
## 63709  3      2        NA  17
## 63711  3      2         3  27
## 63712  1      2         4  20
## 63713  1      1         5  21
## 63721  4      2         3  21
## 63723  1      2         4  55
## 63724  4      2         3  24
## 63726  2      1         4  25
## 63727  4      1         5  39
## 63728  3      2         3  39
## 63729  3      2         3  21
## 63732  2      2         5  37
## 63734  1      1         2  22
## 63735  2      2         4  24
## 63738  3      2         3  21
## 63739  1      1         3  20
## 63742  3      1         3  19
## 63743  3      1         3  21
## 63744  2      1         5  30
## 63745  2      2         1  18
## 63746  1      2         4  53
## 63748  3      1         3  27
## 63750  3      2         4  48
## 63752  5      2         4  30
## 63760  4      2         3  25
## 63761  1      2         4  35
## 63762  1      2        NA  17
## 63763  6      2         3  41
## 63766  2      2         3  41
## 63767  1      2         3  37
## 63768  4      2         3  60
## 63770  1      2         3  23
## 63773  1      1         3  53
## 63775  2      2         2  19
## 63776  5      2         3  35
## 63778  1      1         2  19
## 63788  1      1         1  24
## 63789  4      2         3  21
## 63791  2      2         3  29
## 63792  3      2         4  25
## 63793  3      2         4  25
## 63794  3      2         3  18
## 63796  3      2         5  37
## 63798  1      2         3  20
## 63799  3      2         3  21
## 63801  5      2         1  34
## 63803  2      2         2  38
## 63807  4      1         4  30
## 63810  3      1         1  16
## 63811  5      2         3  23
## 63812  1      2         3  22
## 63815  1      1         3  37
## 63816  4      1         4  30
## 63817  1      2         3  21
## 63818  3      2         3  32
## 63820  1      2        NA  14
## 63822  1      2         4  55
## 63823  4      1         4  26
## 63824  1      2         5  22
## 63825  2      1         3  21
## 63826  3      2         4  28
## 63827  2      2         5  41
## 63828  3      1        NA  17
## 63829  3      2         5  52
## 63834  1      2         1  18
## 63835  1      1         5  56
## 63837  3      2         5  55
## 63838  4      2         4  43
## 63839  5      1         3  22
## 63846  2      2         4  25
## 63847  2      2         3  27
## 63849  1      2         2  48
## 63851  2      2         5  31
## 63852  2      2         3  24
## 63853  3      1         3  21
## 63854  3      1         3  24
## 63855  2      2         3  21
## 63856  2      2         3  27
## 63862  6      1         1  18
## 63863  2      1         3  24
## 63866  3      1         5  32
## 63868  1      2         1  19
## 63871  5      2         5  52
## 63873  2      1         1  18
## 63875  2      1         3  30
## 63877  2      1         1  18
## 63879  1      2         4  22
## 63880  1      1         4  46
## 63881  2      1        NA  16
## 63882  1      1         4  28
## 63883  3      2         3  19
## 63884  1      1         4  38
## 63885  3      2         4  24
## 63887  1      2         4  22
## 63888  4      2         1  16
## 63890  2      2         4  24
## 63897  3      1         3  23
## 63898  1      1         4  23
## 63899  2      2         5  22
## 63900  2      1         5  24
## 63902  2      2         3  26
## 63907  1      2         3  22
## 63909  2      1         1  35
## 63911  1      2         3  43
## 63912  4      2        NA  17
## 63913  1      2         5  37
## 63918  2      2         3  21
## 63924  4      2         3  21
## 63925  2      2         5  25
## 63930  4      1         3  27
## 63931  1      1         4  22
## 63932  3      2         3  19
## 63934  1      2         3  40
## 63937  1      1         1  21
## 63939  2      1         1  17
## 63942  2      1        NA  21
## 63946  3      1        NA  17
## 63947  1      2         2  19
## 63948  1      2         3  22
## 63950  2      2         3  18
## 63952  1      1         2  62
## 63955  4      2         4  22
## 63956  1      2         3  31
## 63957  4      1         1  22
## 63958  3      1         4  23
## 63959  2      2         3  22
## 63961  1      2        NA  31
## 63962  1      1         2  50
## 63963  4      1         1  20
## 63966  1      2         3  28
## 63967  1      1         4  35
## 63971  2      2         3  20
## 63977  1      2         4  36
## 63978  5      2        NA  27
## 63979  1      1         4  28
## 63980  5      2         2  40
## 63982  4      2         3  20
## 63983  3      1         3  23
## 63984  1      2         3  18
## 63985  5      2         2  23
## 63987  1      2         5  27
## 63990  1      2         3  22
## 63991 NA      2         3  17
## 63993  1      1         2  32
## 63997  1      1         3  25
## 63999  3      2         5  28
## 64000  2      2         4  25
## 64001  1      2         2  40
## 64003  1      2         3  28
## 64005  2      2         2  33
## 64006  5      2         4  39
## 64010  3      1         3  20
## 64012  5      2        NA  46
## 64014  2      2         5  28
## 64016  1      2         3  21
## 64017  1      1         3  36
## 64018  1      2         5  50
## 64020  5      2         3  40
## 64021  4      2         3  46
## 64024  1      2         3  11
## 64025  2      2         3  38
## 64028  2      2         3  22
## 64029  6      1         1  16
## 64030  2      2        NA  15
## 64031  3      1         2  19
## 64032  3      2         1  20
## 64033  2      2         5  29
## 64036  3      2         3  25
## 64044  4      1         3  25
## 64046  2      1         3  25
## 64047  1      2         3  21
## 64049  1      2         3  19
## 64050  2      2         3  40
## 64051  2      1         3  19
## 64053  4      2         4  38
## 64056  1      2         3  22
## 64057  4      2         4  43
## 64065  2      2         4  36
## 64066  2      2         2  86
## 64069  3      2         4  24
## 64072  1      2         1  17
## 64074  3      2         4  33
## 64075  1      2         5  26
## 64076  3      2         1  24
## 64078  2      2         4  21
## 64079  5      2         1  18
## 64086  1      2         4  50
## 64087  1      1         3  20
## 64089  2      2         4  59
## 64091  2      2         3  19
## 64092  2      2         3  20
## 64094  3      1         3  19
## 64097  1      2         3  19
## 64099  2      1         2  20
## 64100  3      2         5  24
## 64101  3      1         3  18
## 64102  5      2        NA  15
## 64103  2      2         2  44
## 64108  2      2         3  32
## 64111  2      1         5  27
## 64113  1      2         5  59
## 64116  3      2         2  20
## 64119  1      2         2  54
## 64120  1      2         5  25
## 64122  6      2         2  43
## 64125  2      1         2  20
## 64128  2      1         3  20
## 64129  1      2         3  28
## 64132  4      1         4  38
## 64134  3      2         4  23
## 64136  4      2         3  26
## 64137  2      1         4  31
## 64138  2      2         2  53
## 64141  3      2         5  45
## 64142  2      2         4  20
## 64143  2      2         5  52
## 64144  3      1         1  19
## 64147  2      2         1  31
## 64148  3      2         3  18
## 64150  4      2         3  23
## 64151  4      2         3  18
## 64152  2      2         4  29
## 64154  1      1         5  46
## 64155  2      1         5  58
## 64156  1      2         5  38
## 64158  3      2         5  27
## 64163  1      2         5  41
## 64168  2      2         1  58
## 64169  2      1         4  34
## 64178  2      2         3  20
## 64179  1      2         5  33
## 64180  4      1         3  19
## 64185  2      2         3  18
## 64192  2      2         3  20
## 64193  2      2         3  27
## 64195  3      2         3  20
## 64200  3      2         3  31
## 64202  2      1         5  32
## 64204  1      2         5  32
## 64206  2      1         2  45
## 64212  3      2        NA  17
## 64216  2      1         5  39
## 64217  2      1         1  35
## 64222  2      2         5  26
## 64226  4      1         5  29
## 64228  1      2         3  28
## 64231  4      2         3  26
## 64235  2      2         3  26
## 64236  4      2        NA  12
## 64240  1      2         2  21
## 64241  2      1         5  30
## 64242  2      1         2  43
## 64243  4      1         2  38
## 64244  2      2         3  19
## 64248  2      2         2  22
## 64250  1      2         4  34
## 64251  2      1         3  20
## 64254  4      1         3  26
## 64256  1      1         5  45
## 64261  4      1         1  31
## 64263  2      1         5  40
## 64264 NA      2         3  20
## 64266  1      1         2  61
## 64267  2      2         1  18
## 64274  1      2         3  49
## 64275  2      1         4  38
## 64279  5      2        NA  16
## 64280  3      2         3  27
## 64284  3      2         4  38
## 64286  3      2         1  28
## 64289  1      1         3  20
## 64290  4      2         5  43
## 64295  3      2         5  29
## 64296  1      2         1  19
## 64297  2      1         3  39
## 64298  1      1         2  19
## 64299  2      1         3  18
## 64300  4      2         3  18
## 64303 NA      2         5  38
## 64305  4      2         4  34
## 64308  1      2         4  45
## 64310  1      2        NA  17
## 64311  3      1         3  18
## 64312  2      2         3  37
## 64315  2      2         3  24
## 64318  4      1         3  29
## 64320  1      2         5  60
## 64321  1      2         3  25
## 64322  1      2         2  32
## 64323  4      1         1  21
## 64324  6      1         2  26
## 64326  4      2         5  43
## 64327  3      2         4  25
## 64329  2      1         4  25
## 64332  3      2         3  20
## 64333  2      1         3  19
## 64334  2      2         5  28
## 64335  2      1         3  23
## 64338  4      2         4  23
## 64339  2      2         1  17
## 64340  4      2         3  19
## 64341  2      2         1  20
## 64342  4      1         5  60
## 64344  3      1         4  40
## 64345  3      2         3  19
## 64347  1      2         3  18
## 64349  5      2         1  21
## 64352  1      2         3  49
## 64356  2      2         1  24
## 64359  4      1         3  20
## 64363  2      2         3  20
## 64365  2      2         5  28
## 64367  4      2         3  24
## 64368  5      1         5  36
## 64370  3      2         3  20
## 64371  2      1         3  28
## 64372  3      1         4  29
## 64374  3      1         3  22
## 64375  4      1         2  26
## 64377  1      1         2  20
## 64378  5      2        NA  15
## 64379  6      1         3  18
## 64382  2      1         5  38
## 64385  3      2         3  19
## 64389  5      2         3  23
## 64390  1      1         4  32
## 64392  1      2         3  36
## 64393  2      1         3  19
## 64396  1      1         4  37
## 64399  4      1         3  23
## 64400  3      2         3  22
## 64401  3      2         4  33
## 64403  1      2         3  20
## 64413  1      1         2  43
## 64414  2      2         3  21
## 64417  1      2         3  34
## 64418  1      1         3  25
## 64421  1      1         3  30
## 64422  2      2         4  57
## 64424  4      2         3  25
## 64425  3      2         3  24
## 64426  1      1         3  23
## 64427  4      1         2  31
## 64429  1      1         4  50
## 64430  2      1         1  18
## 64431  3      1         3  23
## 64432  3      2         3  27
## 64435  2      1         3  21
## 64436  4      2         3  21
## 64437  3      2        NA  14
## 64438  3      1         1  30
## 64439  3      2         3  37
## 64440  3      2        NA  16
## 64446  4      1         3  19
## 64450  3      2         3  26
## 64453  3      2         3  49
## 64456  4      1         5  25
## 64458  1      2         2  22
## 64459  4      2         3  19
## 64460  1      2         3  19
## 64461  3      2         3  19
## 64462  4      1         1  16
## 64463  3      2         4  49
## 64464  1      2         4  54
## 64466  3      2         5  40
## 64467  3      1         3  20
## 64468  3      1         3  20
## 64469  1      2         5  28
## 64471  1      2         4  35
## 64479  2      1         5  67
## 64481  5      2         3  26
## 64483  1      1         3  23
## 64484  2      1         1  43
## 64487  2      2         3  20
## 64488  2      2         3  31
## 64490  1      2         5  56
## 64491  2      1         3  20
## 64493  1      1         4  28
## 64495  2      1         4  28
## 64496  1      2         3  25
## 64499  1      2         3  25
## 64501  3      2         4  35
## 64507  2      2        NA  15
## 64508  3      1         3  56
## 64510  4      2         3  20
## 64511  5      2         3  39
## 64512  1      1         2  35
## 64513  2      2         3  22
## 64514  4      2         3  26
## 64516  3      2         1  31
## 64518  2      2         4  50
## 64519  1      1        NA  51
## 64520  1      1         4  23
## 64522  5      2         5  40
## 64525  1      2         2  44
## 64528  2      1         3  19
## 64530  4      1         4  43
## 64532  2      2         3  20
## 64537  3      1         3  24
## 64540  1      1         4  55
## 64541  4      2         5  45
## 64543  2      2         5  25
## 64544  1      2         3  21
## 64545  2      2         2  38
## 64546  2      2        NA  17
## 64547  1      1         2  30
## 64548  3      1         4  22
## 64549  5      2         3  27
## 64552  5      2         3  48
## 64555  1      1        NA  55
## 64556  2      2         3  21
## 64557  4      1         2  23
## 64562  2      2         3  20
## 64563  1      2         3  23
## 64564  3      2         4  24
## 64565  6      2         2  29
## 64567  5      2         5  30
## 64568  3      2         3  33
## 64571  3      2         4  24
## 64572  3      2         5  26
## 64573  2      1         4  41
## 64577  4      1         1  19
## 64579  3      2         1  20
## 64581  5      2         5  44
## 64583  1      2         3  27
## 64585  2      2         4  33
## 64586  2      2         5  40
## 64588  3      2        NA  17
## 64591  2      2         3  20
## 64593  3      2         2  25
## 64595  2      1         3  18
## 64600  6      2         3  22
## 64603  2      1         2  27
## 64605  1      2         1  18
## 64606  1      2         4  24
## 64607  2      1         5  35
## 64612  1      1         5  40
## 64614  2      2         4  29
## 64618  2      2         4  24
## 64620  5      2        NA  14
## 64621  5      2         4  54
## 64622  3      2         4  29
## 64623  1      1         3  26
## 64626  2      2         3  26
## 64627  2      2         4  26
## 64630  2      2         3  39
## 64634  4      2         1  18
## 64636  2      2         2  28
## 64638  3      2        NA  16
## 64639  4      1         5  27
## 64642  1      1         3  23
## 64648  1      2         3  32
## 64652  1      1         5  56
## 64656  3      2         3  19
## 64658  3      2         4  26
## 64660  5      2         4  41
## 64661  1      1         5  67
## 64664  2      1         2  36
## 64665  2      2         5  32
## 64668  2      2         4  21
## 64669  4      2         3  18
## 64670  1      2         5  29
## 64671  2      2         3  26
## 64673  5      2         3  19
## 64675  2      1        NA  16
## 64679  2      1         4  32
## 64680  2      2         3  18
## 64682  2      2         3  19
## 64683  1      1         5  63
## 64685  2      2         5  27
## 64686  3      2         3  20
## 64688  2      2         3  54
## 64689  3      1         5  25
## 64693  4      1         4  46
## 64696  2      2         5  51
## 64697  3      2         5  38
## 64698  2      2         3  32
## 64702  1      1         4  24
## 64706  2      2         1  54
## 64707  1      1         4  38
## 64709  4      2         3  29
## 64712  3      1         5  24
## 64714  4      2         5  23
## 64715  4      1         1  25
## 64716  2      1         2  19
## 64718  5      2         3  28
## 64720  3      2         3  20
## 64724  2      2         3  29
## 64725  5      2         3  16
## 64727  4      2         2  23
## 64729  3      2         2  23
## 64730  2      2         3  20
## 64733  2      2         3  19
## 64735  1      2        NA  13
## 64737  3      1         3  20
## 64738  4      2         3  27
## 64739  2      1         3  21
## 64742  2      2         1  16
## 64744  2      2         4  28
## 64747  2      2         3  33
## 64753  3      2         3  27
## 64754  2      2         3  52
## 64758  2      2         5  36
## 64759  2      2         5  36
## 64763  2      2         5  29
## 64768  6      2         3  20
## 64769 NA      2         5  35
## 64770  1      1         4  37
## 64771  2      2         5  42
## 64772  1      1         3  19
## 64773  3      1         4  30
## 64774  1      1         3  18
## 64780  5      2        NA   9
## 64804  3      2         4  27
## 64807  1      1         2  18
## 64810  1      1         2  24
## 64814  1      2         3  20
## 64815  3      2        NA  14
## 64817  4      2         3  21
## 64819  2      2         3  21
## 64822  2      2         5  66
## 64824  2      2         1  22
## 64825  4      1         1  49
## 64826  4      2         3  42
## 64830  1      2         4  19
## 64831  1      2         4  19
## 64835  1      2         5  32
## 64838  1      2         3  29
## 64839  1      2         4  31
## 64842  1      1         2  21
## 64843  1      2         2  27
## 64844  4      2         3  23
## 64845  1      2         3  20
## 64846  4      2         2  57
## 64847  3      2         2  38
## 64849  1      2         2  18
## 64850  4      1         2  23
## 64852  3      2         3  34
## 64857  1      1         4  67
## 64861  4      2         3  30
## 64865  1      2         5  31
## 64866  1      1         4  54
## 64874  5      1         5  32
## 64876  1      2         3  47
## 64877  1      2         3  20
## 64880  4      2         1  20
## 64886  1      2         3  34
## 64887  2      2        NA  14
## 64888  4      2         2  32
## 64890  1      1         3  27
## 64891  1      1         3  19
## 64894 NA      2         3  20
## 64898  3      1         3  21
## 64902  2      2         3  23
## 64907  1      1         4  42
## 64912  2      2         3  27
## 64914  5      1         3  19
## 64915  3      2         3  21
## 64917  3      2         5  47
## 64918  4      2         5  58
## 64919  4      2         3  20
## 64920  1      1         3  29
## 64921  2      2         3  18
## 64926  2      2         1  18
## 64931  4      2         2  21
## 64936  2      2         5  36
## 64937  3      2         3  18
## 64938  2      2         5  53
## 64939  6      1         4  23
## 64940  5      2         3  19
## 64944  3      1         3  22
## 64946  5      2         2  19
## 64949  2      2         3  20
## 64950  2      2         4  24
## 64952  2      2         2  23
## 64953  5      1         3  20
## 64954  1      2         4  33
## 64958  2      1         1  16
## 64960  2      1         1  17
## 64961  1      2         3  21
## 64962  1      2         5  31
## 64963  2      2         2  57
## 64967  2      2         3  20
## 64968  2      2         2  19
## 64969  2      2         2  19
## 64970  2      2         2  19
## 64971  2      2         2  19
## 64975  2      2         2  19
## 64978  2      2         2  19
## 64979  2      2         2  19
## 64980  2      2         2  19
## 64981  2      2         2  19
## 64982  2      2         2  19
## 64984  5      2         3  19
## 64987  5      1         5  42
## 64990  6      2         5  46
## 64991  2      2         2  20
## 64992  3      2         3  20
## 64993  4      2         4  20
## 64996  3      2         3  21
## 64997  2      1         2  25
## 65017  2      2         2  19
## 65018  1      2         5  52
## 65020  2      1         3  20
## 65022  4      2         3  19
## 65025  5      1         3  34
## 65026  1      1         3  29
## 65027  2      2         2  36
## 65028  2      1         1  18
## 65033  3      1         3  25
## 65041  4      2         3  30
## 65042  2      1         5  32
## 65044  4      2         3  32
## 65047  2      2         1  16
## 65049  3      2         3  19
## 65050  3      1         5  29
## 65052  1      2         4  30
## 65054  4      2         3  27
## 65056  1      2         5  41
## 65058  1      2         4  28
## 65059  2      1         5  26
## 65060  3      1         5  35
## 65061  2      2         4  43
## 65070  2      2         5  37
## 65071  5      1         5  23
## 65075  4      1         5  20
## 65078  2      2         2  24
## 65079  1      1         5  21
## 65080  1      2         4  22
## 65081  1      2         3  20
## 65082  3      2         3  27
## 65083  2      2         2  55
## 65084  1      2         3  39
## 65086  3      2         5  31
## 65087  1      2         5  33
## 65088  1      2         4  24
## 65091  3      2         4  22
## 65092  2      1         3  50
## 65096  5      1         4  22
## 65097  6      2         3  52
## 65099  3      2         5  32
## 65100  3      1         5  25
## 65101  4      2         3  23
## 65105  4      2         2  19
## 65108  2      2         5  33
## 65109  3      1         4  46
## 65111  1      2         5  51
## 65114  2      2         4  37
## 65117  4      2         3  19
## 65121  2      1         2  20
## 65122  3      2         4  44
## 65124  1      2         3  31
## 65126  3      2         3  22
## 65129  4      1         3  20
## 65130  6      1         4  22
## 65140  3      2         3  19
## 65142  2      2         3  19
## 65144  2      2         3  40
## 65147  2      2         5  30
## 65150  1      1         5  53
## 65151  6      1         3  20
## 65152 NA      1         4  70
## 65156  1      2         4  56
## 65157  5      2         2  31
## 65162  3      1         3  20
## 65163  1      2         2  25
## 65164  2      2         3  20
## 65166  2      2         3  31
## 65168 NA      2        NA  13
## 65169  2      2         4  27
## 65170  1      2        NA  13
## 65172  4      2         3  31
## 65173  3      2         3  21
## 65174  1      2         3  20
## 65175  2      2         3  18
## 65179  4      1         3  18
## 65180  1      2         2  24
## 65185  4      2         3  45
## 65186  1      1         1  40
## 65188  2      1         5  28
## 65190  1      1         2  24
## 65191  1      1         1  25
## 65193  4      2         2  20
## 65195  3      1         1  15
## 65196  3      2         3  19
## 65197  1      2         5  39
## 65199  3      1         4  39
## 65201  3      2         2  19
## 65202  2      2         2  19
## 65204  4      1         3  23
## 65206  2      1         1  17
## 65207  2      2         5  43
## 65212  3      1         3  20
## 65213  6      1         3  19
## 65215  1      2         1  62
## 65220  2      2         3  20
## 65223  1      2         4  22
## 65224  3      2         2  21
## 65229  1      2         3  23
## 65230  4      2         3  18
## 65232  1      2         3  18
## 65235  3      1         3  19
## 65236  2      1         3  18
## 65237  3      1         5  22
## 65238  1      1         4  24
## 65240  1      2         3  23
## 65241  2      2         3  22
## 65245  1      1         3  18
## 65247  2      2         3  34
## 65249  2      1         5  43
## 65252  2      1         5  33
## 65254  1      2         2  25
## 65255  1      1         1  18
## 65256  2      2        NA  25
## 65257  2      2         5  38
## 65258  1      2         4  22
## 65260  2      2         3  39
## 65262  3      2         3  34
## 65266  3      2         5  54
## 65267  2      1         3  56
## 65268  1      2         3  21
## 65271  5      2         5  30
## 65273  6      1         4  22
## 65274  2      2         5  31
## 65275  3      2         3  17
## 65278  2      2         5  24
## 65279  5      2         5  23
## 65281  3      1         1  21
## 65282  1      1         3  26
## 65285  1      2         4  21
## 65286  1      2         4  50
## 65288  1      2         2  35
## 65289 NA      2         2  72
## 65291  6      2         3  39
## 65295  3      2         2  40
## 65296  5      2         3  41
## 65297  2      2        NA  14
## 65299  2      2         4  40
## 65300  1      1         1  36
## 65301  2      1         1  24
## 65307  2      1         1  19
## 65309  1      2         4  22
## 65311  6      2         4  38
## 65313  2      1        NA  16
## 65314  1      2         3  20
## 65316  4      2         4  20
## 65319  1      2         3  32
## 65320  5      1         4  23
## 65322  1      1         2  20
## 65326  3      2         4  28
## 65327  3      2         3  20
## 65332  3      2         3  20
## 65335  2      2         5  48
## 65342  2      2         4  28
## 65343  2      2         4  28
## 65344  2      2         4  28
## 65346  2      2         4  28
## 65347  3      2         3  29
## 65348  2      1         4  28
## 65349  1      2         3  21
## 65352  2      2         5  26
## 65353  5      1         3  40
## 65356  2      2         2  25
## 65359  1      1         1  23
## 65361  2      1         3  19
## 65362 NA      1         3  39
## 65363  2      2         5  53
## 65370  5      1         4  21
## 65372  1      2         5  31
## 65374  2      2         3  29
## 65377  1      2         4  50
## 65378  1      1         4  54
## 65381  1      2        NA  18
## 65382  1      2         3  21
## 65385  2      1         3  22
## 65386  2      2         5  32
## 65387  1      2         3  46
## 65388  1      2         3  40
## 65391  1      2         5  52
## 65392  5      2         3  50
## 65395  3      2         3  19
## 65401  2      2         5  25
## 65402  2      1         3  19
## 65403  4      1         4  22
## 65404  5      2         4  26
## 65405  4      2         5  29
## 65407  2      2         5  38
## 65408  1      1         5  32
## 65411  3      2         3  23
## 65412  5      1         1  44
## 65413  2      2         3  35
## 65415  5      1         5  21
## 65417  6      2         5  29
## 65419  2      1         4  21
## 65420  1      2         3  33
## 65421  3      2         4  23
## 65424  1      2         2  57
## 65426  2      2         3  21
## 65428  2      2         5  42
## 65430  5      2         4  30
## 65432  2      1         2  39
## 65433  1      2         1  17
## 65434  2      2         5  36
## 65435  1      2         4  18
## 65437  1      1         1  20
## 65439  1      1         5  21
## 65440  1      1         2  20
## 65442  1      2         4  35
## 65445  3      2         3  26
## 65446  5      1         4  26
## 65448  1      2         2  40
## 65450  2      1         4  23
## 65452  3      1         5  25
## 65453  1      2         5  38
## 65455  2      2         5  27
## 65457  2      2        NA  14
## 65458  4      2         1  27
## 65459  2      1         5  32
## 65460  2      1         5  39
## 65462  3      2         3  31
## 65466  5      1         5  31
## 65467  2      2         2  20
## 65470  3      2         5  32
## 65472  2      2         3  42
## 65473  4      2         3  20
## 65474  3      2         3  26
## 65475  1      1         3  23
## 65476  1      1         3  32
## 65477  1      2         5  27
## 65479  2      2         3  19
## 65484  3      2         3  43
## 65487  2      2         3  31
## 65488  5      2         5  25
## 65490  2      2         5  29
## 65491  6      1         3  42
## 65494  2      2         3  39
## 65496  3      2         5  31
## 65499  2      1         5  24
## 65501  1      2         5  45
## 65502  2      1         5  30
## 65503  6      2         4  21
## 65504  5      2        NA  14
## 65506  4      2         3  25
## 65510  3      2         2  48
## 65511  6      2         3  40
## 65512  1      1         4  44
## 65515  2      2         4  36
## 65519  4      2         2  28
## 65522  2      1         3  39
## 65523  4      2         4  35
## 65524  1      1         3  33
## 65526  3      2         3  21
## 65527  1      1         3  19
## 65528  2      1         4  45
## 65529  3      2         4  49
## 65532  2      2         4  23
## 65536  1      2         3  27
## 65538  1      2         5  52
## 65545  4      2         5  40
## 65547  4      1         5  29
## 65548  2      2         3  49
## 65549  3      2         2  30
## 65551  1      2         3  25
## 65552  5      2         5  45
## 65556  1      2         3  27
## 65557  1      2         3  29
## 65563  1      1         5  26
## 65564  5      1         4  32
## 65565  2      1         5  29
## 65566  1      2         3  52
## 65568  1      1         5  54
## 65569  2      2         3  20
## 65571  3      2         1  16
## 65575  5      1         4  36
## 65577  1      2         3  22
## 65578  2      2         2  35
## 65580  4      2         4  24
## 65583  1      1         5  38
## 65584  1      2         3  20
## 65586  2      2         3  33
## 65589  1      2         3  26
## 65591  2      1         3  19
## 65592  2      1         3  21
## 65593  1      2         3  28
## 65595  3      2         2  19
## 65598  3      2         3  36
## 65599  3      1         3  51
## 65600  2      1         4  24
## 65602  4      2         4  34
## 65605  2      2         3  43
## 65606  1      2        NA  20
## 65612  4      2         5  44
## 65613  3      1         3  20
## 65618  3      2         3  18
## 65620  2      2         5  45
## 65628  5      2         2  27
## 65629  2      2         3  34
## 65630  3      2        NA  14
## 65631  2      2         3  30
## 65632  2      2         1  53
## 65633  1      2         5  35
## 65634  1      2         3  25
## 65635  1      1         3  21
## 65636  2      2        NA  15
## 65641  3      2         3  62
## 65643  1      2         3  44
## 65646  2      2         3  49
## 65648  2      2         4  28
## 65649  2      2         3  29
## 65651  3      2         3  21
## 65652  2      2         3  23
## 65653  3      2         5  37
## 65654  3      1         3  38
## 65656 NA      2         5  22
## 65659  2      2         3  26
## 65664  3      1         3  29
## 65668  5      2         2  46
## 65671  2      2         5  50
## 65673  2      2         3  24
## 65674  2      2         3  45
## 65675  1      2         3  32
## 65678  1      1         3  19
## 65679  1      1        NA  15
## 65680  3      1         3  21
## 65682  4      2         3  38
## 65684  3      2         3  20
## 65687  4      2         2  28
## 65694  1      1         2  25
## 65695  1      2         3  47
## 65696  1      2         3  47
## 65698  4      2         3  55
## 65699  4      2         3  55
## 65700  3      2         3  31
## 65702  3      2         1  24
## 65703  1      1         1  51
## 65704  2      2         4  43
## 65705  1      2         3  30
## 65706  1      1         3  38
## 65708  2      1         3  24
## 65709  1      2         4  49
## 65710  5      1        NA  16
## 65711  1      1         5  23
## 65712  5      2         3  44
## 65713  2      2         3  50
## 65714  3      1         4  25
## 65715  3      2         3  40
## 65720  1      2         3  25
## 65724  2      1         4  21
## 65726  3      2         3  23
## 65727  6      1         4  22
## 65728  2      1         3  19
## 65730  3      2         1  32
## 65732  6      2         5  48
## 65733  1      2         5  40
## 65734  1      2         5  28
## 65738  2      2         3  33
## 65740  2      2         3  23
## 65742  3      1         4  22
## 65743  3      2         3  40
## 65744  1      1         3  35
## 65745  4      2        NA  47
## 65746  2      2         1  44
## 65747  3      2         3  20
## 65748  3      1         5  23
## 65752  4      2         3  21
## 65758  2      1         3  52
## 65762  3      2         3  21
## 65763  2      2         3  22
## 65764  3      2         4  24
## 65765  3      1         3  24
## 65767  2      1         3  20
## 65777  2      2         4  24
## 65778  5      2         3  28
## 65779  5      2         3  34
## 65793  2      1         4  22
## 65794  5      2         3  33
## 65798  2      2         3  50
## 65801  3      2         3  20
## 65802  5      2         4  21
## 65803  2      1         5  24
## 65804  2      1         5  23
## 65809  2      2         3  22
## 65811  2      2         4  40
## 65813  2      2         5  28
## 65816  1      2         2  30
## 65818  4      1         1  39
## 65820  2      1         3  36
## 65822  4      1         3  27
## 65825  4      2         3  46
## 65826  2      2         3  57
## 65828  3      1         3  30
## 65831  3      1         3  38
## 65834  4      2         3  41
## 65836  1      2         3  27
## 65838  1      2         3  29
## 65839  1      2         3  51
## 65840  2      2         3  40
## 65841  2      2         2  49
## 65842  2      1         5  25
## 65844  6      2         3  33
## 65847  5      1         3  36
## 65848  3      2         3  41
## 65849  2      2         5  51
## 65851  2      2         3  35
## 65852  2      2         2  25
## 65856  3      2         2  23
## 65857  4      2         3  29
## 65862  3      2         3  32
## 65863  4      1         3  26
## 65864  1      2         3  26
## 65865  4      2         3  27
## 65870  2      2         4  24
## 65874  3      2         3  43
## 65876  3      2         3  41
## 65879  4      2         3  31
## 65880  2      1         3  39
## 65883  3      2         3  40
## 65886  2      2         3  26
## 65888  1      2         3  40
## 65890  2      2         2  26
## 65891  2      2         1  18
## 65892  1      2         3  23
## 65893  1      2         3  27
## 65894  2      2         3  53
## 65895  3      2         3  21
## 65896  2      2         3  30
## 65897  2      1         2  31
## 65899  3      1         3  26
## 65900  3      2         3  21
## 65901  2      1         1  42
## 65902  1      2         3  27
## 65903  1      1         3  27
## 65905  1      2         3  34
## 65909  4      2         3  34
## 65913  2      2         3  22
## 65917  2      1         3  27
## 65918  2      2         2  33
## 65921  3      2         5  23
## 65924  5      2         3  27
## 65925  1      2         3  23
## 65926  2      2         3  35
## 65929  3      2         2  28
## 65930  3      2         2  28
## 65932  3      2         3  29
## 65933  4      2         4  28
## 65936  4      2         4  28
## 65937  1      2         4  53
## 65938  4      2         3  47
## 65940  2      2         3  31
## 65941  3      2         1  22
## 65942  3      1         4  45
## 65946  2      2         3  29
## 65948  3      2         3  48
## 65950  3      1         4  39
## 65951  1      2         3  33
## 65959  1      1         3  28
## 65961  2      2         3  20
## 65962  2      2         2  34
## 65965  2      2         4  25
## 65969  5      2         3  41
## 65971  3      2         5  26
## 65972  3      2         3  36
## 65973  1      2         3  34
## 65974  1      1         3  19
## 65976  2      2         5  31
## 65977  3      2         5  29
## 65981  2      1         3  35
## 65986  2      2         5  20
## 65987  6      1         3  35
## 65988  5      1         5  20
## 65989  1      2         2  23
## 65990  3      2         3  28
## 65992  2      1         5  28
## 65995  3      1         2  47
## 65998  5      2         5  20
## 65999  2      2         3  16
## 66000  2      2         3  25
## 66001  4      2         3  27
## 66002  2      2         3  50
## 66003  2      1         3  38
## 66004  3      2         3  36
## 66006  1      1         4  55
## 66007  4      2         3  19
## 66013  5      2         2  41
## 66014  3      2         1  29
## 66015  4      2         3  26
## 66016  4      2         3  40
## 66017  1      1         3  40
## 66022  2      2         2  52
## 66024  2      1         3  35
## 66032  2      2         3  22
## 66034  1      2         5  33
## 66037  4      1         1  46
## 66039  1      2        NA  16
## 66042  3      2         5  31
## 66045  1      2         3  30
## 66047  3      2         3  37
## 66049  4      2         4  48
## 66050  5      2         3  30
## 66053  2      2         1  17
## 66057  4      2         3  31
## 66058  3      2         3  20
## 66060  2      2         3  32
## 66061  2      2         3  18
## 66062  4      2         3  27
## 66063  1      1         3  23
## 66064  2      2         3  36
## 66065  2      1         5  21
## 66067  3      2         3  19
## 66068  1      2         1  34
## 66070  1      2         5  50
## 66071  2      1         3  20
## 66072  3      2         2  35
## 66077  5      1         3  21
## 66080  2      2        NA  17
## 66081  2      2         3  20
## 66082  2      2         2  42
## 66083  2      2         5  24
## 66086  2      2         5  52
## 66088  1      1         2  58
## 66092  1      2        NA  12
## 66093  1      2         5  32
## 66094  2      2         5  50
## 66095  6      2        NA  17
## 66096  1      2         5  35
## 66097  2      1         3  28
## 66098  2      2         3  25
## 66102  1      1         5  31
## 66106  5      1         3  22
## 66107  2      1         5  33
## 66108  3      2         4  33
## 66109  1      1         3  58
## 66114  2      1         5  26
## 66115  2      2         1  26
## 66116  4      2         3  30
## 66117  2      2         2  26
## 66119  4      2         5  24
## 66120  4      1         3  51
## 66121  3      2         3  18
## 66122  2      2         4  34
## 66125  2      2         3  20
## 66127  3      2         5  30
## 66135  2      1         1  21
## 66136  2      1         1  21
## 66138  4      1         5  23
## 66139  5      1         5  23
## 66141  4      2         3  21
## 66144  3      2         3  20
## 66150  2      2         2  23
## 66151  1      1         5  37
## 66153  2      2         3  31
## 66156  4      2         3  28
## 66157  2      2         3  22
## 66158  1      2         3  18
## 66161  2      2         2  53
## 66163  5      2         3  21
## 66164  2      2         3  25
## 66169  1      2         3  36
## 66170  1      2         3  25
## 66171  2      2         1  18
## 66172  1      1         4  38
## 66173  1      2        NA  61
## 66176  2      1         2  48
## 66181  2      2         3  20
## 66187  4      1         5  29
## 66188  4      2         3  19
## 66190  3      2         3  20
## 66191  1      2         3  21
## 66195  2      2         3  19
## 66198  4      1         3  31
## 66199  3      1         5  26
## 66201  4      1         3  34
## 66204  1      2         3  19
## 66205  5      2         3  19
## 66210  4      2         3  20
## 66212  1      1         2  34
## 66215  2      2         3  20
## 66216  2      2         2  28
## 66218  4      1         2  27
## 66219  1      1         5  36
## 66224  1      2         1  19
## 66225  4      1         4  26
## 66227  1      2         2  42
## 66231  4      1         5  32
## 66233  3      2         3  31
## 66234  2      1         3  20
## 66237  4      1         3  19
## 66244  2      2         3  19
## 66245  3      1         4  24
## 66246  3      2         3  19
## 66247  4      2         3  22
## 66251  1      2         5  40
## 66253  3      2         3  24
## 66255  3      2         3  20
## 66256  2      2         4  31
## 66257  2      2         3  18
## 66259  1      2         3  26
## 66264  2      2         3  25
## 66265  2      2         3  19
## 66266  2      2         3  20
## 66271  1      2         3  20
## 66272  2      2         3  20
## 66273  2      2         3  34
## 66274  2      2         1  16
## 66277  1      2         3  20
## 66278  1      2         4  24
## 66279  2      2         3  20
## 66281  2      2         3  19
## 66283  2      1         3  20
## 66286  2      2         3  27
## 66288  2      2         3  21
## 66289  5      1         5  28
## 66291  1      2         4  43
## 66294  2      1         3  19
## 66295  2      2         4  44
## 66297  2      1        NA  14
## 66299  2      2         3  18
## 66304  2      2         4  56
## 66306  4      2         2  20
## 66307  3      2         3  19
## 66309  1      1         5  51
## 66311  2      2         3  25
## 66312  2      2         3  20
## 66314  3      2         3  19
## 66317  3      2        NA  17
## 66318  5      2         3  20
## 66323  3      2         4  24
## 66324  1      2         3  20
## 66325  1      1         5  58
## 66326  2      2         3  34
## 66329  3      2         3  20
## 66331  2      1         3  28
## 66337  1      2         5  25
## 66341  3      2         3  30
## 66344  1      2         3  49
## 66346  1      2         5  26
## 66348  2      2         3  26
## 66349  6      2         3  48
## 66357  1      1        NA  17
## 66360  2      2         3  22
## 66364  1      2         5  45
## 66368  2      2         3  17
## 66370  2      2         3  17
## 66371  2      2         3  17
## 66372  2      2         3  17
## 66373  1      1         2  22
## 66376  2      1         2  30
## 66381  3      1         3  19
## 66382  1      2         4  34
## 66389  3      1         2  52
## 66391  2      2         3  19
## 66392  1      2         3  31
## 66396  2      1         3  21
## 66399  2      1         3  22
## 66402  1      2         3  21
## 66403  2      2         3  19
## 66404  1      2         5  30
## 66405 NA      2         4  32
## 66406  2      2         3  25
## 66408  4      2         3  18
## 66409  2      2         5  33
## 66410  1      1         4  30
## 66413  2      2         4  47
## 66415  2      2         4  27
## 66419  4      2         3  39
## 66421  2      2         3  21
## 66425  4      2         3  20
## 66429  3      2         3  20
## 66431  1      2         4  31
## 66434  3      1         3  18
## 66437  2      2         3  29
## 66438  3      2        NA  16
## 66439  2      2         2  20
## 66440  1      2         3  21
## 66441  1      2         3  20
## 66444  2      2         4  33
## 66445  3      2         3  19
## 66447  3      2         3  20
## 66450  2      2         5  51
## 66451  3      2         3  30
## 66459  2      1         3  20
## 66463  1      1         1  22
## 66464  3      1         1  18
## 66469  1      1         2  34
## 66472  5      1         1  23
## 66474  3      2         3  23
## 66475  3      1         2  29
## 66476  1      2         3  21
## 66483  4      2         4  24
## 66484  2      2         3  50
## 66485  3      2         3  24
## 66486  1      2         3  42
## 66487  4      2         1  25
## 66488  1      2         2  26
## 66491  4      2         3  19
## 66492  2      2         3  39
## 66493  3      2         1  18
## 66495  1      2         5  42
## 66496  2      2         5  40
## 66497  3      2         1  20
## 66498  4      2         3  57
## 66499  1      1         3  19
## 66500  1      2         3  26
## 66501  2      2         3  22
## 66503  4      2         3  19
## 66504  5      2         2  29
## 66506  2      1         3  21
## 66507  4      1         3  18
## 66509  1      2         3  63
## 66511  1      2         4  25
## 66512  3      2         4  25
## 66513  3      1         3  23
## 66514  2      2        NA  17
## 66517  1      2         4  48
## 66520  1      1         3  20
## 66522  3      2         3  19
## 66525  4      2         3  37
## 66526  2      2         3  20
## 66528  4      1         3  20
## 66529  1      2         3  33
## 66531  3      2         3  20
## 66532  3      1         3  18
## 66533  1      2         1  18
## 66534  4      2         3  20
## 66538  2      2         4  36
## 66540  6      2         3  23
## 66545  3      1         3  25
## 66546 NA      1        NA  17
## 66549  1      2         3  48
## 66550  3      2         1  44
## 66551  3      2         1  46
## 66552  3      1         3  19
## 66553  4      2         3  23
## 66554  1      1         3  23
## 66560  4      1         2  20
## 66562  1      1         4  56
## 66563  2      2         5  28
## 66564  4      2         1  17
## 66566  1      1         4  22
## 66568  4      2         5  25
## 66569  1      2         4  44
## 66570  3      1         3  36
## 66572  1      1         4  36
## 66574  4      1         3  26
## 66575  1      2         3  27
## 66576  2      1         4  27
## 66582  1      2         3  24
## 66583  2      2         5  33
## 66585  5      2         3  19
## 66588  2      2         3  45
## 66589  3      1         3  23
## 66591  2      2         3  22
## 66596  2      1         4  35
## 66598  3      2         3  20
## 66601  3      1         3  42
## 66604  2      2         4  34
## 66605  1      2         1  24
## 66606  1      1         3  29
## 66607  3      2         3  21
## 66609  2      2         5  27
## 66610  2      2         2  22
## 66612  1      2         4  28
## 66615  3      1         5  41
## 66617  1      2         5  48
## 66619  1      1         3  31
## 66620  2      1         4  52
## 66621  1      2         1  41
## 66622  2      2         4  22
## 66623  4      1         4  48
## 66630  2      2         4  30
## 66635  5      1         5  39
## 66637  3      1         3  37
## 66638  2      2        NA  16
## 66642  5      2         2  17
## 66645  2      2         4  37
## 66646  1      2         5  61
## 66647  6      2         1  14
## 66648  1      1         3  20
## 66649  1      1         4  32
## 66651  4      2         4  22
## 66653  4      1         3  20
## 66657  2      2         5  33
## 66660  4      2         3  23
## 66662  1      1         3  21
## 66663  4      1         3  43
## 66664  5      2         1  47
## 66665  2      2         3  39
## 66666  2      2         3  26
## 66668  4      1         3  23
## 66669  2      2         4  23
## 66671  3      2         5  21
## 66674  1      2         5  47
## 66676  3      2         3  18
## 66679  1      1         2  20
## 66680  2      2         3  20
## 66681  2      2         3  44
## 66682  2      2         3  20
## 66683  5      2         3  29
## 66684  3      2         3  20
## 66685  2      2         5  54
## 66689  4      2         3  34
## 66690  2      1         3  28
## 66692  6      2         2  17
## 66694  1      2         1  20
## 66700  1      2        NA  17
## 66701  5      2         4  24
## 66703  2      1         3  20
## 66704  4      2         1  20
## 66708  2      2         3  19
## 66711  3      2         4  34
## 66712  1      2         5  44
## 66713  4      2         5  32
## 66716  6      2         5  38
## 66717  1      1         5  26
## 66718  2      2         5  37
## 66722  3      2         3  30
## 66723  3      2         2  39
## 66724  1      2         5  25
## 66727  1      2         3  19
## 66728  2      2        NA  16
## 66729  1      2         4  29
## 66730  1      2         3  20
## 66731  2      1         5  23
## 66733  2      2         3  19
## 66734  2      2         4  39
## 66737  1      1         2  36
## 66739  1      2         4  46
## 66741  3      1         3  20
## 66743  2      1         3  21
## 66744  1      2         3  20
## 66745  1      2         3  18
## 66748  1      2         5  47
## 66749  1      2         3  19
## 66751  3      2         3  38
## 66755  4      2         3  28
## 66756  4      2         2  23
## 66757  2      2         3  20
## 66760  4      2         5  35
## 66764  2      2         4  43
## 66766  6      1         3  20
## 66768  4      2         5  35
## 66769  2      1         4  21
## 66770  3      1        NA  30
## 66771  4      2         3  30
## 66772  1      1         3  34
## 66775  2      2         2  47
## 66778  2      1         5  58
## 66779  2      1         3  29
## 66785  1      2         3  47
## 66788  2      2         3  20
## 66790  2      2         1  21
## 66792  2      1         1  20
## 66793  1      1         3  40
## 66797  2      2        NA  17
## 66800  2      1         3  23
## 66801  5      2         5  32
## 66804  2      2         1  18
## 66806  1      1         3  22
## 66807  1      2         3  25
## 66810  5      1         5  26
## 66812  5      2         3  29
## 66813  3      2         3  24
## 66814  3      2         3  46
## 66817  3      2         5  56
## 66819  1      2         2  39
## 66820  1      1         5  39
## 66824  3      2         1  42
## 66826  2      1         5  32
## 66830  2      2         4  42
## 66831  3      2         3  19
## 66832  5      2         5  62
## 66833  5      2         4  36
## 66838  1      1         1  18
## 66839  2      2         5  31
## 66840  4      1         3  24
## 66842  2      2         1  20
## 66843  5      1         4  30
## 66845  2      2         5  23
## 66847  2      2         2  23
## 66848  1      2         3  18
## 66850  2      2         5  27
## 66853  3      2         4  24
## 66855  2      2         3  19
## 66856  1      2         3  39
## 66857  3      1         4  51
## 66858  2      2        NA  16
## 66860  5      1        NA  16
## 66863  4      2         3  19
## 66864  5      1         1  17
## 66867  2      2         5  28
## 66868  1      2         4  36
## 66869  2      2         4  31
## 66872  4      1         3  36
## 66873  1      1         5  31
## 66879  3      2         4  19
## 66886  2      1         4  35
## 66887  6      1         3  19
## 66890  1      2         1  17
## 66892  2      2         3  19
## 66896  2      2        NA  15
## 66897  2      2         1  18
## 66898  4      2         1  14
## 66899  4      2        NA  14
## 66902  4      2         5  28
## 66903  4      2         3  20
## 66905  4      2         3  20
## 66911  2      1         2  21
## 66916  4      1         4  30
## 66917  2      1         4  27
## 66918  1      2         5  37
## 66919  1      1         4  31
## 66920  2      2         4  32
## 66921  2      1         1  19
## 66924  4      1         3  42
## 66925  1      1         3  20
## 66926  3      2         4  24
## 66927  2      2         5  27
## 66929  2      1         3  21
## 66930  3      2         3  36
## 66932  2      1         2  48
## 66934  1      1         3  21
## 66935  2      2         2  31
## 66937  1      2         4  22
## 66944  4      2         3  23
## 66945  5      2         5  23
## 66946  2      1         4  30
## 66947  1      2         5  35
## 66949  1      2         3  21
## 66953  5      2         3  22
## 66960  2      1         5  28
## 66962  5      2         3  20
## 66965  2      2         4  51
## 66968  3      2         2  19
## 66970  3      2         4  24
## 66982  1      2         5  45
## 66983  5      2         1  21
## 66985  2      1         3  26
## 66986  2      1         2  22
## 66987  2      2         4  50
## 66988  2      2         5  36
## 66994  1      1         4  50
## 66995  2      1         2  22
## 66997  2      2         4  23
## 67000  1      2         1  15
## 67003  4      2        NA  15
## 67007  1      1         3  21
## 67008  3      2         3  23
## 67013  4      2         5  35
## 67014  4      2         5  33
## 67017  2      2        NA  27
## 67018  1      1         2  29
## 67019  2      1         3  21
## 67022  3      1         3  31
## 67023  2      1         3  21
## 67024  1      1         5  26
## 67025  4      2         3  20
## 67026  5      2         5  56
## 67027  2      1         5   3
## 67029  5      1         2  65
## 67031  1      2         3  34
## 67033  3      2         4  29
## 67034  4      2         4  21
## 67036  4      2         2  32
## 67039  2      1         2  26
## 67040  1      1         4  27
## 67041  1      2         4  45
## 67042  2      1        NA  17
## 67043  2      2         3  20
## 67045  2      2         2  20
## 67046  4      1         4  43
## 67049  1      2         5  26
## 67055  5      1         4  55
## 67056  1      2         5  38
## 67057  1      2         4  32
## 67059  1      2         1  19
## 67064  4      1         3  22
## 67065  4      2         3  21
## 67066  1      2         5  40
## 67070  2      2         4  19
## 67072  4      1         3  23
## 67073  1      1         1  18
## 67075  2      1         3  32
## 67078  1      1         1  49
## 67079  2      2         3  42
## 67080  1      2        NA  31
## 67082  5      2         3  23
## 67085  2      2         5  30
## 67087  3      2         1  24
## 67091  3      1         5  26
## 67093  3      1         3  21
## 67095  2      2         3  21
## 67096  1      1         5  23
## 67098  1      2         2  61
## 67101  1      1        NA  15
## 67104  1      1         4  28
## 67107  2      1         3  25
## 67109  1      1         5  34
## 67115  4      2         2  21
## 67116  6      1        NA  41
## 67118  6      2         5  23
## 67119  6      1        NA  52
## 67121  3      1         3  20
## 67123  5      2         3  19
## 67124  1      2         3  36
## 67126  6      2         3  18
## 67132  3      2         3  19
## 67134  3      2         3  22
## 67135  3      2         3  19
## 67136  2      2         3  24
## 67140  5      2         5  24
## 67143  2      2         3  18
## 67144  5      1         3  22
## 67145  1      1         2  27
## 67146  2      1        NA  12
## 67148  4      1        NA  13
## 67149  3      1        NA  12
## 67152  2      1        NA  12
## 67154  2      2        NA  11
## 67155  2      2        NA  12
## 67156  4      1        NA  12
## 67157  3      2        NA  12
## 67158  1      2        NA  12
## 67161  2      2        NA  12
## 67162  5      2        NA  12
## 67168  1      2        NA  14
## 67174  3      1         3  20
## 67179  2      1         3  23
## 67180  1      2         3  28
## 67183  2      1         3  20
## 67184  2      1        NA  17
## 67185  2      2        NA  16
## 67186  3      2        NA  16
## 67188  6      2        NA  17
## 67189  5      1        NA  18
## 67190  2      1        NA  17
## 67191  3      2        NA  17
## 67197  4      2        NA  12
## 67202  2      1        NA  12
## 67203  3      2        NA  12
## 67206  5      1        NA  12
## 67213  3      1        NA  12
## 67215  3      1        NA  12
## 67220  4      1        NA  13
## 67222  2      2         4  24
## 67223  5      1         5  22
## 67224  4      2         1  19
## 67225  1      1         3  44
## 67226  2      1         5  29
## 67229  1      2         4  23
## 67230  2      1         3  25
## 67232  2      2         3  57
## 67234  3      2         3  19
## 67237  5      2         4  26
## 67238  2      2         3  19
## 67239  1      1         4  34
## 67240  1      2         3  19
## 67242  4      1         3  38
## 67246  2      2         3  20
## 67247  2      1         2  22
## 67251  4      2         3  25
## 67254  1      1         5  33
## 67255  1      2         3  38
## 67257  3      2         5  19
## 67258  1      2         5  35
## 67259 NA      2        NA  11
## 67260  1      1        NA  12
## 67262  1      1        NA  12
## 67263  3      1        NA  12
## 67269  4      2        NA  12
## 67270  2      1         5  40
## 67271  4      2        NA  12
## 67272  3      2        NA  12
## 67274  5      2        NA  12
## 67275  3      2        NA  12
## 67277  4      2         4  42
## 67278  2      1         5  27
## 67279  3      1         4  31
## 67283  3      2         3  24
## 67284  1      1         5  44
## 67286  2      1         2  37
## 67287  6      1         2  33
## 67288  1      1         3  26
## 67289  1      2         3  33
## 67294  3      1         3  26
## 67295  1      1         4  46
## 67298  4      2         4  19
## 67299  4      2         3  22
## 67303  3      1        NA  16
## 67307  3      1         2  28
## 67309  3      2         4  29
## 67310  3      2         5  31
## 67312  4      2         3  18
## 67313  1      2         3  29
## 67315  3      1         2  20
## 67316  4      1         2  22
## 67322  2      1         5  45
## 67324  3      1         1  19
## 67325  1      1         3  39
## 67328  2      1         3  21
## 67331  6      1         5  46
## 67332  3      2        NA  17
## 67334  2      2         4  34
## 67335  2      2         1  24
## 67336  2      2         4  49
## 67338  2      2         3  20
## 67339  2      1         5  43
## 67341  5      2         2  38
## 67342  4      2         4  51
## 67344  4      2         2  20
## 67345  1      2         4  27
## 67346  2      2         5  23
## 67347  1      1         5  57
## 67352  1      2         5  27
## 67355  1      1         3  25
## 67356  4      1         3  23
## 67357  2      2         3  38
## 67360  4      2         3  18
## 67363  1      1         4  25
## 67364  1      2         3  19
## 67365  1      1         2  27
## 67366  1      2         5  25
## 67367  2      2         3  22
## 67368 NA      2         3  22
## 67370  4      2         3  22
## 67371  4      2         3  22
## 67374  5      2        NA  15
## 67376  2      2         4  33
## 67377  2      1        NA  15
## 67378  2      2        NA  15
## 67379  3      2         3  48
## 67380  3      2         4  28
## 67382  2      1         3  20
## 67388  3      1         2  54
## 67390  5      1         3  22
## 67392  4      2         1  23
## 67393  2      2        NA  16
## 67395  5      2         2  32
## 67396  5      2         4  46
## 67397  4      2         3  22
## 67399  2      2         3  23
## 67401  2      2         5  40
## 67403  1      2         2  22
## 67406  2      2         3  56
## 67408  1      1         1  43
## 67413 NA      1        NA  12
## 67415  1      1         4  28
## 67417  1      2         1  17
## 67418  1      1         5  43
## 67420  2      1         3  19
## 67421  2      2         5  25
## 67426  4      1         3  22
## 67427  1      2         2  39
## 67429  4      1         3  38
## 67431  2      2        NA  16
## 67436  3      2         5  25
## 67438  3      1         5  36
## 67439  4      2         2  38
## 67440  1      2         3  18
## 67441  3      2         4  47
## 67442  1      2         1  40
## 67445  2      1         3  21
## 67446  2      2        NA  16
## 67447  3      2         3  25
## 67449  1      1         1  17
## 67451  5      2         3  41
## 67453  1      2         4  52
## 67454  1      1         5  28
## 67455  1      2         5  26
## 67458  2      1         3  26
## 67460  2      2         3  21
## 67462  1      1        NA  17
## 67465  6      2         3  22
## 67471  2      1         1  17
## 67473  2      1         4  23
## 67479  2      1         4  35
## 67480  2      1         3  29
## 67483  3      2         4  33
## 67485  5      1         3  21
## 67487  2      2         2  42
## 67488  3      2        NA  14
## 67489  3      2         4  31
## 67490  1      2         4  37
## 67495  3      1         2  43
## 67497  1      2         4  26
## 67502  2      2         3  25
## 67503  4      2         1  18
## 67504  2      1         2  19
## 67505  2      1         2  33
## 67506  4      2         4  23
## 67507  3      2         3  31
## 67508  1      2        NA  16
## 67509  1      1         3  23
## 67510  6      1         3  25
## 67512  2      1         3  20
## 67516  3      2         3  25
## 67518  4      2         1  45
## 67521  4      1         3  26
## 67522  1      1         2  36
## 67523  2      2         3  32
## 67524  3      2         3  24
## 67525  1      2         4  30
## 67526  1      1         4  47
## 67528  1      2         3  22
## 67529  3      2         1  21
## 67530  3      2         1  21
## 67531  1      2         5  40
## 67533  2      2         3  24
## 67534  2      2         3  47
## 67535  2      1         2  29
## 67537  1      1         5  28
## 67539  4      2         5  33
## 67540  3      2         3  23
## 67541  4      2         3  22
## 67544  4      2         3  22
## 67547  2      2         4  24
## 67549  2      1        NA  15
## 67551  1      1         3  19
## 67552  2      1         4  27
## 67556  3      2         4  29
## 67559  1      1         4  31
## 67560  1      2         4  50
```


```r
psych::bfi %>%
  as_tibble() %>%
  select(A1:A5) %>%
  rowwise() %>%
  mutate(A_Mean = mean(c(A1, A2, A3, A4, A5), na.rm = TRUE))
```

```
## Source: local data frame [2,800 x 6]
## Groups: <by row>
## 
## # A tibble: 2,800 x 6
##       A1    A2    A3    A4    A5 A_Mean
##    <int> <int> <int> <int> <int>  <dbl>
##  1     2     4     3     4     4    3.4
##  2     2     4     5     2     5    3.6
##  3     5     4     5     4     4    4.4
##  4     4     4     6     5     5    4.8
##  5     2     3     3     4     5    3.4
##  6     6     6     5     6     5    5.6
##  7     2     5     5     3     5    4  
##  8     4     3     1     5     1    2.8
##  9     4     3     6     3     3    3.8
## 10     2     5     6     6     5    4.8
## # ... with 2,790 more rows
```

Now compute mean scores for Conscientiousness, as well as `sd` and `min` scores for reach person.


```r
psych::bfi %>%
  as_tibble() %>%
  select(C1:C5) %>%
  rowwise() %>%
  mutate(C_Mean = mean(c(C1, C2, C3, C4, C5), na.rm = TRUE), 
         C_SD = sd(c(C1, C2, C3, C4, C5), na.rm = TRUE), 
         C_Min = min(c(C1, C2, C3, C4, C5), na.rm = TRUE))
```

```
## Source: local data frame [2,800 x 8]
## Groups: <by row>
## 
## # A tibble: 2,800 x 8
##       C1    C2    C3    C4    C5 C_Mean  C_SD C_Min
##    <int> <int> <int> <int> <int>  <dbl> <dbl> <int>
##  1     2     3     3     4     4    3.2 0.837     2
##  2     5     4     4     3     4    4   0.707     3
##  3     4     5     4     2     5    4   1.22      2
##  4     4     4     3     5     5    4.2 0.837     3
##  5     4     4     5     3     2    3.6 1.14      2
##  6     6     6     6     1     3    4.4 2.30      1
##  7     5     4     4     2     3    3.6 1.14      2
##  8     3     2     4     2     4    3   1         2
##  9     6     6     3     4     5    4.8 1.30      3
## 10     6     5     6     2     1    4   2.35      1
## # ... with 2,790 more rows
```

Some functions are **vectorized**, so you don't need `rowwise()`. 
For example, `pmin()` computes the "parallel min" across the vectors it receives:


```r
psych::bfi %>%
  as_tibble() %>%
  select(C1:C5) %>%
  pmin()
```

```
## # A tibble: 2,800 x 5
##       C1    C2    C3    C4    C5
##    <int> <int> <int> <int> <int>
##  1     2     3     3     4     4
##  2     5     4     4     3     4
##  3     4     5     4     2     5
##  4     4     4     3     5     5
##  5     4     4     5     3     2
##  6     6     6     6     1     3
##  7     5     4     4     2     3
##  8     3     2     4     2     4
##  9     6     6     3     4     5
## 10     6     5     6     2     1
## # ... with 2,790 more rows
```

**There are a few other ways to do this sort of computation.**

`rowMeans()` computes the mean of each row of a data frame. We can use it by
putting `select()` inside of `mutate()`:



**In the development version of `dplyr`, there are some functions to make**
**this approach easier.**

```
remotes::install_github("tidyverse/dplyr")
```



### 3.
Let's use `psych::bfi` and make a new data frame that has (1) each participant's educational level (convert it to a categorical variable using `factor*()`) and the mean score for each of the Big Five scales for each participant. Store this data frame as a new object.
   

```r
psych_2 <- psych::bfi %>%
  as_tibble() %>%
  select(A1:A5, C1:C5, E1:E5, N1:N5, O1:O5, education) %>%
  rowwise() %>%
  summarize(A_Mean = mean(c(A1, A2, A3, A4, A5), na.rm = TRUE), 
            C_Mean = mean(c(C1, C2, C3, C4, C5), na.rm = TRUE), 
            E_Mean = mean(c(E1, E2, E3, E4, E5), na.rm = TRUE),
            N_Mean = mean(c(N1, N2, N3, N4, N5), na.rm = TRUE), 
            O_Mean = mean(c(O1, O2, O3, O4, O5), na.rm = TRUE),
            education) %>%
  print()
```

```
## # A tibble: 2,800 x 6
##    A_Mean C_Mean E_Mean N_Mean O_Mean education
##     <dbl>  <dbl>  <dbl>  <dbl>  <dbl>     <int>
##  1    3.4    3.2   3.4     2.8    3.8        NA
##  2    3.6    4     3       3.8    3.2        NA
##  3    4.4    4     3.8     3.6    3.6        NA
##  4    4.8    4.2   4       2.8    3.6        NA
##  5    3.4    3.6   3.6     3.2    3.2        NA
##  6    5.6    4.4   4       3      3.8         3
##  7    4      3.6   4.2     1.4    3.8        NA
##  8    2.8    3     3.2     4.2    3.4         2
##  9    3.8    4.8   3.75    3.6    5           1
## 10    4.8    4     3.6     4.2    3.6        NA
## # ... with 2,790 more rows
```
