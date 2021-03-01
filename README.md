# UnitTesting
Example of unit testing for Virginia Tech AOE 6145

# To Build Fortran Tests
    cd /path/to/UnitTesting
    mkdir build_fortran
    cd build
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_Fortran_COMPILER=gfortran ../fortran_pFUnit
    make
    
Make sure you are using a recent version of gfortran (tested with gcc v6.1.0).
Also make sure you are using the latest version of pFUnit (tested with pFUnit v4.2.0).
Follow the install directions above and make sure the pFUnit install dir is in your `CMAKE_PREFIX_PATH`

Run tests by running `ctest`

# To Build C++ Tests
    cd /path/to/UnitTesting
    mkdir build_cpp
    cmake ../cpp_catch2
    make

Run tests by running `UnitTest`
