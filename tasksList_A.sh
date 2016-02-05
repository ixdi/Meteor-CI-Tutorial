#!/bin/bash
#
export arrFunctionDefinitions=(

  "14|D|p|"
  "13|C|l|"
  "14|D|n|"
  "14|D|m|"
  "01|PrepareTheMachine|Java_7_is_required_by_Nightwatch_A|Got Java Installer|, but [ci skip].|"
  "01|PrepareTheMachine|This_tutorial_expects_to_use_the_Sublime_Text_3_editor_A|Got Sublime Text 3 Installer|, but [ci skip].|"
  "01|PrepareTheMachine|Install_NodeJS|NodeJS has been installed|, but [ci skip].|"
  "01|PrepareTheMachine|Java_7_is_required_by_Nightwatch_B|Java has been installed|, but [ci skip].|"
  "01|PrepareTheMachine|Ready_for_Android_Studio|Verified ready for Android Studio.|, but [ci skip].|"
  "01|PrepareTheMachine|Install_Selenium_Webdriver_In_NodeJS|Install Selenium Webdriver In NodeJS|, but [ci skip].|"
  "01|PrepareTheMachine|Install_Google_Chrome_and_the_Selenium_Web_Driver_for_Chrome|Installed Google Chrome and the Selenium Web Driver for Chrome|, but [ci skip].|"
  "01|PrepareTheMachine|Install_Bunyan_Globally|Installed Bunyan Globally|, but [ci skip].|"
  "01|PrepareTheMachine|This_tutorial_expects_to_use_the_Sublime_Text_3_editor_B|Prepared the Sublime Text editor|, but [ci skip].|"
  "01|PrepareTheMachine|Install_eslint|Installed ESLint|, but [ci skip].|"
  "01|PrepareTheMachine|Install_jsdoc|Installed JSDoc|, but [ci skip].|"
  "01|PrepareTheMachine|EnforceOwnershipAndPermissions|Enforced Ownership and Permissions|, but [ci skip].|"
  "02|VersionControlInTheCloud|Install_Meteor_NonStop|Installed Meteor|, but [ci skip].|"
  "02|VersionControlInTheCloud|Create_GitHub_Repo_Deploy_Keys_for_Project|Created GitHub Repo Deploy Keys for '${PROJECT_NAME}'?|, but [ci skip].|"
  "02|VersionControlInTheCloud|Create_GitHub_Repo_For_Project|Created GitHub Repo For '${PROJECT_NAME}'|, but [ci skip].|"
  "02|VersionControlInTheCloud|Add_GitHub_Repo_Deploy_Key_For_Project|Added GitHub Repo Deploy Key for '${PROJECT_NAME}'|, but [ci skip].|"
  "02|VersionControlInTheCloud|Create_Meteor_project|Created Meteor project '${PROJECT_NAME}'|, but [ci skip].|"
  "02|VersionControlInTheCloud|Add_Meteor_application_development_support_files|Added Meteor application development support files|, but [ci skip].|"
  "02|VersionControlInTheCloud|Create_local_GitHub_repository_nonstop|Created local GitHub repository for '${PROJECT_NAME}'|, but [ci skip].|"
  "03|UnitTestAPackage|Create_a_package_A|Created package '${PKG_NAME}': (A)|, but [ci skip].|"
  "03|UnitTestAPackage|Create_a_package_B|Created package '${PKG_NAME}' : (B)|, but [ci skip].|"
  "03|UnitTestAPackage|Create_a_package_C|Created package '${PKG_NAME}' : (C)|, but [ci skip].|"
  "03|UnitTestAPackage|Create_GitHub_Repo_Deploy_Keys_for_Package|Created GitHub Repo Deploy Keys for '${PKG_NAME}'|, but [ci skip].|"
  "03|UnitTestAPackage|Create_GitHub_Repo_For_Package|Created GitHub Repo for '${PKG_NAME}'|, but [ci skip].|"
  "03|UnitTestAPackage|Add_GitHub_Repo_Deploy_Key_For_Package|Added GitHub Repo Deploy Key for '${PKG_NAME}' |, but [ci skip].|"
  "03|UnitTestAPackage|Control_a_packages_versions_B_nonstop|Controlled '${PKG_NAME}' package's versions : B|, but [ci skip].|"
  "03|UnitTestAPackage|Add_a_test_runner_for_getting_TinyTest_output_on_the_command_line_nonstop|Added a test runner for getting TinyTest output on the command line. : B|, but [ci skip].|"
  "04|CodingStyleAndLinting|Customize_ESLint_in_Sublime_Text|Customized ESLint in Sublime Text. : |, but [ci skip].|"
  "04|CodingStyleAndLinting|Correct_the_indicated_code_quality_defects|Corrected the indicated code-quality defects. : |, but [ci skip].|"
  "04|CodingStyleAndLinting|Ignore_Some_Files|Marked some files to be ignored. : |, but [ci skip].|"
  "04|CodingStyleAndLinting|Try_ESLint_Command_Line_Again|Reran linting. : |, but [ci skip].|"
  "05|AutomaticDocumentationInTheCloud|Try_jsDoc_from_the_Command_Line_A|Ran jsDoc against ./packages/${PKG_NAME}|, but [ci skip].|"
  "05|AutomaticDocumentationInTheCloud|Use_Sublime_Text_jsDoc_plugin_A|Patched ./packages/${PKG_NAME}/${PKG_NAME}-tests.js for slide 5|, but [ci skip].|"
  "05|AutomaticDocumentationInTheCloud|Use_Sublime_Text_jsDoc_plugin_B|Patched ./packages/${PKG_NAME}/${PKG_NAME}-tests.js for slide 6|, but [ci skip].|"
  "05|AutomaticDocumentationInTheCloud|Use_Sublime_Text_jsDoc_plugin_C|Rebuilt documentation after patches|, but [ci skip].|"
  "05|AutomaticDocumentationInTheCloud|Publish_jsDocs_toGitHub_B|Published documentation to GitHub pages|, but [ci skip].|"
  "06|CloudContinuousIntegration|Connect_CircleCI_to_GitHub_B|Verified CircleCI tokens|, but [ci skip].|"
  "06|CloudContinuousIntegration|Add_a_CircleCI_configuration_file_and_push_to_GitHub_nonstop|Added a CircleCI configuration file and push to GitHub|, but [ci skip].|"
  "06|CloudContinuousIntegration|Amend_the_configuration_and_push_again_nonstop|Amended the configuration and push again|, but [ci skip].|"
  "06|CloudContinuousIntegration|Prepare_for_NightWatch_testing|Prepared for NightWatch testing|, but [ci skip].|"
  "06|CloudContinuousIntegration|Run_NightWatch_testing_nonstop|Ran NightWatch_testing|, but [ci skip].|"
  "06|CloudContinuousIntegration|Configure_CircleCI_for_Nightwatch_Testing|Configured CircleCI for Nightwatch Testing|, but [ci skip].|"
  "07|ProductionLogging|Refactor_Bunyan_InstantiationA|Brought in the 'logger.js' file.|, but [ci skip].|"
  "07|ProductionLogging|Refactor_Bunyan_InstantiationB|Brought in edited 'package.js' and '${PKG_NAME}-tests.js' files.|, but [ci skip].|"
  "07|ProductionLogging|Refactor_Bunyan_InstantiationC|Brought in edited 'package.js' and '${PKG_NAME}-tests.js' files.|, but [ci skip].|"
  "07|ProductionLogging|Package_Upgrade_and_Project_Rebuild_B|Pushed production logging example to cloud.|, but [ci skip].|"
  "08|RealWorldPackage|Another_NodeJS_moduleB|Obtained script that resets sample data in Swagger Pet Store.|, but [ci skip].|"
  "08|RealWorldPackage|Another_NodeJS_moduleC_nonstop|Reset Pet Store sample data.|, but [ci skip].|"
  "08|RealWorldPackage|Async_Problem_TinyTest_A|Brought in a '${PKG_NAME}-tests.js' file, edited for the Async problem example.|, but [ci skip].|"
  "08|RealWorldPackage|Call_Into_Package_Methods|Brought in 'usage_example.js' and 'usage_example.html' files, edited for the Async problem example.|, but [ci skip].|"
  "08|RealWorldPackage|Package_Dependencies|Brought in a 'package.js' file, edited for the Async problem example.|, but [ci skip].|"
  "08|RealWorldPackage|Declare_Callable_Method|Brought in a '${PKG_NAME}.js' file, edited for the Async problem example.|, but [ci skip].|"
  "09|PackageSelfTest|UsageExampleEndToEnd_prep|Brought in an edited 'nightwatch.json' file.|, but [ci skip].|"
  "09|PackageSelfTest|UsageExampleEndToEnd|Tested Usage Example.|, but [ci skip].|"
  "09|PackageSelfTest|FinishDocumentation|Brought in '${PKG_NAME}.js' and 'usage_example.js' files edited  with jsDoc annotations.|, but [ci skip].|"
  "09|PackageSelfTest|IntegratingEverything|Committed latest changes to project '${PROJECT_NAME}' and package '${PKG_NAME}'.|, but [ci skip].|"
  "09|PackageSelfTest|CodeMaintenanceHelperFile_B|Made and tested a mock version of 'perform_ci_tasks.sh'.|, but [ci skip].|"
  "09|PackageSelfTest|CodeMaintenanceHelperFile_C|Obtained and tested the final 'perform_ci_tasks.sh'.|, but [ci skip].|"
  "09|PackageSelfTest|PushDocsToGitHubPagesFromCIBuild_A|Enabled 'commitDocs' function and got 'circle_T09.yml'.|, but [ci skip].|"
  "09|PackageSelfTest|PushDocsToGitHubPagesFromCIBuild_B|Pushed project and package to GitHub.||"
  "09|PackageSelfTest|InspectBuildResults|CircleCI build result reported.||"
  "09|PackageSelfTest|ReportAnIssue|Issue reporting explained.|, but [ci skip].|"
  "10|AutomatedDeployment|PrepareAndroidSDK_B|Prepared Android SDK.|, but [ci skip].|"
  "10|AutomatedDeployment|BuildAndroidAPK_A|Prepared project APK.|, but [ci skip].|"
  "10|AutomatedDeployment|BuildAndroidAPK_B|Built project APK.|, but [ci skip].|"
  "10|AutomatedDeployment|DeployToMeteorServers|Deployed to Meteor Servers.|, but [ci skip].|"
  "10|AutomatedDeployment|PrepareCIwithAndroidSDK|Prepared CircleCI for installing AndroidSDK.|, but [ci skip].|"
  "10|AutomatedDeployment|PrepareCIwithAndroidBuilder|Prepared CircleCI with Android Builder.|, but [ci skip].|"
  "10|AutomatedDeployment|PrepareCIwithMeteorDeployment|Prepare CircleCI with Meteor deployment capability.|, but [ci skip].|"
  "10|AutomatedDeployment|ShowStatusSymbol|Sport CircleCI Status Symbol on package README.md file.|, but [ci skip].|"
  "10|AutomatedDeployment|VersionMonitorTemplate|Add a Version Report Template.|, but [ci skip].|"
  "10|AutomatedDeployment|PushFinalChanges|Pushing latest changes to GitHub for rebuild on CircleCI.||"

);

reminder=(

  "01|PrepareTheMachine|"
  "02|VersionControlInTheCloud|"
  "03|UnitTestAPackage|"
  "04|CodingStyleAndLinting|"
  "05|AutomaticDocumentationInTheCloud|"
  "06|CloudContinuousIntegration|"
  "07|ProductionLogging|"
  "08|RealWorldPackage|"
  "09|PackageSelfTest|"
  "10|AutomatedDeployment|"

);

scrap=(
);


