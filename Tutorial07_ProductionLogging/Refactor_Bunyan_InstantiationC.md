---
last_update: 2016-02-13
 .left-column[
  ### Refactor Bunyan (C)
  <br /><br /><div class='input_type_indicator'><img src='./fragments/loader.png' /><br />No manual input required here.</div><br />
.footnote[.red.bold[] [
Table of Contents](./toc.html)
<br />
<br />&nbsp; &nbsp;Last update
<br />&nbsp; &nbsp; {{ last_update  }}
]
<!-- H -->]
.right-column[
~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ - o 0 o - ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

#### Refactor Bunyan Instantiation (Part C)

In ```package.js```, in ∗∗both∗∗ the ```onUse``` ∗∗and∗∗ the ```onTest``` sections, the "api" must add ```logger.js``` and export ```Logger```.
```javascript
Package.onUse(function(api) {
       :
  api.addFiles(['logger.js', '${PKG_NAME}.js'], ['server']);
  api.export('Logger');
});
Package.onTest(function(api) {
       :
  api.addFiles(['logger.js', '${PKG_NAME}-tests.js'], ['server']);
  api.export('Logger');
});
```
Rerun the tests with ```meteor --settings settings.json test-packages``` while watching the ```tail``` of the log file.
```terminal
tail -f /var/log/meteor/ci4meteor.log | bunyan -o short
```


<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Tutorial07_ProductionLogging/ProductionLogging_functions.sh#L30" target="_blank">Code for this step.</a>] ]
]
