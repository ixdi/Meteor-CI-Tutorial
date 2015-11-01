#!/bin/bash

set -e;
#
source ./scripts/util.sh

checkForVirtualMachine;
checkNotRoot;

export SUDOUSER=$(who am i | awk '{print $1}');

export SECTION_NUM="5";
export SECTION="AutomaticDocumentationInTheCloud";
export NEXT_SECTION="CloudContinuousIntegration";
printf -v BINDIR "./Tutorial%02d_%s" ${SECTION_NUM} ${SECTION};
source "${BINDIR}/${SECTION}_functions.sh";


source ./scripts/explain.sh

RUN_RULE="";
explain ${BINDIR}/Introduction.md

explain ${BINDIR}/Try_jsDoc_from_the_Command_Line_A.md MORE_ACTION # CODE_BLOCK
if [ "${RUN_RULE}" != "n" ]; then Try_jsDoc_from_the_Command_Line_A; fi;

explain ${BINDIR}/Try_jsDoc_from_the_Command_Line_B.md MORE_ACTION # CODE_BLOCK
if [ "${RUN_RULE}" != "n" ]; then Try_jsDoc_from_the_Command_Line_B; fi;

RUN_RULE="";
explain ${BINDIR}/Configure_Sublime_Text_to_use_jsDoc.md # MANUAL_INPUT_REQUIRED

explain ${BINDIR}/Use_Sublime_Text_jsDoc_plugin_A.md MORE_ACTION # CODE_BLOCK
if [ "${RUN_RULE}" != "n" ]; then Use_Sublime_Text_jsDoc_plugin_A; fi;

RUN_RULE="";
explain ${BINDIR}/Use_Sublime_Text_jsDoc_plugin_B.md # MANUAL_INPUT_REQUIRED

explain ${BINDIR}/Use_Sublime_Text_jsDoc_plugin_C.md MORE_ACTION # CODE_BLOCK
if [ "${RUN_RULE}" != "n" ]; then Use_Sublime_Text_jsDoc_plugin_C; fi;

RUN_RULE="";
explain ${BINDIR}/Publish_jsDocs_toGitHub_A.md

TEMP_ZIP="/tmp/${PKG_NAME}_BINDIR.zip"
explain ${BINDIR}/Publish_jsDocs_toGitHub_B.md MORE_ACTION # CODE_BLOCK
if [ "${RUN_RULE}" != "n" ]; then Publish_jsDocs_toGitHub_B; fi;

## FLAG FOR INCLUSION IN SLIDES - ${BINDIR}/Fin.md explain

endOfSectionScript ${SECTION_NUM} ${SECTION} ${NEXT_SECTION};

exit 0;

