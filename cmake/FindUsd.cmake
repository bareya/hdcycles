#  Copyright 2021 Tangent Animation
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied,
#  including without limitation, as related to merchantability and fitness
#  for a particular purpose.
#
#  In no event shall any copyright holder be liable for any damages of any kind
#  arising from the use of this software, whether in contract, tort or otherwise.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# Tangent specific build variables
if(DEFINED ENV{REZ_HOUDINI_ROOT})
    message(STATUS "Rez Houdini USD override")
    set(USE_HOUDINI_USD TRUE)
    set(HOUDINI_ROOT $ENV{HFS})
elseif(DEFINED ENV{REZ_USD_ROOT})
    message(STATUS "Rez Pixar USD override")
    set(USE_HOUDINI_USD FALSE)
    set(USD_ROOT $ENV{REZ_USD_ROOT})
endif()

# Usd interface
add_library(UsdInterface INTERFACE)
add_library(Usd::Usd ALIAS UsdInterface)

message(STATUS "Use Houdini Usd ${USE_HOUDINI_USD}")

if(${USE_HOUDINI_USD})
    include(cmake/FindHoudiniUsd.cmake)
else()
    include(cmake/FindPixarUsd.cmake)
endif()
