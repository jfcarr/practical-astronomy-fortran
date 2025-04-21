COMPILER = gfortran
BINARY_NAME = pa_fortran

default:
	@echo 'Targets:'
	@echo '  run'
	@echo '  build'
	@echo '  mod    -- Copy mod files from types/, to resolve dependency errors in the IDE.'
	@echo '  clean'

run: build
	@echo '----------'
	@./$(BINARY_NAME)

build: build-subs build-main
	$(COMPILER) -o $(BINARY_NAME) pa_datetime.o pa_assertions.o main_program.o

build-subs:
	$(COMPILER) -c types/pa_returns.f95
	cp pa_returns.mod lib/
	$(COMPILER) -c util/pa_assertions.f95
	$(COMPILER) -c lib/pa_datetime.f95

build-main:
	$(COMPILER) -c main_program.f95

mod: build-subs

clean:
	-rm -f *.o *.mod
	-rm -f lib/*.o lib/*.mod
	-rm -f util/*.o util/*.mod
	-rm -f $(BINARY_NAME)
