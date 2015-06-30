#Installing issues

To build glfw3 with shared librarires your should do:
    mkdir glfwbuild && cd glfwbuild 
    cmake -D BUILD_SHARED_LIBS=ON <glfw-repository-path>
    make && sudo make install


You need to install glfw3 lib. In linux you must to add /usr/local/lib to your linker library paths.
to do so edit your /etc/ld.so.conf or add file to /etc/ld.so.conf.d/ with path to /usr/local/lib/


