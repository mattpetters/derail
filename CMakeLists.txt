cmake_minimum_required(VERSION 3.16)
project(derail)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(APPLE)
    # Find required macOS frameworks
    find_library(COCOA_LIBRARY Cocoa)
    find_library(CARBON_LIBRARY Carbon)
endif()


# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)
#include_directories(${CMAKE_SOURCE_DIR}/libs/spdlog/include)

# Source files
set(SOURCES
        src/main.mm
        src/AppDelegate.h
        src/AppDelegate.mm
        src/macos/WindowTracker.h
        src/macos/WindowTracker.mm
)

add_executable(derail MACOSX_BUNDLE ${SOURCES})

# Link required macOS frameworks        
if(APPLE)
        target_link_libraries(derail ${COCOA_LIBRARY} ${CARBON_LIBRARY})
endif()
# Set properties for macOS bundle
set_target_properties(derail PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER io.petters.derail
        MACOSX_BUNDLE_BUNDLE_NAME derail
        MACOSX_BUNDLE_INFO_PLIST ${CMAKE_SOURCE_DIR}/resources/Info.plist
)

# Include tests
#add_subdirectory(tests)