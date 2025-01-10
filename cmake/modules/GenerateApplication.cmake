function(generate_application)
  get_filename_component(APPLICATION_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

  # # collect all source scripts
  # file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
  
  # add_executable(${PROJECT_NAME}_${APPLICATION_NAME}
  #   ${SOURCES}
  # )

  # add executable
  add_component("exe")
  
  get_component_name(COMPONENT_NAME)
  target_include_directories(${COMPONENT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
  )

  # Create proper library names
  set(DEPS "")

  foreach(ITEM ${ARGN})
    # Transform the item to get proper library name
    list(APPEND DEPS "${PROJECT_NAME}::${ITEM}")
  endforeach()

  target_link_libraries(${COMPONENT_NAME}
    PRIVATE
      ${DEPS}
  )

  # Set compile options and warnings
  target_compile_features(${COMPONENT_NAME} PRIVATE cxx_std_17)
  set_project_warnings(${COMPONENT_NAME})

  # Installation
  install(TARGETS ${COMPONENT_NAME}
    RUNTIME DESTINATION bin
  )
endfunction()
