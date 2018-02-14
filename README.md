# Doxy
A pre-configured Doxygen wrapper that allows you to execute Doxygen via terminal and generate html documentation in any directory without having to make a new configuration in every location.

I tested this to work on Ubuntu

# Installation
first download this project into your desired installation directory

run ```sudo ./install.sh```

This will try to install doxygen and its dependencies automatically. It will also create the doxy environmental variable so you can call it from any directory.

# Usage
from the directory you want to generate documentation from call
```sudo ./doxy```

The documentation will be generated into an html directory and a index.html file will be generated that simply redirects you to doxygens file list. This is so you don't have to look for the main page in the long list of files generated under the html directory.
