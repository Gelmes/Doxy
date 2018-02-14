#!/bin/bash
# Author: Marco Rubio
# Date  : 2/14/2018
# Desc  : Automatically installs doxygen and dependancies to use doxy

# Install Doxygen and dependencies
apt-get update
apt-get install build-essential
apt install cmake
apt-get install flex
apt-get install bison
apt-get install graphviz
git clone https://github.com/doxygen/doxygen.git
cd doxygen
mkdir build
cd build
cmake -G "Unix Makefiles" ..
make
make install

cd ../..

# Update install directory
sed -i "s@^DOXY_DIR *=.*@DOXY_DIR=$PWD/Doxyfile@" ./doxy || echo "Doxy not in currently working directory. Run from the install directory where you have doxy."

sed -i "s@^LAYOUT_FILE *=.*@LAYOUT_FILE = $PWD/DoxygenLayout.xml@" ./Doxyfile || echo "Doxyfile not in currently working directory. Run from the install directory where you have doxy."

sed -i "s@^HTML_EXTRA_STYLESHEET *=.*@HTML_EXTRA_STYLESHEET = $PWD/customdoxygen.css@" ./Doxyfile || echo "Doxyfile not in currently working directory. Run from the install directory where you have doxy."

# Add doxy to global variabels
ln -s $PWD/doxy /usr/bin/doxy || \
echo "Attempting to remove" && \
rm /usr/bin/doxy && \
echo "Removed old doxy link succesfully" && \
ln -s $PWD/doxy /usr/bin/doxy || \
echo "Something went wrong. Try running as sudo"

echo "Done see README.md for usage details"

