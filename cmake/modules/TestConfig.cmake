# Version requirements for dependencies
set(GTEST_VERSION 1.15.2)

include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v${GTEST_VERSION}
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Disable Google Test installation
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)

# enable testing
enable_testing()

# Function to create test target for a library
# TODO: can remove LIBRARY_NAME?
function(add_library_tests)
    # get library name
    get_filename_component(LIBRARY_NAME "${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)
    get_filename_component(LIBRARY_NAME "${LIBRARY_NAME}" NAME)

    # create test name
    set(TEST_NAME "${PROJECT_NAME}_${LIBRARY_NAME}_tests")

    # collect all source scripts
    file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

    add_executable(${TEST_NAME}
        ${SOURCES}
    )

    target_link_libraries(${TEST_NAME}
        PRIVATE
            ${PROJECT_NAME}::${LIBRARY_NAME}
            GTest::gtest_main
            GTest::gmock
    )

    # Enable coverage if requested
    if(ENABLE_COVERAGE)
        target_compile_options(${TEST_NAME} PRIVATE --coverage)
        target_link_options(${TEST_NAME} PRIVATE --coverage)
    endif()

    # Discover tests
    include(GoogleTest)
    gtest_discover_tests(${TEST_NAME})
endfunction()
