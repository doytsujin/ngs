default:
	@echo "No target specified"
	exit 1

.PHONY: build
build:
ifeq ($(shell uname -s),Darwin)
	( source build.macos.env.sh && mkdir -p build && cd build && cmake .. && make )
else
	( mkdir -p build && cd build && cmake .. && make )
endif

.PHONY: tests
tests:
	(cd build && ctest)

.PHONY: install
install: build
	(cd build && sudo make install)

.PHONY: clean
clean:
	rm -rf build

.PHONY: update-vim-syntax
update-vim-syntax:
	./helper-scripts/update-vim-syntax.ngs vim/syntax/ngs.vim
