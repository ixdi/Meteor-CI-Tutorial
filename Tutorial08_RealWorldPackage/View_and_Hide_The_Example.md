---
last_update: 2016-02-09
 .left-column[
  ### Control Example Visibility
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

#### Usage Example Should be Disabled by Default

... continuing.

If now, you start up Meteor again, and open the main page (localhost:3000) in a browser, there should be a new section with a button to click through a couple of imaginary pets.  See the *Hover Note* below.

Of course, left like that, our package will impose itself on the main page of  every Meteor application to which it's added.  Fortunately, it is easy to disable -- just comment out the declaration in ```package.js``` :
```javascript
       :
  // api.addFiles(['usage_example.html', 'usage_example.js' ], ['client']);
});
```

Continues ...

<!-- B -->
.center[.footnote[.red.bold[] <a href="https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/master/Tutorial08_RealWorldPackage/RealWorldPackage_functions.sh#L103" target="_blank">Code for this step.</a>] ]

<div id="usage" class="popup_div">
    <a class="subtle_a" onmouseover="HideContent('usage'); return true;"
       href="javascript:HideContent('usage')"><h2>Pet Store Package : Usage Example</h2>
  <button id="nextPet">See Next Pet</button>
  <p id="petNote">Pet #6133627029 is "At last, a 'stay small' family crocodile.".</p>
    </a>
</div>
<a
    class="hover_text"
    onmouseover="ReverseContentDisplay('usage'); return true;"
    href="javascript:ReverseContentDisplay('usage')">
    <i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Hover Note</i>
</a>

]
