# Package config values.
set(prefix "$ENV{PREFIX}")
set(exec_prefix "${prefix}")
set(includedir "${prefix}/include")
set(libdir "${exec_prefix}/lib")

configure_file(libmagic.pc.in libmagic.pc @ONLY)
include(GNUInstallDirs)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/libmagic.pc
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
  COMPONENT Development)

include_directories(
    ${CMAKE_SOURCE_DIR}/win-headers
    ${CMAKE_CURRENT_BINARY_DIR}/src
)

add_subdirectory("doc")
add_subdirectory("magic")
add_subdirectory("src")
add_subdirectory("tests")
