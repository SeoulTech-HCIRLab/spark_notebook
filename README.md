# spark_jupyter
environments for course of big data analysis practice in seoul national university of science and technology.


make workspace directory that should need when saving your notebook in localhost


run
sudo docker run -h "localhost" -v "$PWD"/workspace:/root/workspace -p 8888:8888 -p 8080:8080 -p 8088:8088 -p 4040:4040 -p 50070:50070 spark2


sudo docker rm $(sudo docker ps -aq)