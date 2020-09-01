service ssh start && \
$HADOOP_HOME/sbin/start-dfs.sh && \
jupyter-notebook --ip='*' --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''