# dmenu - dynamic menu
dmenu is an efficient dynamic menu for X.  
This is my version of dmenu and you can find the patches I've applied in the AppliedPatches folder.  
Visit https://tools.suckless.org/dmenu/ for more.

### Requirements
In order to build dmenu you need the Xlib header files.


### Installation
Edit config.mk to match your local setup (dmenu is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dmenu
(if necessary as root):

    make clean install

