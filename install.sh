#/bin/bash

canInstall="yes"
if [ -x /usr/bin/pngquant ]; then
  echo "pngquant is not installed !"
  canInstall="no"
fi

if [ -x /usr/bin/parallel ]; then
  echo "parallel is not installed !"
  canInstall="no"
fi

if [ -x /usr/bin/jpegoptim ]; then
  echo "pngquant is not installed !"
  canInstall="no"
fi

if [[ $canInstall == "no" ]]; then
  exit -1
fi


git clone https://github.com/JafarAkhondali/Tapnesh.git /tmp/tapnesh
cd /tmp/tapnesh
chmod +x ./tapnesh.sh
sudo /usr/bin/cp ./tapnesh.sh /usr/local/bin/tapnesh -f
