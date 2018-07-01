#!/bin/bash

export
. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDeterminePython27() {
    touch ${HOME}/test-runtime.txt
    echo "python-2.7.14" >| ${HOME}/test-runtime.txt

    compile

    assertContains "Unfortunately"
    assertEquals 1 ${rtrn}
}
