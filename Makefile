
run:
	cd snapshot && ./pharo-ui Pharo.image

fresh:
	rm -rf snapshot
	mkdir snapshot
	cd snapshot && curl get.pharo.org | bash
