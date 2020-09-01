# spark notebook
Practice environments for course of big data analysis in seoul national university of science and technology.  

## specification(spark2)
* jdk-8
* python3.6
* hadoop-2.7.7
* spark-2.4.6

## specification(spark3)
* jdk-8
* python3.6
* hadoop-3.2.1
* spark-3.0.0

*Hadoop be run on a single-node in a pseudo-distributed mode.

/root - /jdk-8  
..........- /hadoop-3.2.1  
..........- /spark-3.0.0-bin-hadoop-3.2  
..........- /workspace  
......... - /Data - /Lec2_linkage  
.......................- /Lec2_movielens  
.......................- /Lec3_AudioScrobbler  
.......................- /Lec4_Forest  
.......................- /Lec5_Network  
.......................- /lm-latest-small  

## Run spark notebook
spark2
```
sudo docker run -h "localhost" -v "$PWD"/workspace:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark2_notebook
```
spark3
```
sudo docker run -h "localhost" -v "$PWD"/workspace:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 titania7777/spark3_notebook
```