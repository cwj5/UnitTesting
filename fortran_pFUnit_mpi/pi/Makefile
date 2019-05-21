include $(PFUNIT)/include/base.mk

calc_pi.o: calc_pi.f90
	$(F90) -o $@ calc_pi.f90

tests.x: testSuites.inc test_pi.pf calc_pi.o
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT)

all: tests calc_pi
