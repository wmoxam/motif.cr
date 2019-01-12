all:
	shards install
	crystal build --link-flags -L/usr/X11/lib src/hello.cr
	crystal build --link-flags -L/usr/X11/lib src/hello2.cr

clean:
	rm hello
