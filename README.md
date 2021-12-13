# mini_dicom_viewer-MySQL-Docker
MySQL Database built with Docker Compose for Mini DICOM Viewer Project

We specified the name of our MySQL container as dicom-viewer-mysql-database and the Docker image to be used is mysql:8.0.27. 

Environment variables:
USER = root
PASSWORD = angelo_lamonaca
DATABASE = dicom-viewer

Port mapping is 3308:3306
It means that the MySQL running in the container at port 3306 is mapped to the localhost of the host machine at port 3308.

In order to create our container we need to run the following command in the same directory where the .yml file is located:
docker-compose up
This will pull the Docker image (if the image is not available locally, it will pull from Docker Hub) and then run the container.

We can check the status with:
docker-compose ps