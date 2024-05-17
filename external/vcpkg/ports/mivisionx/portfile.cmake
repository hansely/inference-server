# Copyright 2024 Advanced Micro Devices, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# cmake-format: off
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ROCm/MIVisionX
  REF 67f2a65936d120d8a971d7a6afd7a525d34b8919
  SHA512 769fa57f872f1a6067c6dcbfe07b3aa61ce1a65251ebf957a642842ededc850d4fd91501b541ed0b5bf36e53294806be1453c00bb8c1e0ec2fd7a1e7f1bc132e
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DNEURAL_NET=OFF
    -DLOOM=OFF
    -DMIGRAPHX=OFF
    -DBACKEND=CPU
)
# cmake-format: on

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")