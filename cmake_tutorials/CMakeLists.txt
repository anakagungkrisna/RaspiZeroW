# CMakeLists.txt is the one and only file that tells cmake how to build and compiled our projects. Below is the 
# cmake syntax that cmake knows.

# specify the minimum version of cmake that is required. minimum 3.21 or newer. it only suppress the warning.
cmake_minimum_required(VERSION 3.16)

# give name to the project
project(cmake_tutorials)

# use C++14 for compiling our C++ code
# set so this isnt force ??
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# specify the flags that the compiler going to use when compiling this project. 
# flags are some sort of warning that the compiler gives so we can get potential mistakes in compile time 
# rather than runtime
# -O3 : enable all optimization
# -Wall : enable all warnings
set(CMAKE_CXX_FLAGS "-O3 -Wall")

# specify the non header files using globbing. This allows us to specify a lot of files. .
# by using globbing, we are able to specify a lot of .cpp files so we dont need to write all .cpp files when compiling
# PROJECT_SOURCE_DIR is a built in variable in cmake where the CMakeLists.txt is at.
# include all cpp files that are in src (1 level deep)
# include all cpp files that are 2 level deep in src 
file(GLOB CPP_SOURCE
	"${PROJECT_SOURCE_DIR}/src/*.cpp" # include all cpp files that are in src (1 level deep)
	"${PROJECT_SOURCE_DIR}/src/*/*.cpp" # include all cpp files that are 2 level deep in src
)

# specify the include directories so that the compiler knows where to search for header files. 
# we are going to store all header files in the include directory.
include_directories(${PROJECT_SOURCE_DIR}/include)

# we tell the compiler to create an executables
# main is the executable/object file name
# the argument after main is basically all cpp files that exists in src directory
add_executable(main ${CPP_SOURCE})



# Finally, to save your cmake project in git, here are the files that you can put in .gitignore:
# CMakeCache.txt
# CMakeFiles/
# Makefile
# cmake_install.cmake
# since all the files above can be generated when using the command cmake CMakeLists.txt
