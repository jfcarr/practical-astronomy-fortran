COMPILER = gfortran
BINARY_NAME = pa_fortran

default:
	@echo 'Targets:'
	@echo '  run'
	@echo '  build'
	@echo '  mod    -- Copy mod files to resolve dependency errors in the IDE.'
	@echo '  clean'

run: build
	@echo '----------'
	@./$(BINARY_NAME)

build: build-subs build-main
	$(COMPILER) -o $(BINARY_NAME) pa_datetime.o pa_assertions.o pa_util.o main_program.o

build-subs:
	$(COMPILER) -c types/pa_returns.f90
	cp pa_returns.mod lib/
	$(COMPILER) -c util/pa_assertions.f90
	$(COMPILER) -c util/pa_util.f90
	cp pa_util.mod lib/
	$(COMPILER) -c lib/pa_datetime.f90

build-main:
	$(COMPILER) -c main_program.f90

mod: build-subs

clean:
	-rm -f *.o *.mod
	-rm -f lib/*.o lib/*.mod
	-rm -f types/*.o types/*.mod
	-rm -f util/*.o util/*.mod
	-rm -f $(BINARY_NAME)
