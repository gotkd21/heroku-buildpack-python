#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDeterminePython27() {
    $(touch "${BUILD_DIR}/test-runtime.txt")
    echo "python-2.7.14" >| ${BUILD_DIR}/test-runtime.txt

    if [[ -f "${BUILD_DIR}/test-runtime.txt"]]; then
        $(cat "${BUILD_DIR}/test-runtime.txt") > {$STD_OUT}
        echo "${PYTHON_VERSION}"
    fi

    compile

    assertContains "Unfortunately" "`cat ${STD_OUT}`"
    assertEquals 1 ${rtrn}

}
