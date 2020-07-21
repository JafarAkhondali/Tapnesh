#/bin/bash

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

# display a message in red with a cross by it
# example
# echo echo_fail "No"
function echo_fail {
  # echo first argument in red
  printf "\e[31m✘ ${1}"
  # reset colours back to normal
  tput sgr0
}

# display a message in green with a tick by it
# example
# echo echo_fail "Yes"
function echo_pass {
  # echo first argument in green
  printf "\e[32m✔ ${1}"
  # reset colours back to normal
  tput sgr0
}

function echo_if {
  if [ $1 == 1 ]; then
    echo_pass $2
  else
    echo_fail $2
    canInstall="no"
  fi
}

canInstall="yes"


echo "pngquant    $(echo_if $(program_is_installed pngquant))"
echo "parallel    $(echo_if $(program_is_installed parallel))"
echo "jpegoptim    $(echo_if $(program_is_installed jpegoptim))"

if [[ $canInstall == "no" ]]; then
  echo "Please install missing dependencies first"
  exit -1
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

git clone https://github.com/JafarAkhondali/Tapnesh.git /tmp/tapnesh
cp /tmp/tapnesh/tapnesh.sh /usr/local/bin/tapnesh -f
chmod +x /usr/local/bin/tapnesh
rm -rf /tmp/tapnesh
echo "Installation complete!"
tapnesh -h
