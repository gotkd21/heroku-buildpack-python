#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDeterminePython27() {
    touch ${BUILD_DIR}/test-runtime.txt
    echo "python-2.7.14" >| ${BUILD_DIR}/test-runtime.txt

    compile

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "heroku stack:set heroku-16" "`cat ${STD_OUT}`"
    assertEquals 1 ${rtrn}
}

source ..\utils.sh
echo "This is a test" > $STD_OUT

compile
echo "Compiled"
