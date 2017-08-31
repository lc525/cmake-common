find_path(LIBNEO4J_INCLUDE_DIR neo4j-client.h
    PATHS ${CMAKE_SOURCE_DIR}/common/external/libneo4j-client/src/lib
          ${CMAKE_SOURCE_DIR}/external/libneo4j-client/lib
    HINTS $ENV{LIBNEO4J_INCLUDE_DIR}
)

find_library(LIBNEO4J_LIBRARY
    NAMES libneo4j-client.so
    PATHS ${CMAKE_SOURCE_DIR}/common/external/libneo4j-client/src/lib/
          ${CMAKE_SOURCE_DIR}/external/libneo4j-client/src/lib
    HINTS $ENV{LIBNEO4J_LIB_DIR}
    PATH_SUFFIXES .libs
    DOC "libneo4j-client"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libneo4jclient DEFAULT_MSG
  LIBNEO4J_LIBRARY LIBNEO4J_INCLUDE_DIR)

mark_as_advanced(
  LIBNEO4J_INCLUDE_DIR
  LIBNEO4J_LIBRARY
)

set(LIBNEO4J_LIBRARIES ${LIBNEO4J_LIBRARY} CACHE STRING "libneo4j library")
set(LIBNEO4J_INCLUDE_DIRS ${LIBNEO4J_INCLUDE_DIR} CACHE STRING "libneo4j include dir")

set_package_properties(libneo4jclient PROPERTIES
  URL "https://github.com/cleishm/libneo4j-client"
  TYPE REQUIRED
  PURPOSE "neo4j C driver library (using the Bolt protocol)")

