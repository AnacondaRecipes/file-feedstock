add_executable(file_test test.c ${CMAKE_SOURCE_DIR}/win-headers/unistd.c)
target_link_libraries(file_test libmagic pcre2-posix shlwapi)

# this tests all because of time-zone or crlf errors
set(DISABLED_TESTS
  gedcom
  fit-map-data
  regex-eol
  # it seems like the detection of multiple files is not working
  # to be tested after pcre update
  multiple
  )

enable_testing()
file(GLOB TESTFILES "*.testfile")
foreach(TEST_FILE ${TESTFILES})
  # extract testname from path and generate command
  string(REGEX MATCH  "(.*)\.testfile" TESTPATH ${TEST_FILE})
  set(TESTPATH ${CMAKE_MATCH_1})
  string(REGEX MATCH  "([a-zA-Z0-9_]|-|\\.)+$" TESTNAME ${TESTPATH})
  if(NOT ${TESTNAME} IN_LIST DISABLED_TESTS)
      add_test(NAME ${TESTNAME} COMMAND ${CMAKE_CURRENT_BINARY_DIR}/file_test ${TEST_FILE} ${TESTPATH}.result)
  endif()
endforeach()
