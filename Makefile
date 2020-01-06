.PHONY: clean pkg

information.py: information.fut
	futhark pyopencl --library information.fut

pkg: entropy-gpu/information.py

entropy-gpu:
	mkdir $@

entropy-gpu/information.py: information.py entropy-gpu
	cp $< $@

clean:
	@rm -rf information information.c data information.py entropy-gpu
