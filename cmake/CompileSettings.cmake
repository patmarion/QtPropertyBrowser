######################### COMPILE SETTINGS ################################
IF(NOT CMAKE_BUILD_TYPE)
   SET(CMAKE_BUILD_TYPE Release CACHE STRING
       "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
        FORCE)
ENDIF(NOT CMAKE_BUILD_TYPE)

MESSAGE(STATUS "===============================================================")
MESSAGE(STATUS "============ Configuring CompileSettings  =====================")

IF(NOT MSVC)
  OPTION (USE_CPP_11 "Use C++11 Compiler" ON)
  IF(USE_CPP_11)
    INCLUDE(CheckCXXCompilerFlag)
    CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
    CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
    
    IF(COMPILER_SUPPORTS_CXX11)
  	  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    ELSEIF(COMPILER_SUPPORTS_CXX0X)
  	  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    ELSE()
      SET(USE_CPP_11 OFF)
      MESSAGE(STATUS "Compiler ${CMAKE_CXX_COMPILER} has no C++11 support.")
    ENDIF()
  ENDIF()
ENDIF()

MESSAGE(STATUS "===============================================================")
