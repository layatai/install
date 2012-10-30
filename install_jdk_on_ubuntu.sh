#!/bin/bash

#/**
# * Copyright 2012 The Apache Software Foundation
# *
# * Licensed to the Apache Software Foundation (ASF) under one
# * or more contributor license agreements.  See the NOTICE file
# * distributed with this work for additional information
# * regarding copyright ownership.  The ASF licenses this file
# * to you under the Apache License, Version 2.0 (the
# * "License"); you may not use this file except in compliance
# * with the License.  You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */

export myjdk=jdk1.6.0_37
export priority=2000
for cmd in /usr/bin/*
do
  sudo update-alternatives --install /usr/bin/$cmd $cmd /usr/lib/jvm/$myjdk/bin/$cmd $priority
  sudo update-alternatives --config $cmd
done

# Installation of default-java for /usr/lib/bigtop-utils/bigtop-detect-javahome
sudo ln -s /usr/lib/jvm/$myjdk/ /usr/lib/jvm/default-java
