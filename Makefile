
run:
	cd snapshot && ./pharo-ui Pharo.image

fresh:
	rm -rf snapshot
	mkdir snapshot
	cd snapshot && wget -O- get.pharo.org/64 | bash
