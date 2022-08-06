#!/usr/bin/env bash
docker pull danteev/texlive
docker run -it -v $(pwd):/workdir danteev/texlive /bin/bash -c '
apt-get update
apt-get install fonts-linuxlibertine
wget -O geosanslight.zip https://dl.dafont.com/dl/?f=geo_sans_light
unzip -d geosanslight/ geosanslight.zip
cp geosanslight/*.ttf /usr/local/share/fonts
rm -rf geosanslight/
rm geosanslight.zip
wget -O librebaskerville.zip https://github.com/impallari/Libre-Baskerville/archive/master.zip
unzip librebaskerville.zip
cp Libre-Baskerville-master/*.ttf /usr/local/share/fonts
rm -rf Libre-Baskerville-master/
rm librebaskerville.zip
fc-cache
latexmk
latexmk -c
'
