---
.left-column[
  ### Install Selenium Web Driver
.footnote[.red.bold[] [Table of Contents](./)] 
<!-- H -->]
.right-column[
~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ - o 0 o - ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

#### Install Google Chrome and the Selenium Web Driver for Chrome.

<a href='http://nightwatchjs.org/' target='_blank'>Nightwatch</a> leverages <a href='http://www.seleniumhq.org/' target='_blank'>Selenium</a>, which has drivers for the major browsers.

The <a href='https://code.google.com/p/selenium/wiki/ChromeDriver' target='_blank'>Chrome Driver</a> is the most convenient.  **Note**: This is not the Selenium Webdriver for NodeJS installed in the previous step.
##### Commands
```terminal
wget http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
unzip -o chromedriver_linux64.zip -d /usr/local/bin
chmod a+rx /usr/local/bin/chromedriver
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
```

<!-- Code for this begins at line #107 -->
<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Part01_PrepareTheMachine.sh#L107" target="_blank">Code for this step.</a>] ]
]