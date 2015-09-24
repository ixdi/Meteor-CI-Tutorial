---
.left-column[
  ### Selenium Web Driver for NodeJS
.footnote[.red.bold[] [Table of Contents](./)] 
<!-- H -->]
.right-column[
~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ - o 0 o - ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

#### Install 'selenium-webdriver' in NodeJS

The <a href='https://nodejs.org/' target='_blank'>NodeJS</a> module <a href='https://github.com/SeleniumHQ/selenium' target='_blank'>Selenium Webdriver</a> is required for running Meteor TinyTest on the command line, rather than in a browser.  **Note**: The next step after this one installs a different Selenium driver.

We must first ensure that root has not taken ownership of the local .npm directory *(that can happen if you ran npm with sudo when you didn't need to)*.
##### Commands
```terminal
sudo chown -R ${USER}:${USER} ~/.npm
npm install -y --prefix ${HOME} selenium-webdriver
```


<!-- Code for this begins at line #95 -->
<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Part01_PrepareTheMachine.sh#L95" target="_blank">Code for this step.</a>] ]
]