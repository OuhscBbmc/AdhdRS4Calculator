#This code checks the user's installed packages against the packages listed in `./UtilityScripts/PackageDependencyList.csv`.
#   These are necessary for the repository's R code to be fully operational. 
#   CRAN packages are installed only if they're not already; then they're updated if available.
#   GitHub packages are installed regardless if they're already installed.
#If anyone encounters a package that should be on there, please add it to `./UtilityScripts/PackageDependencyList.csv`

#Clear memory from previous runs.
base::rm(list=base::ls(all=TRUE))

#####################################
## @knitr DeclareGlobals
path_csv <- './utility_scripts/package_dependency_list.csv'

if( !file.exists(path_csv)) 
  base::stop("The path `", path_csv, "` was not found.  Make sure the working directory is set to the root of the repository.")
#####################################
## @knitr LoadDatasets
ds_packages <- utils::read.csv(file=path_csv, stringsAsFactors=FALSE)

rm(path_csv)
#####################################
## @knitr TweakDatasets
ds_install_from_cran <- ds_packages[ds_packages$Install & ds_packages$OnCran, ]
ds_install_from_github <- ds_packages[ds_packages$Install & nchar(ds_packages$GitHubUsername)>0, ]

rm(ds_packages)
#####################################
## @knitr InstallCranPackages
for( packageName in ds_install_from_cran$PackageName ) {
  available <- base::require(packageName, character.only=TRUE) #Loads the packages, and indicates if it's available
  if( !available ) {
    utils::install.packages(packageName, dependencies=TRUE)
    base::require( packageName, character.only=TRUE)
  }
}
rm(ds_install_from_cran, packageName, available)
#####################################
## @knitr UpdateCranPackages
utils::update.packages(ask=FALSE, checkBuilt=TRUE)

#####################################
## @knitr InstallDevtools
# Installing the devtools package is different than the rest of the packages.  On Windows,
#   the dll can't be overwritten while in use.  This function avoids that issue.
# This should follow the initial CRAN installation of `devtools`.  
#   Installing the newest GitHub devtools version isn't always necessary, but it usually helps.

download_location <- "./devtools.zip" #This is the default value.
devtools::build_github_devtools(download_location) 

base::unlink(download_location, recursive=FALSE) #Remove the file from disk.
base::rm(download_location)
#####################################
## @knitr InstallGitHubPackages

for( i in base::seq_len(base::nrow(ds_install_from_github)) ) {
  repository_name <- ds_install_from_github[i, "PackageName"]
  username <- ds_install_from_github[i, "GitHubUsername"]
  devtools::install_github(repo=repository_name, username=username)
}

base::rm(ds_install_from_github, repository_name, username, i)

#There will be a warning message for every  package that's called but not installed.  It will look like:
#    Warning message:
#        In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
#        there is no package called 'bootstrap'
#If you see the message (either in here or in another piece of the project's code),
#   then run this again to make sure everything is installed.  You shouldn't get a warning again.
