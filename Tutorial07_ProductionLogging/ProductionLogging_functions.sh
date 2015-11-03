function Refactor_Bunyan_InstantiationA() {

  pushd ~/${PARENT_DIR}/${PROJECT_NAME}/packages/${PKG_NAME} >/dev/null;

  wget -O logger.js https://raw.githubusercontent.com/martinhbramwell/Meteor-CI-Tutorial/master/fragments/logger.js
  sed -i -e "s/\${PKG_NAME}/${PKG_NAME}/" logger.js

  popd >/dev/null;

}

function Package_Upgrade_and_Project_Rebuild_A() {

  pushd ~/${PARENT_DIR}/${PROJECT_NAME} >/dev/null;

  killMeteorProcess
  launchMeteorProcess "http://localhost:3000/"  "test-packages"
  sleep 10
  echo "The 'tail' command shows . . . "
  tail -n 9 /var/log/meteor/ci4meteor.log  | bunyan -o short
  echo ". . . the tail end of log file.\n"

  popd >/dev/null;

  killMeteorProcess
  read -p "To continue hit <enter> ::  " -n 1 -r USER_ANSWER

}

function Package_Upgrade_and_Project_Rebuild_B() {

  killMeteorProcess

  pushd ~/${PARENT_DIR}/${PROJECT_NAME} >/dev/null;
  pushd ./packages/${PKG_NAME} >/dev/null;


  touch .gitignore;
  [[ $(grep -c ".npm" .gitignore) -lt 1 ]] && echo ".npm" >> .gitignore;
  git add .gitignore;
  git add logger.js;
  sed -i -r 's/(.*)(version: .)([0-9]+\.[0-9]+\.)([0-9]+)(.*)/echo "\1\2\3$((\4+1))\5"/ge' package.js;
  git commit -am 'add logging';
  git push;

  popd >/dev/null;

  meteor list;
  git commit -am 'added logging to ${PKG_NAME}';
  git push;

  popd >/dev/null;

}