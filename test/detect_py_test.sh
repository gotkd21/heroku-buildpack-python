#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/test/utils.sh

testDeterminePython27() {
    touch ${BUILD_DIR}/test-runtime.txt
    echo "python-2.7.14" >| ${BUILD_DIR}/test-runtime.txt

    compile

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertEquals 1 ${rtrn}
}

echo "This is a test" > $STD_OUT
