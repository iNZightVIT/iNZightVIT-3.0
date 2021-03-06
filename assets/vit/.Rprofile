## START VIT

# Things you might want to change

# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# set the default help type
# options(help_type="text")
options(help_type="html") ##, warn = -1)

# set a site library
# .Library.site <- file.path(chartr("\\", "/", R.home()), "site-library")

# set a CRAN mirror
# local({r <- getOption("repos")
#       r["CRAN"] <- "http://my.local.cran"
#       options(repos=r)})


# setting CRAN mirror to UoA
local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
  options(repos = r)
})

# Need to set the working directory back to iNZightVIT folder:
setwd("../../")

# Sometimes we have the case where packages can't be found,
# this could be due to R_HOME being in the wrong place (i.e.
# current dir instead of proper R_HOME dir). To counteract this,
# we set the R_HOME along with the libPath.
Sys.setenv("R_HOME" = file.path(getwd(), "prog_files"))
.libPaths(file.path(getwd(), "prog_files", "library"))


# Loading a splash screen in the case where we're minimising VIT
# Suppressing messages and warnings so that the console remains clean
# Any 'built under different version' warnings should be safely ignored
# suppressPackageStartupMessages({
#     library(grDevices)
#     library(graphics)
#     library(grid)
#     suppressWarnings({
#         library(png)
#     })
# })

grDevices::dev.new(width = 5, height = 2)
grid::grid.newpage()
# Will try to draw a raster if possible, otherwise an array of pixels
splashImg <- png::readPNG(system.file("images", "inzightvit-splash.png", package = "vit"), exists("rasterImage"))
grid::grid.raster(splashImg, width = grid::unit(3.5, "inches"), height = grid::unit(2, "inches"))

message("(Dept of Statistics, Uni. of Auckland)")
message("")
message("Please wait while iNZightVIT loads...")

suppressWarnings({
    library(vit)
})

# Killing the splash screen, assigning to remove print
tmp <- grDevices::dev.off()
rm(tmp)

# Let's go!
iNZightVIT(disposeR = TRUE)
# the `disposeR = TRUE` makes sure when a user closes iNZight, they
# close the entire R session (but not if they open it through R!)
