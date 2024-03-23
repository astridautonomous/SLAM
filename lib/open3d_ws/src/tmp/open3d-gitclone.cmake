
if(NOT "/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitinfo.txt" IS_NEWER_THAN "/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/tezcan/Work_Spaces/open3d_ws/src/open3d"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/tezcan/Work_Spaces/open3d_ws/src/open3d'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --progress --config "advice.detachedHead=false" "https://github.com/isl-org/Open3D" "open3d"
    WORKING_DIRECTORY "/home/tezcan/Work_Spaces/open3d_ws/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/isl-org/Open3D'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout v0.15.1 --
  WORKING_DIRECTORY "/home/tezcan/Work_Spaces/open3d_ws/src/open3d"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v0.15.1'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/tezcan/Work_Spaces/open3d_ws/src/open3d"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/tezcan/Work_Spaces/open3d_ws/src/open3d'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitinfo.txt"
    "/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/tezcan/Work_Spaces/open3d_ws/src/src/open3d-stamp/open3d-gitclone-lastrun.txt'")
endif()

