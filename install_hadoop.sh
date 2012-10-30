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

# install other packages (select the packages that you want)
sudo apt-get install hadoop-zookeeper
sudo apt-get install zookeeper-server
sudo apt-get install hbase
sudo apt-get install hbase-master
sudo apt-get install hbase-regionserver
sudo apt-get install pig
sudo apt-get install hive
sudo apt-get install sqoop
sudo apt-get install flume-ng

# format namenode
sudo -u hdfs hdfs namenode -format

# start dfs
/etc/init.d/hadoop-hdfs-namenode start
/etc/init.d/hadoop-hdfs-secondarynamenode start
/etc/init.d/hadoop-hdfs-datanode start

# create all directories
sudo -u hdfs hadoop fs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

sudo -u hdfs hadoop fs -mkdir /var
sudo -u hdfs hadoop fs -mkdir /var/lib
sudo -u hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs
sudo -u hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache
sudo -u hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred
sudo -u hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred/mapred
sudo -u hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
sudo -u hdfs hadoop fs -chmod 1777 /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
sudo -u hdfs hadoop fs -chown -R mapred /var/lib/hadoop-hdfs/cache/mapred

sudo -u hdfs hadoop fs -mkdir /user/efdev
sudo -u hdfs hadoop fs -chown efdev /user/efdev

sudo -u hdfs hadoop fs -mkdir /user/hdfs
sudo -u hdfs hadoop fs -chown efdev /user/hdfs

sudo -u hdfs hadoop fs -mkdir /user/hive/warehouse
sudo -u hdfs hadoop fs -chown efdev /user/hive/warehouse
