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

sudo apt remove -y '^libclang-*'
sudo apt remove -y '^libgcc-.*-dev'
sudo apt remove -y '^liblldb.*'
sudo apt remove -y '^libruby.*'
sudo apt remove -y '^libstdc++.*'
sudo apt remove -y '^aspnet.*'
sudo apt remove -y '^cpp-*'
sudo apt remove -y '^dotnet-.*'
sudo apt remove -y '^gcc-.*'
sudo apt remove -y '^g++-.*'
sudo apt remove -y '^gfortran-.*'
sudo apt remove -y '^ghc-8.*'
sudo apt remove -y '^llvm-.*'
sudo apt remove -y '^ruby.*'
sudo apt remove -y '^mono.*'
sudo apt remove -y '^moby-.*'
sudo apt remove -y '^mysql-.*'
sudo apt remove -y '^postgresql-*'
sudo apt remove -y '^temurin-.*'
sudo apt remove -y '^php.*'

# Remove SDK packages
sudo apt remove -y google-cloud-sdk

# Remove Microsoft packages
sudo apt remove -y azure-cli powershell msbuild nuget

# Remove Fonts & Icons
sudo apt remove -y fonts-dejavu-extra libfreetype-dev humanity-icon-theme

# Remove Browsers
sudo apt remove -y google-chrome-stable microsoft-edge-stable firefox

# Remove Mono packages
sudo apt remove -y mono-devel

# Remove SQLite
sudo apt remove -y sqlite3 libsqlite3-dev

# Remove Misc packages
sudo apt remove -y ant snapd hhvm p7zip-full unixodbc

# Autoclean & Autoremove
sudo apt autoremove --purge -y && sudo apt clean -y

# Disk space freed
echo "=============================================================================="
echo "Freed up disk space on CI system"
echo "=============================================================================="
df -h
