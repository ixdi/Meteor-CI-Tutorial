---
.left-column[
  ### Create a Meteor Package
.footnote[.red.bold[] [Table of Contents](./)] 
<!-- H -->]
.right-column[
~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ - o 0 o - ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

#### Create a Meteor package.

If you aim for "package only applications", if packages are to be reusable, your packages need independent version control, and hence a directory outside of the project, located by Meteor's shell variable ```PACKAGE_DIRS```.

To create self-sufficient packages, begin by defining it as a permanent fixture of your user profile, pointing to the place where you will keep your packages.
##### Commands
```terminal
export PACKAGES=~/projects/packages;
export PACKAGE_DIRS=${PACKAGES}/somebodyelse:${PACKAGES}/yourself;
mkdir -p ${PACKAGES}/yourself; mkdir -p ${PACKAGES}/somebodyelse;
export HAS_PACKAGE_DIRS=$(grep PACKAGE_DIRS ~/.profile | grep -c ${PACKAGES} ~/.profile);
[[ ${HAS_PACKAGE_DIRS} -lt 1 ]] && echo -e "\n#\nexport PACKAGE_DIRS=${PACKAGE_DIRS}" >> ~/.profile;
source ~/.profile;
```
Continued . . . 
<!-- Code for this begins at line #278-->
<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Step02_UnitTestThePackage.sh#L259" target="_blank">Code for this step.</a>] ]
]