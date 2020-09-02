# spark notebook
Practice environments for course of big data analysis in seoul national university of science and technology.  

## specification(spark2)
* jdk-8
* python3.6
* hadoop-2.7.7
* spark-2.4.6

*Hadoop will be run on a single-node(1 core) in a pseudo-distributed mode.

```
spark3 file structure summary
[ex. sc.textFile("../Data/Lec2_linkage")]
/root
│       
│───/jdk-8
│───/hadoop-2.7.7
│───/spark-2.4.6-bin-hadoop-2.7
│───/workspace => notebook workspace
└───/Data
    │   
    │───/Lec2_linekage
    │───/Lec2_movielens
    │───/Lec3_AudioScrobbler
    │───/Lec4_Forest
    │───/Lec5_Network
    └───/ml-latest-small
```

## specification(spark3)
* jdk-8
* python3.6
* hadoop-3.2.1
* spark-3.0.0

*Hadoop will be run on a single-node(1 core) in a pseudo-distributed mode.

```
spark3 file structure summary
[ex. sc.textFile("../Data/Lec2_linkage")]
/root
│       
│───/jdk-8
│───/hadoop-3.2.1
│───/spark-3.0.0-bin-hadoop-3.2
│───/workspace => notebook workspace
└───/Data
    │   
    │───/Lec2_linekage
    │───/Lec2_movielens
    │───/Lec3_AudioScrobbler
    │───/Lec4_Forest
    │───/Lec5_Network
    └───/ml-latest-small
```

```
hdfs file structure summary
[ex. sc.textFile("hdfs://localhost:9000/Data/Lec2_linkage")]
/Data
│   
│───/Lec2_linekage
│───/Lec2_movielens
│───/Lec3_AudioScrobbler
│───/Lec4_Forest
│───/Lec5_Network
└───/ml-latest-small
```

## Run spark notebook(ubuntu)
at first make your workspace directory.
```
mkdir <your workspace name>
```
and run (spark2)
```
sudo docker run -h "localhost" -v $PWD/<your workspace directory>:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark2_notebook
```
and run (spark3)
```
sudo docker run -h "localhost" -v $PWD/<your workspace directory>:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark3_notebook
```

## Run spark notebook(windows)
open the powershell or git bash as administrator and make your workspace directory.
```
mkdir <your workspace name>
```
and run (spark2)
```
docker run -h "localhost" -v $PWD\<your workspace directory>:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark2_notebook
```
and run (spark3)
```
docker run -h "localhost" -v $PWD\<your workspace directory>:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark3_notebook
```

*in windows has some issue about access the port 50070 in that case, you can remove "-p 50070:50070" when to run docker image or see this issue.  
*50070 port is hadoop namenode web ui port