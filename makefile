current_dir = $(shell pwd)

all:
	latexmk

clean:
	latexmk -c

distclean:
	latexmk -C

docker:
	docker pull danteev/texlive
	docker run -it -v $(current_dir):/workdir danteev/texlive /bin/bash -c './docker.sh'
