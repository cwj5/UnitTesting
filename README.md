# UnitTesting
Example of unit testing for Virginia Tech AOE 6145

# To Build Tests
    cd /path/to/UnitTesting
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_Fortran_COMPILER=gfortran -DPFUNIT=$PFUNIT ../
    make
    
Make sure you are using a recent version of gfortran (tested with gcc v6.1.0).
Also make sure you are using the latest version of pFUnit (tested with pFUnit v3.2.8).
Also make sure you have set the variable $PFUNIT (probably in your ~/.bashrc) to the directory PFUnit is installed in.