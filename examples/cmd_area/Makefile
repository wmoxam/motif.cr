UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	X11_LIB_DIR=/usr/X11/lib
endif
ifeq ($(UNAME_S),OpenBSD)
	X11_LIB_DIR=/usr/X11R6/lib
endif

all:
	shards install
	crystal build --link-flags -L$(X11_LIB_DIR) src/cmd_area.cr

clean:
	rm cmd_area
