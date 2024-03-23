# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.20.2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(ext_ispc-populate NONE)



include(ExternalProject)
ExternalProject_Add(ext_ispc-populate
                     "UPDATE_DISCONNECTED" "False" "PREFIX" "ispc" "URL" "https://github.com/ispc/ispc/releases/download/v1.16.1/ispc-v1.16.1-linux.tar.gz" "URL_HASH" "SHA256=88db3d0461147c10ed81053a561ec87d3e14265227c03318f4fcaaadc831037f" "DOWNLOAD_DIR" "/home/tezcan/Work_Spaces/open3d_ws/src/open3d/3rdparty_downloads/ispc"
                    SOURCE_DIR          "/home/tezcan/Work_Spaces/open3d_ws/src/tmp/_deps/ext_ispc-src"
                    BINARY_DIR          "/home/tezcan/Work_Spaces/open3d_ws/src/tmp/_deps/ext_ispc-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


