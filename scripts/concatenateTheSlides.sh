#!/bin/bash
#

source ./scripts/manageShellVars.sh;
source ./scripts/util.sh;

collectSectionNames;

declare -a TUTSPATHS=();
declare -a FILEPATHS=();
function assembleMapsOfDirectoryAndFileNames() {

  IDX=0;
  for section in "${TUTORIAL_SECTIONS[@]}"; do

    IDX=$(( ${IDX} + 1));

    printf -v PT "Tutorial%02d_|%s|" "${IDX}" "${section}";
    printf -v TUTSPATH "Tutorial%02d_%s" "${IDX}" "${section}";
    printf -v SECTION_SCRIPT_FILE_NAME "Tutorial%02d_%s.sh" "${IDX}" "${section}";


    TUTSPATHS+=(${TUTSPATH});
    while read -r line; do
      FN=$(echo "${line}" | sed 's/\.md.*/.md/g');
      FN=$(echo "${FN}" | sed 's/.*BINDIR}\///g');
      FN=$(echo "${FN}" | sed 's/.md//g');
      # echo -e "Processing the file :: ${PT}${FN}\n";
      # ls -l ${PT}/${FN}.*;
      FILEPATHS+=("${PT}${FN}");
    done < <(grep -E 'explain.*BINDIR|BINDIR.*explain'  ${SECTION_SCRIPT_FILE_NAME})
  done

}

function deleteAllPreviouslyConcatenatedMarkdownFiles() {
  for idx_d in "${TUTSPATHS[@]}"
  do
    # ls -l ${idx_d}/concatenatedSlides.MD;
    rm -f ${idx_d}/concatenatedSlides.MD;
  done

}


function applyStatusUpdate() {

  OLD=".*last_update:.*";
  NEW="$(git log --date=short --pretty=format:"last_update: %cd" -n1 -- $1)";
  # export BAAAC=$(echo ${1} | grep -c BuildAndroidAPK_A);
  # if [[ $BAAAC -gt 0 ]]; then echo "|${OLD}|${NEW}|"; fi;
  sed -i $"s|${OLD}|${NEW}|" $1;

};




function applyManualVsAutomaticIndicator() {

  NON_ANIMATED=${1};
  IMAGE_TYPE="gif";
  if [[ "${NON_ANIMATED}" == "true" ]]; then IMAGE_TYPE="png"; fi;

  SKIP_INTRO="Introduction.md";
  SKIP_END="Fin.md";
  if [ "${AFP/${SKIP_INTRO}}" = "${AFP}" ] ; then
    if [ "${AFP/${SKIP_END}}" = "${AFP}" ] ; then
      LNUM=$(grep -nr "${FPA[2]}.*MANUAL_INPUT_REQUIRED" ${SCRIPT_FILE}  | cut -d : -f 1);
      PATTERN='input_type_indicator';
      if [[ "${LNUM}" -gt 0 ]]; then
        REPLACEMENT="  <br \/><br \/><div class='input_type_indicator'><img src='.\/fragments\/typer.${IMAGE_TYPE}' \/><br \/>Manual input is required here.<\/div><br \/>";
        # REPLACEMENT='  <br \/><br \/><div class="input_type_indicator"><img src=".\/fragments\/typer.${IMAGE_TYPE}" \/><br \/>Manual input is required here.<\/div><br \/>';

#        REPLACEMENT='Manual input'
      else
        REPLACEMENT="  <br \/><br \/><div class='input_type_indicator'><img src='.\/fragments\/loader.${IMAGE_TYPE}' \/><br \/>No manual input required here.<\/div><br \/>";
        # REPLACEMENT='  <br \/><br \/><div class="input_type_indicator"><img src=".\/fragments\/loader.${IMAGE_TYPE}" \/><br \/>No manual input required here.<\/div><br \/>';

#        REPLACEMENT='No manual input'
      fi
      sed -i "s/.*${PATTERN}.*/${REPLACEMENT}/g" ${AFP};
#      echo "${AFP} does ${REPLACEMENT}"
    fi
  fi

}

function substituteFieldsInSlide() {

  FUNCTIONS_FILE="${SCRIPT_FILE_NAME}/${FPA[1]}_functions.sh";
#  FUNCTIONS_FILE="${FPA[0]}${FPA[1]}/${FPA[1]}_functions.sh";
#  ls -l ${FUNCTIONS_FILE};
  readarray -t LNUMS <<<"$(grep -nr ${FPA[2]} ${FUNCTIONS_FILE}  | cut -d : -f 1)"
#  echo "FPA :: |- ${FPA[0]} -|- ${FPA[1]} -|- ${FPA[2]} -|- ${LNUMS[0]} -|";
  LNUM=${LNUMS[0]};
  if [[ "${LNUM}" -gt 0 ]]; then

    DBGLOG=false;
    if [[ "${FPA[1]}" == "RealWorldPackage" && "${LNUM}" -lt 0  || "${LNUM}" -eq -1 ]]; then
      DBGLOG=true;
    fi;

    ${DBGLOG} && echo -e "\n\n ${FUNCTIONS_FILE}, Line number : ${LNUM}":

    export PATTERN='<!-- B -->]';
    ${DBGLOG} && echo "Old : ${PATTERN}";
    export CODE_URL="${GITHUB_DIR}${FUNCTIONS_FILE}#L${LNUM}";
    export REPLACEMENT='<!-- B -->';
    REPLACEMENT+='\n.center[.footnote[.red.bold[] <a href="';
    REPLACEMENT+="${CODE_URL}";
    REPLACEMENT+='" target="_blank">Code for this step.</a>] ]';
    REPLACEMENT+='\n]';

    ${DBGLOG} && echo "New : ${REPLACEMENT}";
    ${DBGLOG} && ls -l "${AFP}";
    ${DBGLOG} && echo "# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";

    sed -i "0,/${PATTERN}/s|${PATTERN}|${REPLACEMENT}|" ${AFP};

#    sed -i "0,/<!-- B -->]/s|<!-- B -->]|<!-- B -->\n***\n]|" Tutorial02_VersionControlInTheCloud/Create_local_GitHub_repository.md

    export PATTERN='#L[0-9]*'
#    echo "Old : ${PATTERN}"
    export REPLACEMENT="#L${LNUM}"
    ${DBGLOG} && echo "New : ${REPLACEMENT}"
    sed -i "0,/${PATTERN}/s|${PATTERN}|${REPLACEMENT}|" ${AFP}

  fi;


}

makeJavaScriptSectionList;
assembleMapsOfDirectoryAndFileNames;

# echo ${TUTSPATHS};
# exit;

SKIP=true;
if [[ "X$1X" == "XyX" ]]; then
  SKIP=false;
elif [[ "X$1X" != "XnX" ]]; then
  echo -e ""
  echo -e "Usage : "
  echo -e " - '$0 y' generate documentation and commit to gh-pages branch"
  echo -e " - '$0 n' generate documentation only"
  echo -e ""
  echo -e "Hit '<enter>' to generate documentation without commit"
  echo -e "Hit 'y' now to generate documentation and commit to gh-pages branch"
  echo -e "Hit 'q' to quit"
  read -p " 'y', 'q' or '<enter>' ::  " -n 1 -r USER_ANSWER
  CHOICE=$(echo ${USER_ANSWER:0:1} | tr '[:upper:]' '[:lower:]')
  echo ""
  if [ "X${CHOICE}X" == "XqX" ]; then exit 0; fi;
  if [ "X${CHOICE}X" == "XyX" ]; then SKIP=false; fi;
fi;

deleteAllPreviouslyConcatenatedMarkdownFiles;

#
# Process all markdown documents extracting just what a script user needs to see
#
# CURRENT_BRANCH_OF_GIT=$(git rev-parse --abbrev-ref HEAD);
CURRENT_BRANCH_OF_GIT="master";
printf -v GITHUB_DIR "https://github.com/martinhbramwell/Meteor-CI-Tutorial/blob/%s/" ${CURRENT_BRANCH_OF_GIT};
printf "
   We're building for the %s branch of the repository.\n\n" ${CURRENT_BRANCH_OF_GIT};

IS_REPO=$(ls -la | grep -c ".git");

for idx_d in "${FILEPATHS[@]}"
do
  FP="${idx_d}";
  FPA=(${FP//|/ });
#  getFileStatus ${FPA[0]}${FPA[1]}/${FPA[2]}.md;
#  echo "FPA :: |- ${FPA[0]} -|- ${FPA[1]} -|- ${FPA[2]}";
  AFP="${FPA[0]}${FPA[1]}/${FPA[2]}.md"; # The complete path of the markdown file.
#  ls -l ${AFP};

  SCRIPT_FILE_NAME="${FPA[0]}${FPA[1]}";
  SCRIPT_FILE="${SCRIPT_FILE_NAME}.sh" # The name of the end user script
#  ls -l ${SCRIPT_FILE};
  # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # #    Find line number of relevant code and add hyperlink at bottom of slide
  # #    Expect a flag "CODEBLOCK", otherwise skip this file, and check the next one..
  LCNT=$(grep -cr "${FPA[2]}.*CODE_BLOCK" ${SCRIPT_FILE});
  case "${LCNT}" in

  0)  # echo  "Slide with no code.";
      ;;
  2)  echo -e "\n\n\n    ${flashingRed}* * * * You have duplicate calls to explain * * * *${endColor} \n\n\n.";
      exit;
      ;;
  1)  # echo  "Slide with fields to substitute.";
      substituteFieldsInSlide ;
      ;;
  *) echo "This can't happen!"
     ;;
  esac

  applyManualVsAutomaticIndicator ${SKIP};
  if [[ ${IS_REPO} -gt 1 ]]; then applyStatusUpdate ${FPA[0]}${FPA[1]}/${FPA[2]}.md; fi;


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#        Append to slide show file replacing fake asterisks with real asterisks
  cat ${AFP} | sed 's/∗/*/g' >> ${FPA[0]}${FPA[1]}/concatenatedSlides.MD
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

done


if  ${SKIP} ;  then
  echo "  - o 0 o - ";
  ##  touch -t 1212121212  ./Tutorial01_PrepareTheMachine/Java_7_is_required_by_Nightwatch.md;
  ##  ls -l ./Tutorial01_PrepareTheMachine/Java_7_is_required_by_Nightwatch.md;
  exit 0;
fi;  #  Exit if we aren't going to commit to gh-pages branch

git log -1 --pretty=%B > gitlog.txt # Save the most recent commit message, so gh-pages branch can commit with the same.

# Add all the supporting files to the list of filesForGHPages.txt
  cat << fFGHPtxt > filesForGHPages.txt
index.html
toc.html
styles.css
gitlog.txt
scripts/tutorial_sections.js
scripts/Live.js
fragments/typer.gif
fragments/loader.gif
fragments/favicons.zip
fragments/passing.svg
fragments/failing.svg
fragments/ContinuousDeliveryWorkFlow.png
assets/css/main.css
assets/css/responsive.css
assets/extras/animate.css
assets/img/circle-logo-horizontal.svg
assets/img/ClockMan.png
assets/img/ContinuousDeployment.svg
assets/img/docker.svg
assets/img/eslint.svg
assets/img/GitHub_Logo.svg
assets/img/meteor-logo.svg
assets/img/nightwatch-logo.png
assets/img/Node.js_logo.svg
assets/img/swagger-logo.png
assets/js/smooth-scroll.js
assets/icons/android-chrome-144x144.png
assets/icons/android-chrome-72x72.png
assets/icons/apple-touch-icon-144x144.png
assets/icons/apple-touch-icon-60x60.png
assets/icons/apple-touch-icon-precomposed.png
assets/icons/favicon-32x32.png
assets/icons/mstile-144x144.png
assets/icons/mstile-70x70.png
assets/icons/android-chrome-192x192.png
assets/icons/android-chrome-96x96.png
assets/icons/apple-touch-icon-152x152.png
assets/icons/apple-touch-icon-72x72.png
assets/icons/browserconfig.xml
assets/icons/favicon-96x96.png
assets/icons/mstile-150x150.png
assets/icons/safari-pinned-tab.svg
assets/icons/android-chrome-36x36.png
assets/icons/apple-touch-icon-114x114.png
assets/icons/apple-touch-icon-180x180.png
assets/icons/apple-touch-icon-76x76.png
assets/icons/favicon-16x16.png
assets/icons/favicon.ico
assets/icons/mstile-310x150.png
assets/icons/android-chrome-48x48.png
assets/icons/apple-touch-icon-120x120.png
assets/icons/apple-touch-icon-57x57.png
assets/icons/apple-touch-icon.png
assets/icons/favicon-194x194.png
assets/icons/manifest.json
assets/icons/mstile-310x310.png
fFGHPtxt

# Add all the concatenated slides to the list of filesForGHPages.txt
for idx_t in "${TUTSPATHS[@]}"; do echo ${idx_t}/concatenatedSlides.MD >> filesForGHPages.txt; done;

# cat filesForGHPages.txt;

tar zcvf filesForGHPages.tar.gz -T filesForGHPages.txt;
rm filesForGHPages.txt;

eval "$(ssh-agent -s)";

export STASH_CREATED=$(git stash) && echo $STASH_CREATED
if [[ "${STASH_CREATED}" != "No local changes to save" ]];
then
  echo ""
  echo "Changes to master branch have been stashed"
fi;
git checkout gh-pages
git branch;
echo "- - - switched branch - - -";

tar zxvf filesForGHPages.tar.gz
rm -f filesForGHPages.tar.gz
unzip -o ./fragments/favicons.zip
rm ./fragments/favicons.zip

MSG=$(cat gitlog.txt)
echo "Add anything new"
git add .
echo "Unpacked all."
git commit -am "${MSG}"
echo "Committed"
git push
echo "Pushed"
git checkout master
git branch;
echo "- - - switched branch - - -";

if [[ "${STASH_CREATED}" != "No local changes to save" ]];
then
  git stash apply;
  echo "Reverted stash"
else
  echo "No stash to restore";
fi;



