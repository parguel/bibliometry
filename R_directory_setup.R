
# initialisation of directory

getwd()

# create folders
dir.create("./data")
dir.create("./R")
dir.create("./text")
dir.create("./output")
dir.create("./output/text")
dir.create("./output/plots")

# create empty files
file.create("make.R")
file.create("./R/packages.R")
file.create("./R/functions.R")
# file.create("./R/plan.R")
file.create("./R/exploration_script.R")
file.create("./text/report.Rmd")


#git stuff
library(usethis)
use_git(message = "inital bear commit")




