
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
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
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
`~/Library/BitBar/Plugins` but you can pick any directory; just make
sure it isn’t one with a gazillion files as that impacts BitBar’s
performance).

## What’s Inside The Tin

The following functions are implemented:

  - `add_entry`: Add an entry to the menu
  - `applescript`: Execute AppleScript and Return Results
  - `b64_image`: Return a base64 encoded string of an image (local
    filesystem or URL)
  - `bitbar_plugins_dir`: BitBar plugins directory
  - `new_bitbar_script`: Helper to get started with a new BitBar bitbar
    script
  - `open_bitbar_dir`: Open BitBar Plugins Directory in the Finder
  - `r_logo_small`: Images that come with the package
  - `reachable`: Is the internet accessible?

There are also two RStudio Addins, one with a GUI for entering in the
script metadata & starting a new BitBar {bitbar} script and one for
opening up the BitBar plugins directory in the Finder.

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/bitbar.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/bitbar")
# or
remotes::install_gitlab("hrbrmstr/bitbar")
# or
remotes::install_bitbucket("hrbrmstr/bitbar")
# or
remotes::install_github("hrbrmstr/bitbar")
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
  description = "Example BitBar Script"
)
```

## bitbar Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       12 | 0.92 | 221 | 0.94 |          63 | 0.73 |      122 | 0.75 |
| Rmd  |        1 | 0.08 |  13 | 0.06 |          23 | 0.27 |       41 | 0.25 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
