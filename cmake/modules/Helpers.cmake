# Function to add all subdirectories for current source directory
function(add_subdirectories DIR_NAME)
    # Get all subdirectories in the current directory
    file(GLOB children RELATIVE ${DIR_NAME} ${DIR_NAME}/*)
    
    # Initialize lists to store directories and ignored paths
    set(dirlist "")
    set(ignore_list ".git" ".vs" "build" "out" "install" ".vscode" "CMakeFiles")
    
    # Find all directories
    foreach(child ${children})
        if(IS_DIRECTORY ${DIR_NAME}/${child})
            list(APPEND dirlist ${child})
        endif()
    endforeach()
    
    # Add each directory that's not in the ignore list
    foreach(subdir ${dirlist})
        # Check if directory should be ignored
        set(should_ignore FALSE)
        foreach(ignore_dir ${ignore_list})
            if(${subdir} STREQUAL ${ignore_dir})
                set(should_ignore TRUE)
                break()
            endif()
        endforeach()
        
        # Add directory if it shouldn't be ignored and contains CMakeLists.txt
        if(NOT should_ignore AND EXISTS "${DIR_NAME}/${subdir}/CMakeLists.txt")
            message(STATUS "Adding subdirectory: ${subdir}")
            add_subdirectory(${subdir})
        endif()
    endforeach()
endfunction()

function(add_current_subdirectories)
    add_subdirectories(${CMAKE_CURRENT_SOURCE_DIR})
endfunction()

function (add_component_sources target_name)
    # collect all sources(.cpp) from <current_project/src> & it's sub-directories
    file(GLOB_RECURSE sources "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

    target_sources(${target_name}
        PRIVATE
            ${sources}
    )
endfunction()

function (get_current_directory_component name parent_name)
    # get parent directory name
    get_filename_component(PARENT_DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)
    get_filename_component(PARENT_DIR_NAME "${PARENT_DIR_NAME}" NAME)

    # get current directory name
    get_filename_component(DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

    # Set variables in parent scope
    set(${parent_name} "${PARENT_DIR_NAME}" PARENT_SCOPE)
    set(${name} "${DIR_NAME}" PARENT_SCOPE)
endfunction()

function (get_component_name name)
    # # get parent directory name
    # get_filename_component(PARENT_DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)
    # get_filename_component(PARENT_DIR_NAME "${PARENT_DIR_NAME}" NAME)

    # # get current directory name
    # get_filename_component(DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
    get_current_directory_component(DIR_NAME PARENT_DIR_NAME)

    # get library/executable name
    set(${name} "${PARENT_DIR_NAME}_${DIR_NAME}" PARENT_SCOPE)
endfunction()

function (get_component_alias_name name)
    # # get parent directory name
    # get_filename_component(PARENT_DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)
    # get_filename_component(PARENT_DIR_NAME "${PARENT_DIR_NAME}" NAME)

    # # get current directory name
    # get_filename_component(DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
    get_current_directory_component(DIR_NAME PARENT_DIR_NAME)

    # get library/executable name
    set(${name} "${PARENT_DIR_NAME}::${DIR_NAME}" PARENT_SCOPE)
endfunction()


function(add_component TYPE)
    if(TYPE)
        # get library/executable name
        get_component_name(COMPONENT_NAME)

        # Basic if-else
        if(${TYPE} STREQUAL "lib")
            # get library/executable name
            get_component_alias_name(COMPONENT_ALIAS_NAME)
            add_library(${COMPONENT_NAME} "")
            add_library(${COMPONENT_ALIAS_NAME} ALIAS ${COMPONENT_NAME})
        elseif(${TYPE} STREQUAL "exe")
            # TODO: executable name might be change
            add_executable(${COMPONENT_NAME} "")
        endif()

        # add source scripts for the component
        add_component_sources(${COMPONENT_NAME})
    endif()
endfunction()

function(generate_tests)
    if(BUILD_TESTING)
        include(TestConfig)
        add_subdirectory(tests)
    endif()
endfunction()
