#!/usr/bin/env bash

# Source: https://raw.githubusercontent.com/apache/flink/02d30ace69dc18555a5085eccf70ee884e73a16e/tools/azure-pipelines/free_disk_space.sh

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


echo "=============================================================================="
echo "Freeing up disk space on CI system"
echo "=============================================================================="
df -h

echo "=============================================================================="
echo "Listing 200 largest packages"
echo "=============================================================================="
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail -n 200

echo "=============================================================================="
echo "Removing 200 large packages"
echo "=============================================================================="

sudo apt-get remove -y '^libclang-*'
sudo apt-get remove -y '^liblldb.*'
sudo apt-get remove -y '^libruby.*'
sudo apt-get remove -y '^libstdc++.*'
sudo apt-get remove -y '^aspnet.*'
sudo apt-get remove -y '^cpp-*'
sudo apt-get remove -y '^dotnet-.*'
sudo apt-get remove -y '^gcc-.*'
sudo apt-get remove -y '^g++-.*'
sudo apt-get remove -y '^gfortran-.*'
sudo apt-get remove -y '^ghc-8.*'
sudo apt-get remove -y '^llvm-.*'
sudo apt-get remove -y '^ruby.*'
sudo apt-get remove -y '^mono.*'
sudo apt-get remove -y '^moby-.*'
sudo apt-get remove -y '^mysql-.*'
sudo apt-get remove -y '^postgresql-*'
sudo apt-get remove -y '^temurin-.*'
sudo apt-get remove -y 'php.*'

# Remove packages
sudo apt-get remove -y ant azure-cli hhvm powershell msbuild snapd nuget google-cloud-sdk google-chrome-stable microsoft-edge-stable firefox fonts-lato fonts-liberation humanity-icon-theme podman p7zip-full

# Autoclean & Autoremove
sudo apt-get autoremove -y

# Cleanup
sudo apt-get clean

# Disk space freed
echo "=============================================================================="
echo "Freed up disk space on CI system"
echo "=============================================================================="
df -h

echo "=============================================================================="
echo "Listing 200 largest packages after removed packages"
echo "=============================================================================="
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail -n 200
