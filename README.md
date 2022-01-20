# Apache spark Single Node  on Docker.

Following this steps you can build and use the image to create a spark Single Node
## Build the image from the current Docker file
To run and create an from the docker file  execute the next command:  

      $ docker build -t **ImageName** . 
## Create the container

To run and create a container execute the next command:

     $ sudo docker run -it --name <container-name> -p 7077:7077 -p 8080:8080 --hostname <your-hostname> hadoop bash

Change **container-name** by your favorite name and set **your-hostname** with by your ip or name machine.

You should get the following prompt:  

       spark@localhost:~$ 
Start the ssh server:  

     spark@localhost:~$ sudo service ssh start 
     

Start the spark services (master and workers):  

     spark@localhost:~$ ./spark/sbin/start-all.sh 

Check if all services are started :  

    spark@localhost:~$ jps   
    352 Jps
320 Worker
263 Master
