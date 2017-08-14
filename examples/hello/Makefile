all:
	shards install
	crystal build --link-flags -L/usr/X11R6/lib src/hello-raw.cr
	crystal build --link-flags -L/usr/X11R6/lib src/hello.cr

clean:
	rm hello hello-raw
