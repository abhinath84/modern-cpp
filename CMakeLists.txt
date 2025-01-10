cmake_minimum_required(VERSION 3.25)

project(modern-cpp VERSION 1.0.0
        DESCRIPTION "Practice features of modern c++"
        LANGUAGES CXX)

# Load CMake modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

# Global settings
include(CompilerWarnings)
include(ProjectSettings)
include(Helpers)
# include(GenerateLibrary)
include(GenerateApplication)

# # Enable testing for this project
# include(CTest)

# add items sub-directory
add_current_subdirectories()
