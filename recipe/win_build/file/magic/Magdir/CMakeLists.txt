function(cat IN_FILE OUT_FILE)
  file(READ ${IN_FILE} CONTENTS)
  file(APPEND ${OUT_FILE} "${CONTENTS}")
endfunction()

# Following is the compilation of the magic file
file(GLOB MAGIC_FRAGMENTS ${CMAKE_CURRENT_SOURCE_DIR}/*)

# Prepare a temporary file to "cat" to:
file(WRITE magic.in "")

# Call the "cat" function for each input file
foreach(MAGIC_FRAGMENT ${MAGIC_FRAGMENTS})
  get_filename_component(file_ext ${MAGIC_FRAGMENT} EXT)
  if(NOT ${file_ext} MATCHES ".txt")
    cat(${MAGIC_FRAGMENT} magic.in)
  endif()
endforeach()

# Copy the temporary file to the final location
configure_file(magic.in magic COPYONLY)

add_custom_command(OUTPUT magic.mgc
  COMMAND file -C -m ${CMAKE_CURRENT_BINARY_DIR}/magic
  DEPENDS file
  COMMENT "Compiling magic file"
)

add_custom_target(magic_mgc ALL DEPENDS magic.mgc)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/magic.mgc
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/misc
  COMPONENT Development)
