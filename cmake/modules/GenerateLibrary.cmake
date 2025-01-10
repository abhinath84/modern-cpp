function(generate_library)
  get_filename_component(LIBRARY_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

  # # collect all source scripts
  # file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
  
  # add_library(${PROJECT_NAME}_${LIBRARY_NAME}
  #   ${SOURCES}
  # )

  # add_library(${PROJECT_NAME}::${LIBRARY_NAME} ALIAS ${PROJECT_NAME}_${LIBRARY_NAME})

  # add library
  add_component("lib")

  target_include_directories(${PROJECT_NAME}_${LIBRARY_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
  )

  # Set compile options and warnings
  target_compile_features(${PROJECT_NAME}_${LIBRARY_NAME} PUBLIC cxx_std_17)
  set_project_warnings(${PROJECT_NAME}_${LIBRARY_NAME})

  # add googletest based unit tests
  generate_tests()

  # Installation rules
  install(TARGETS ${PROJECT_NAME}_${LIBRARY_NAME}
    EXPORT ${PROJECT_NAME}_${LIBRARY_NAME}_targets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
  )

  install(DIRECTORY include/
    DESTINATION include
  )
endfunction()
