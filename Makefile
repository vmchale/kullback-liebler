.PHONY: clean pkg

information.py: information.fut
	futhark pyopencl --library information.fut

pkg: gpu-entropy/information.py

gpu-entropy:
	mkdir $@

gpu-entropy/information.py: information.py gpu-entropy
	cp $< $@

clean:
	@rm -rf information information.c data information.py gpu-entropy
