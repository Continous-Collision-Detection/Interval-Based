include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
    set(intervalCCD_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
    set(intervalCCD_EXTRA_OPTIONS "")
endif()

function(ccd_download_project name)
    download_project(
        PROJ         ${name}
        SOURCE_DIR   ${INTERVAL_CCD_EXTERNAL}/${name}
        DOWNLOAD_DIR ${INTERVAL_CCD_EXTERNAL}/.cache/${name}
        QUIET
        ${intervalCCD_EXTRA_OPTIONS}
        ${ARGN}
    )
endfunction()

################################################################################


## Eigen
function(ccd_download_eigen)
    ccd_download_project(eigen
	GIT_REPOSITORY           https://gitlab.com/libeigen/eigen.git
	GIT_TAG       3.3.7
    )
endfunction()