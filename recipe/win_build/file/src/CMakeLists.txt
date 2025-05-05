set(WIN_COMPAT_SOURCES
  asctime_r.c
  asprintf.c
  ctime_r.c
  dprintf.c
  getline.c
  gmtime_r.c
  localtime_r.c
  pread.c
  strcasestr.c
  strlcat.c
  strlcpy.c
  vasprintf.c
  fmtcheck.c
  ${CMAKE_SOURCE_DIR}/win-headers/magic.def
  ${CMAKE_SOURCE_DIR}/win-headers/unistd.c
)

# Source files as described in Makefike.am
set(LIBMAGIC_SOURCE_FILES
  ${WIN_COMPAT_SOURCES}
  apprentice.c
  apptype.c
  ascmagic.c
  buffer.c
  cdf.c
  cdf_time.c
  compress.c
  der.c
  encoding.c
  fsmagic.c
  funcs.c
  is_json.c
  is_simh.c
  is_tar.c
  magic.c
  print.c
  readcdf.c
  readelf.c
  softmagic.c
  is_csv.c
)

configure_file(magic.h.in magic.h COPYONLY)

add_definitions(-DHAVE_CONFIG_H -DVERSION="$ENV{PKG_VERSION}" -DWIN32_LEAN_AND_MEAN -DWIN32 -DPCRE2_STATIC )

add_library(libmagic SHARED ${LIBMAGIC_SOURCE_FILES})
target_link_libraries(libmagic pcre2-posix shlwapi)
install(
  TARGETS libmagic
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/magic.h
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  COMPONENT Development)

add_executable(file file.c seccomp.c)
target_link_libraries(file libmagic pcre2-posix shlwapi)
install(
  TARGETS file
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  COMPONENT Runtime)
