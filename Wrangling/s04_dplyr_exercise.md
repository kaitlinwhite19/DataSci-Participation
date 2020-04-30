---
title: 's04: `dplyr` Exercise'
author: "Kaitlin White"
output: 
  html_document:
    keep_md: true
    theme: paper
---

**Setting up & Reminders**

<!---The following chunk allows errors when knitting--->



*When you make an Rmd file for participation or homework, be sure to do this*:

1. Change the file output to both html and md _documents_ (not notebook).
  - See the `keep_md: TRUE` argument above.

2. `knit` the document. 

3. Stage and commit the Rmd and knitted documents.

~~~~~~~~~~~

**Lecture Begins**

# Intro to `dplyr` syntax

Load the `gapminder` and `tidyverse` packages.
    - This loads `dplyr`, too.
    

```r
suppressPackageStartupMessages(library("gapminder"))
suppressPackageStartupMessages(library("tidyverse"))
suppressPackageStartupMessages(library("dplyr"))
```
    

**Participation**

## `select()`

1. Make a data frame containing the columns `year`, `lifeExp`, `country` from 
the `gapminder` data, in that order.


```r
select(gapminder, year, lifeExp, country)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country    
##    <int>   <dbl> <fct>      
##  1  1952    28.8 Afghanistan
##  2  1957    30.3 Afghanistan
##  3  1962    32.0 Afghanistan
##  4  1967    34.0 Afghanistan
##  5  1972    36.1 Afghanistan
##  6  1977    38.4 Afghanistan
##  7  1982    39.9 Afghanistan
##  8  1987    40.8 Afghanistan
##  9  1992    41.7 Afghanistan
## 10  1997    41.8 Afghanistan
## # ... with 1,694 more rows
```

2. Select all variables, from `country` to `lifeExp`.


```r
# This will work:
select(gapminder, country, continent, year, lifeExp)
```

```
## # A tibble: 1,704 x 4
##    country     continent  year lifeExp
##    <fct>       <fct>     <int>   <dbl>
##  1 Afghanistan Asia       1952    28.8
##  2 Afghanistan Asia       1957    30.3
##  3 Afghanistan Asia       1962    32.0
##  4 Afghanistan Asia       1967    34.0
##  5 Afghanistan Asia       1972    36.1
##  6 Afghanistan Asia       1977    38.4
##  7 Afghanistan Asia       1982    39.9
##  8 Afghanistan Asia       1987    40.8
##  9 Afghanistan Asia       1992    41.7
## 10 Afghanistan Asia       1997    41.8
## # ... with 1,694 more rows
```

```r
# Better way:
select(gapminder, FILL_THIS_IN)
```

```
## Error: Can't subset columns that don't exist.
## [31mx[39m The column `FILL_THIS_IN` doesn't exist.
```

3. Select all variables, except `lifeExp`.


```r
select(gapminder, FILL_THIS_IN)
```

```
## Error: Can't subset columns that don't exist.
## [31mx[39m The column `FILL_THIS_IN` doesn't exist.
```

4. Put `continent` first. Hint: use the `everything()` function.


```r
select(gapminder, FILL_THIS_IN, FILL_THIS_IN)
```

```
## Error: Can't subset columns that don't exist.
## [31mx[39m The column `FILL_THIS_IN` doesn't exist.
```

5. Rename `continent` to `cont`.


```r
# compare
select(gapminder, FILL_THIS_IN)
```

```
## Error: Can't subset columns that don't exist.
## [31mx[39m The column `FILL_THIS_IN` doesn't exist.
```

```r
rename(gapminder, FILL_THIS_IN)
```

```
## Error: Can't rename columns that don't exist.
## [31mx[39m The column `FILL_THIS_IN` doesn't exist.
```


**This is where I came in**


## `arrange()`

1. Order by year.


```r
arrange(gapminder, year)
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Albania     Europe     1952    55.2  1282697     1601.
##  3 Algeria     Africa     1952    43.1  9279525     2449.
##  4 Angola      Africa     1952    30.0  4232095     3521.
##  5 Argentina   Americas   1952    62.5 17876956     5911.
##  6 Australia   Oceania    1952    69.1  8691212    10040.
##  7 Austria     Europe     1952    66.8  6927772     6137.
##  8 Bahrain     Asia       1952    50.9   120447     9867.
##  9 Bangladesh  Asia       1952    37.5 46886859      684.
## 10 Belgium     Europe     1952    68    8730405     8343.
## # ... with 1,694 more rows
```

2. Order by year, in descending order.


```r
arrange(gapminder, desc(year))
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp       pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Afghanistan Asia       2007    43.8  31889923      975.
##  2 Albania     Europe     2007    76.4   3600523     5937.
##  3 Algeria     Africa     2007    72.3  33333216     6223.
##  4 Angola      Africa     2007    42.7  12420476     4797.
##  5 Argentina   Americas   2007    75.3  40301927    12779.
##  6 Australia   Oceania    2007    81.2  20434176    34435.
##  7 Austria     Europe     2007    79.8   8199783    36126.
##  8 Bahrain     Asia       2007    75.6    708573    29796.
##  9 Bangladesh  Asia       2007    64.1 150448339     1391.
## 10 Belgium     Europe     2007    79.4  10392226    33693.
## # ... with 1,694 more rows
```

3. Order by year, then by life expectancy.


```r
arrange(gapminder, year, lifeExp)
```

```
## # A tibble: 1,704 x 6
##    country       continent  year lifeExp     pop gdpPercap
##    <fct>         <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Afghanistan   Asia       1952    28.8 8425333      779.
##  2 Gambia        Africa     1952    30    284320      485.
##  3 Angola        Africa     1952    30.0 4232095     3521.
##  4 Sierra Leone  Africa     1952    30.3 2143249      880.
##  5 Mozambique    Africa     1952    31.3 6446316      469.
##  6 Burkina Faso  Africa     1952    32.0 4469979      543.
##  7 Guinea-Bissau Africa     1952    32.5  580653      300.
##  8 Yemen, Rep.   Asia       1952    32.5 4963829      782.
##  9 Somalia       Africa     1952    33.0 2526994     1136.
## 10 Guinea        Africa     1952    33.6 2664249      510.
## # ... with 1,694 more rows
```


## Piping, `%>%`

Note: think of `%>%` as the word "then"!


### Base R method

This is how I could do it by *nesting* the two function calls:


```r
# Nesting function calls can be hard to read
arrange(select(gapminder, year, lifeExp, country), year, lifeExp)
```


```r
gap_sel <- select(gapminder, year, lifeExp, country)
arrange(gap_sel, year, lifeExp)
```

### tidyverse method

Now using with pipes:


```r
# alter the below to include 2 "pipes"
arrange(select(gapminder), year, lifeExp, country), year, lifeExp)
```

```
## Error: <text>:2:51: unexpected ','
## 1: # alter the below to include 2 "pipes"
## 2: arrange(select(gapminder), year, lifeExp, country),
##                                                      ^
```


```r
gapminder %>% 
  select(year, lifeExp, country) %>%
  arrange(year, lifeExp)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country      
##    <int>   <dbl> <fct>        
##  1  1952    28.8 Afghanistan  
##  2  1952    30   Gambia       
##  3  1952    30.0 Angola       
##  4  1952    30.3 Sierra Leone 
##  5  1952    31.3 Mozambique   
##  6  1952    32.0 Burkina Faso 
##  7  1952    32.5 Guinea-Bissau
##  8  1952    32.5 Yemen, Rep.  
##  9  1952    33.0 Somalia      
## 10  1952    33.6 Guinea       
## # ... with 1,694 more rows
```


# Back to Guide 

Return to guide at the section on *Relational/Comparison and Logical Operators in R*.


# Transforming datasets

## `filter()`

1. Only take data with population greater than 100 million.


```r
gapminder %>%
  filter(pop > 100000000)
```

```
## # A tibble: 77 x 6
##    country    continent  year lifeExp       pop gdpPercap
##    <fct>      <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Bangladesh Asia       1987    52.8 103764241      752.
##  2 Bangladesh Asia       1992    56.0 113704579      838.
##  3 Bangladesh Asia       1997    59.4 123315288      973.
##  4 Bangladesh Asia       2002    62.0 135656790     1136.
##  5 Bangladesh Asia       2007    64.1 150448339     1391.
##  6 Brazil     Americas   1972    59.5 100840058     4986.
##  7 Brazil     Americas   1977    61.5 114313951     6660.
##  8 Brazil     Americas   1982    63.3 128962939     7031.
##  9 Brazil     Americas   1987    65.2 142938076     7807.
## 10 Brazil     Americas   1992    67.1 155975974     6950.
## # ... with 67 more rows
```

2. Your turn: of those rows filtered from step 1., only take data from Asia.


```r
gapminder %>%
  filter(pop > 100000000, continent=="Asia")
```

```
## # A tibble: 52 x 6
##    country    continent  year lifeExp       pop gdpPercap
##    <fct>      <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Bangladesh Asia       1987    52.8 103764241      752.
##  2 Bangladesh Asia       1992    56.0 113704579      838.
##  3 Bangladesh Asia       1997    59.4 123315288      973.
##  4 Bangladesh Asia       2002    62.0 135656790     1136.
##  5 Bangladesh Asia       2007    64.1 150448339     1391.
##  6 China      Asia       1952    44   556263527      400.
##  7 China      Asia       1957    50.5 637408000      576.
##  8 China      Asia       1962    44.5 665770000      488.
##  9 China      Asia       1967    58.4 754550000      613.
## 10 China      Asia       1972    63.1 862030000      677.
## # ... with 42 more rows
```

3. Repeat 2, but take data from countries Brazil, and China. 


```r
gapminder %>%
  filter(pop > 10000000, country %in% c("China", "Brazil"))
```

```
## # A tibble: 24 x 6
##    country continent  year lifeExp       pop gdpPercap
##    <fct>   <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Brazil  Americas   1952    50.9  56602560     2109.
##  2 Brazil  Americas   1957    53.3  65551171     2487.
##  3 Brazil  Americas   1962    55.7  76039390     3337.
##  4 Brazil  Americas   1967    57.6  88049823     3430.
##  5 Brazil  Americas   1972    59.5 100840058     4986.
##  6 Brazil  Americas   1977    61.5 114313951     6660.
##  7 Brazil  Americas   1982    63.3 128962939     7031.
##  8 Brazil  Americas   1987    65.2 142938076     7807.
##  9 Brazil  Americas   1992    67.1 155975974     6950.
## 10 Brazil  Americas   1997    69.4 168546719     7958.
## # ... with 14 more rows
```

## `mutate()` (10 min)

The `mutate()` function _creates_ new columns in the tibble by transforming other variables. Like `select()`, `filter()`, and `arrange()`, the `mutate()` function also takes a tibble as its first argument, and returns a tibble. 

The general syntax is:

```
mutate(tibble, NEW_COLUMN_NAME = CALCULATION)
```

Let's get: 

- GDP by multiplying GPD per capita with population, and
- GDP in billions, named (`gdpBill`), rounded to two decimals.


```r
gapminder %>%
  mutate(grossGDP = gdpPercap * pop)
```

```
## # A tibble: 1,704 x 7
##    country     continent  year lifeExp      pop gdpPercap     grossGDP
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>        <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.  6567086330.
##  2 Afghanistan Asia       1957    30.3  9240934      821.  7585448670.
##  3 Afghanistan Asia       1962    32.0 10267083      853.  8758855797.
##  4 Afghanistan Asia       1967    34.0 11537966      836.  9648014150.
##  5 Afghanistan Asia       1972    36.1 13079460      740.  9678553274.
##  6 Afghanistan Asia       1977    38.4 14880372      786. 11697659231.
##  7 Afghanistan Asia       1982    39.9 12881816      978. 12598563401.
##  8 Afghanistan Asia       1987    40.8 13867957      852. 11820990309.
##  9 Afghanistan Asia       1992    41.7 16317921      649. 10595901589.
## 10 Afghanistan Asia       1997    41.8 22227415      635. 14121995875.
## # ... with 1,694 more rows
```



```r
gapminder %>%
  mutate(grossGDP=gdpPercap * pop)
```

```
## # A tibble: 1,704 x 7
##    country     continent  year lifeExp      pop gdpPercap     grossGDP
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>        <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.  6567086330.
##  2 Afghanistan Asia       1957    30.3  9240934      821.  7585448670.
##  3 Afghanistan Asia       1962    32.0 10267083      853.  8758855797.
##  4 Afghanistan Asia       1967    34.0 11537966      836.  9648014150.
##  5 Afghanistan Asia       1972    36.1 13079460      740.  9678553274.
##  6 Afghanistan Asia       1977    38.4 14880372      786. 11697659231.
##  7 Afghanistan Asia       1982    39.9 12881816      978. 12598563401.
##  8 Afghanistan Asia       1987    40.8 13867957      852. 11820990309.
##  9 Afghanistan Asia       1992    41.7 16317921      649. 10595901589.
## 10 Afghanistan Asia       1997    41.8 22227415      635. 14121995875.
## # ... with 1,694 more rows
```

```r
    gpdBill = (grossGDP/100000000) %>% round(2)
```

```
## Error in eval(lhs, parent, parent): object 'grossGDP' not found
```
Notice the backwards compatibility! No need for loops!

Try the same thing, but with `transmute` (drops all other variables). 


```r
gapminder %>%
  transmute(gdpbill=(pop * gdpPercap / 100000000) %>% round(2))
```

```
## # A tibble: 1,704 x 1
##    gdpbill
##      <dbl>
##  1    65.7
##  2    75.8
##  3    87.6
##  4    96.5
##  5    96.8
##  6   117. 
##  7   126. 
##  8   118. 
##  9   106. 
## 10   141. 
## # ... with 1,694 more rows
```

The `if_else` function is useful for changing certain elements in a data frame.

Example: Suppose Canada's 1952 life expectancy was mistakenly entered as 68.8 in the data frame, but is actually 70. Fix it using `if_else` and `mutate`. 


```r
gapminder %>%
  mutate(lifeExp = if_else(country == "canada" & year == 1952, 
                           70,
                           lifeExp)) %>% filter(country=="Canada")
```

```
## # A tibble: 12 x 6
##    country continent  year lifeExp      pop gdpPercap
##    <fct>   <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Canada  Americas   1952    68.8 14785584    11367.
##  2 Canada  Americas   1957    70.0 17010154    12490.
##  3 Canada  Americas   1962    71.3 18985849    13462.
##  4 Canada  Americas   1967    72.1 20819767    16077.
##  5 Canada  Americas   1972    72.9 22284500    18971.
##  6 Canada  Americas   1977    74.2 23796400    22091.
##  7 Canada  Americas   1982    75.8 25201900    22899.
##  8 Canada  Americas   1987    76.9 26549700    26627.
##  9 Canada  Americas   1992    78.0 28523502    26343.
## 10 Canada  Americas   1997    78.6 30305843    28955.
## 11 Canada  Americas   2002    79.8 31902268    33329.
## 12 Canada  Americas   2007    80.7 33390141    36319.
```

Replace Bangladesh w/ NA


```r
gapminder %>%
  mutate(country == "Bangladesh", 
         lifeExp = NA_real_) %>%
  filter(country == "Bangladesh")
```

```
## # A tibble: 12 x 7
##    country    continent  year lifeExp      pop gdpPercap `country == "Banglades~
##    <fct>      <fct>     <int>   <dbl>    <int>     <dbl> <lgl>                  
##  1 Bangladesh Asia       1952      NA   4.69e7      684. TRUE                   
##  2 Bangladesh Asia       1957      NA   5.14e7      662. TRUE                   
##  3 Bangladesh Asia       1962      NA   5.68e7      686. TRUE                   
##  4 Bangladesh Asia       1967      NA   6.28e7      721. TRUE                   
##  5 Bangladesh Asia       1972      NA   7.08e7      630. TRUE                   
##  6 Bangladesh Asia       1977      NA   8.04e7      660. TRUE                   
##  7 Bangladesh Asia       1982      NA   9.31e7      677. TRUE                   
##  8 Bangladesh Asia       1987      NA   1.04e8      752. TRUE                   
##  9 Bangladesh Asia       1992      NA   1.14e8      838. TRUE                   
## 10 Bangladesh Asia       1997      NA   1.23e8      973. TRUE                   
## 11 Bangladesh Asia       2002      NA   1.36e8     1136. TRUE                   
## 12 Bangladesh Asia       2007      NA   1.50e8     1391. TRUE
```

**Better way to do this** 

```r
gapminder %>%
  mutate(lifeExp = if_else(country == "Bangladesh",
         NA_real_,
         lifeExp))
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # ... with 1,694 more rows
```


Your turn: Make a new column called `cc` that pastes the country name followed by the continent, separated by a comma. (Hint: use the `paste` function with the `sep=", "` argument).


These functions we've seen are called __vectorized functions__—they are designed 
to work with vectors and do their computation on each element of the vector(s).

## git stuff

Now is a good time to knit, commit, push!


# Back to Guide Again

Let's head back to the guide at the section on `summarize()`.


# Exercises for grouped data frames

Let's do some practice with grouping (and ungrouping) and summarizing data frames!

1. (a) What's the minimum life expectancy for each continent and each year? (b) Add the corresponding country to the tibble, too. (c) Arrange by min life expectancy.


```r
gapminder %>% 
  group_by(FILL_THIS_IN) %>% 
  FILL_THIS_IN(min_life = min(lifeExp))
```

```
## Error: Column `FILL_THIS_IN` is unknown
```


2. Let's compute the mean Agreeableness score across items for each participant 
in the `psych::bfi` dataset. Be sure to handle `NA`!


```r
psych::bfi %>%
  as_tibble() %>% 
  select(A1:A5) %>% 
  rowwise() %>% 
  mutate(A_mean = mean(c(A1, A2, A3, A4, A5), na.rm = TRUE)) %>% 
  ungroup()
```

```
## Error in loadNamespace(name): there is no package called 'psych'
```

Now compute mean scores for the other Big Five traits, as well as 
`sd` and `min` scores for reach person.



** There are a few other ways to do this sort of computation.**

`rowMeans()` computes the mean of each row of a data frame. We can use it by
putting `select()` inside of `mutate()`:


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_mn = rowMeans(select(., A1:A5)),
         A_mn2 = rowMeans(select(., starts_with("A", ignore.case = FALSE))))
```

```
## Error in loadNamespace(name): there is no package called 'psych'
```

Some functions are **vectorized**, so you don't need `rowwise()`. 
For example, `pmin()` computes the "parallel min" across the vectors it receives:


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_min = pmin(A1, A2, A3, A4, A5))
```

```
## Error in loadNamespace(name): there is no package called 'psych'
```


3. Calculate the growth in population since the first year on record 
_for each country_ by rearranging the following lines, and filling in the 
`FILL_THIS_IN`. Here's another convenience function for you: `dplyr::first()`. 

```
mutate(rel_growth = FILL_THIS_IN) %>% 
arrange(FILL_THIS_IN) %>% 
gapminder %>% 
knitr::kable()
group_by(country) %>% 
```




4. Determine the country, on each continent, that experienced the 
**sharpest 5-year drop in life expectancy**, sorted by the drop, by rearranging 
the following lines of code. Ensure there are no `NA`'s. A helpful function to 
compute changes in a variable across rows of data (e.g., for time-series data) 
is `tsibble::difference()`:

```
drop_na() %>% 
ungroup() %>% 
arrange(year) %>% 
filter(inc_life_exp == min(inc_life_exp)) %>% 
gapminder %>% 
mutate(inc_life_exp = FILL_THIS_IN) %>% # Compute the changes in life expectancy
arrange(inc_life_exp) %>% 
group_by(country) %>% 
group_by(continent) %>% 
knitr::kable()
```




# Bonus Exercises

If there's time remaining, we'll practice with these three exercises. 
I'll give you a minute for each, then we'll go over the answer.

1. In `gapminder`, take all countries in Europe that have a GDP per capita 
   greater than 10000, and select all variables except `gdpPercap`. 
   (Hint: use `-`).

2. Take the first three columns of `gapminder` and extract the names.

3. In `gapminder`, convert the population to a number in billions.

4. Take the `iris` data frame and extract all columns that start with 
   the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the 
      following code: `?tidyselect::select_helpers`.

5. Filter the rows of `iris` for Sepal.Length >= 4.6 and Petal.Width >= 0.5.

Exercises 4. and 5. are from 
[r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).
