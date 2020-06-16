
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/bitbar.svg?branch=master)](https://travis-ci.org/hrbrmstr/bitbar)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.5.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# bitbar

Craft macOS Menu Bar Applications with Rscript

## Description

Mat Ryer’s macOS utility <https://getbitbar.com/> enables any script to
become a menu bar application. Tools are provided to make it easier to
craft these scripts.

## Installing BitBar

If you have [homebrew](https://brew.sh/) installed, you can do:

``` shell
brew cask install bitbar
```

Otherwise [grab the latest
release](https://github.com/matryer/bitbar/releases/latest) and install
it the hard way.

Open the application and choose the directory you want to be your
plugins directory. This is where your menubar scripts will go. (I use
`~/Library/Application Support/BitBar/Plugins` but you can pick any
directory; just make sure it isn’t one with a gazillion files as that
impacts BitBar’s performance).

## What’s Inside The Tin

The following functions are implemented:

  - `add_entry`: Add an entry to the menu
  - `bitbar_plugins_dir`: BitBar plugins directory
  - `new_bitbar_script`: Helper to get started with a new BitBar bitbar
    script

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/bitbar.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/bitbar")
# or
remotes::install_gitlab("hrbrmstr/bitbar")
# or
remotes::install_bitbucket("hrbrmstr/bitbar")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(bitbar)

# current version
packageVersion("bitbar")
## [1] '0.1.0'
```

This will open up a `my-awesome-bitbar-script.R` in RStudio (if
available) or whatever editor `file.edit()` is configured to use.

``` r
new_bitbar_script(
  save_as = file.path(bitbar_plugins_dir(), "my-awesome-bitbar-script.R"),
  title = ":blue_heart:",
  description = "Example BitBar Script")
)
```

## bitbar Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        7 | 0.88 |  96 | 0.88 |          29 | 0.57 |       68 | 0.63 |
| Rmd  |        1 | 0.12 |  13 | 0.12 |          22 | 0.43 |       40 | 0.37 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
