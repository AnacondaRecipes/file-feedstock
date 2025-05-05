# Values from doc/Makefile.am
set(__CSECTION__ 1)
set(__FSECTION__ 4)
set(__VERSION__ ${FILE_VERSION})
set(__MAGIC__ ${CMAKE_INSTALL_DATAROOTDIR}/magic)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/file.man file.1 @ONLY)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/file.1
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/man/man.1
  COMPONENT Development)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/libmagic.man libmagic.3 @ONLY)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/libmagic.3
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/man/man.3
  COMPONENT Development)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/magic.man magic.${__FSECTION__} @ONLY)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/magic.${__FSECTION__}
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/man/man.${__FSECTION__}
  COMPONENT Development)
