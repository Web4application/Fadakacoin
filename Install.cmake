# Define the installation prefix
set(CMAKE_INSTALL_PREFIX "/usr/local")

# Install the executable
install(TARGETS my_executable
        RUNTIME DESTINATION bin)

# Install the library
install(TARGETS my_library
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)

# Install header files
install(FILES my_header.h
        DESTINATION include)

# Install a directory
install(DIRECTORY my_directory/
        DESTINATION share/my_project)
