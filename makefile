all:
	latexmk

clean:
	latexmk -c

distclean:
	latexmk -C

docker:
	./docker.sh
