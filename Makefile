.PHONY: clean pkg bench

information.py: lib/github.com/vmchale/kullback-liebler/information.fut
	futhark pyopencl --library $< -o information

pkg: entropy-gpu/information.py

entropy-gpu:
	mkdir $@

docs/index.html: lib/github.com/vmchale/kullback-liebler/information.fut
	futhark doc -o $(dir $@) $<

entropy-gpu/information.py: information.py entropy-gpu
	cp $< $@

clean:
	@rm -rf information information.c data information.py entropy-gpu Pipfile.lock

bench: lib/github.com/vmchale/kullback-liebler/information.fut
	futhark bench $< --backend opencl
