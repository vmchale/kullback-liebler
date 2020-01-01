.PHONY: clean

information.py: information.fut
	futhark pyopencl --library information.fut

clean:
	rm -rf information information.c data information.py
