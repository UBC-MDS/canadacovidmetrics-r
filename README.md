
<!-- README.md is generated from README.Rmd. Please edit that file -->

# canadacovidmetricsR

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/canadacovidmetricsR/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/canadacovidmetricsR/actions)
[![codecov](https://codecov.io/gh/UBC-MDS/canadacovidmetricsR/branch/main/graph/badge.svg?token=QITVZBTZBU)](https://codecov.io/gh/UBC-MDS/canadacovidmetricsR)
<!-- badges: end -->

canadacovidmetricsR provides key metrics regarding COVID-19 situation in
Canada across provinces using the [OpenCovid
API](https://opencovid.ca/api/).

## Summary

This package allows users to obtain key metrics on the COVID-19 situation in
Canada at a national or provincial level for a specific time period. The package
contains 4 functions, each of which returns a key metric relating to COVID-19 in Canada.
The 4 metrics are: reported cases, reported deaths, reported recoveries, and reported vaccinations.
The results returned relect both point-in-time as well as cumulative quantities.
This package leverages [OpenCovidAPI](https://opencovid.ca/api/), which exposes reliable data
to be consumed by users of this package.

## Functions

There are 4 functions in this package:

-   `get_cases` Query reported cases with ability to specify
    location grouping and date range of returned data.

-   `get_deaths` Query reported deaths with ability to specify
    location grouping and date range of returned data.

-   `get_recoveries` Query reported recoveries with ability to specify
    location grouping and date range of returned data.

-   `get_vaccinations` Query reported vaccinations with ability to specify
    location grouping and date range of returned data.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/canadacovidmetricsR")
```

## Usage and Example

### Obtain the number of new reported cases on a particular date in British Columbia using get_cases():

-   `get_cases` Query reported cases with ability to specify
    location grouping and date range of returned data.

``` r
library(canadacovidmetricsR)
get_cases(loc = "BC", date = "2021-03-31")
#> No encoding supplied: defaulting to UTF-8.
#>   cases cumulative_cases       date province
#> 1  1013           100048 2020-03-31       BC
```

### Obtain the number of new reported deaths on a particular date in British Columbia using get_deaths():

-   `get_deaths` Query reported deaths with ability to specify
    location grouping and date range of returned data.

``` r
get_deaths(loc = "BC", date = "2021-03-31")
#> No encoding supplied: defaulting to UTF-8.
#>   cumulative_deaths       date deaths province
#> 1              1458 2020-03-31      3       BC
```

### Obtain the number of new reported recoveries on a particular date in British Columbia using get_recoveries():

-   `get_recoveries` Query reported recoveries with ability to specify
    location grouping and date range of returned data.

``` r
get_recoveries(loc = "BC", date = "2021-03-31")
#> No encoding supplied: defaulting to UTF-8.
#>   cumulative_recoveries date recoveries province
#> 1                  1458 2020-03-31      3       BC
```

### Obtain the number of new reported vaccinations on a particular date in British Columbia using get_vaccinations():

-   `get_veccinations` Query reported vaccinations with ability to specify
    location grouping and date range of returned data.

``` r
get_vaccinations(loc = "BC", date = "2021-03-31")
#> No encoding supplied: defaulting to UTF-8.
#>   cumulative_cvaccine cvaccine       date province
#> 1               87351       32 2020-03-31       BC
```


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

`canadacovidmetrics` was created by the Contributors. The dependant API
from the COVID-19 Canada Open Data Working Group dataset project has
adopted the [Creative Commons Attribution 4.0
International](https://creativecommons.org/licenses/by/4.0/) license,
which allows freedom of two primary contributions:

**Sharing** — copy and redistribute the material in any medium or format
**Adapting** — remix, transform, and build upon the material for any
purpose, even commercially.

As contributors to this community, our package has adopted the same
creative commons license, in order to enable anyone to share or adapt
the Canada Covid Metrics package in R or Python subject to the license.
