---
last_update: 2016-02-09
 .left-column[
  ### Another NodeJS Module (B)
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

#### Let's Add a More Interesting Module (Part B)

... continuing.

Ideally, we should test against our own Swagger compliant REST API, but for simplicity sake we'll exploit Swagger's free on-line test/demo service.

Swagger wipes all anonymous user data on their public server every 24 hours.  To ensure consistent results we use a script <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/tree/master/fragments/reloadSwaggerPetStore.sh" target="_blank">reloadSwaggerPetStore.sh</a> to write a few records to an out of the way location.  This will meet our continuous deployment needs, so long as the service has tolerable uptime.

##### Example Commands
```terminal
wget https://raw.githubusercontent.com/martinhbramwell/Meteor-CI-Tutorial/master/fragments/reloadSwaggerPetStore.sh
chmod a+x reloadSwaggerPetStore.sh
```
Continues ...


<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Tutorial08_RealWorldPackage/RealWorldPackage_functions.sh#L2" target="_blank">Code for this step.</a>] ]
]
