
<!-- README.md is generated from README.Rmd. Please edit that file -->

# canadacovidmetricsR

<!-- badges: start -->
<!-- badges: end -->

canadacovidmetricsR provides key metrics regarding COVID-19 situation in
Canada across provinces using the [OpenCovid
API](https://opencovid.ca/api/).

## Summary

This package allows users to obtain key metrics on COVID-19 situation in
Canada at national or provincial level for a specific time period. The 4
functions will return key metrics, including total cumulative cases,
total cumulative deaths, total cumulative recovered cases and total
cumulative vaccine completion, using data from [OpenCovid
API](https://opencovid.ca/api/). The users may use the key metrics to
conduct further analyses on COVID-19 situation in Canada.

## Functions

There are 4 functions in this package:

-   `get_cases` Query total cumulative cases with ability
    to specify province and date range of returned data.

-   `get_deaths` Query total cumulative deaths with ability
    to specify province and date range of returned data.

-   `get_recoveries` Query total cumulative recovered
    cases with ability to specify province and date range of returned
    data.

-   `get_vaccinations` Query total cumulative vaccine
    completion with ability to specify province and date range of
    returned data.

## Installation

You can install the released version of canadacovidmetricsR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("canadacovidmetricsR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/canadacovidmetricsR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(canadacovidmetricsR)
total_cumulative_cases(loc = "BC")
## basic example code
```

## Usage

-   TODO

## R ecosystem

There are several packages for easy access to COVID-19 key metrics or
data using different APIs, examples include

-   [COVID19](https://cran.r-project.org/web/packages/COVID19/index.html)
    using [John Hopkins University
    API](https://coronavirus.jhu.edu/about/)
-   [COVID19.Analytics](https://cran.r-project.org/web/packages/covid19.analytics/)
    using [John Hopkins University
    API](https://coronavirus.jhu.edu/about/)
-   [covid19br](https://cran.r-project.org/web/packages/covid19br/index.html)
    using [official Brazilian repository](https://covid.saude.gov.br/)

To our knowledge, there is no similar package using [OpenCovid
API](https://opencovid.ca/api/) in the R ecosystem.

## Contributors

-   Adam Morphy (@adammorphy)
-   Brandon Lam (@ming0701)
-   Lakshmi Santosha Valli Akella (@valli180)
-   Luke Collins (@LukeAC)

We welcome and recognize all contributions. Please find the guide for
contribution in [Contributing
Document](https://github.com/UBC-MDS/canadacovidmetricsR/blob/main/.github/CONTRIBUTING.md).

## License

`canadacovidmetricsR` was created by the Contributors. It is licensed
under the terms of the MIT license.
