1.	Launched an Ec2 instance (Amazon Linux 2 AMI) in AWS
2.	Sudo yum update – updated the Instance
3.	Sudo yum install Docker – Installed Docker
4.	In /opt – a folder has created with Name ‘tyke’
5.	All the required file were saved in this folder
6.	The files are
a.	Dockerfile
b.	Default.conf
c.	Gen-certificate.sh
d.	sample.html
7.	Dockerfile is used to create image with all the required information
8.	Nginx webserver is considered and replaced default.conf (only run on default port :80) with customized default.conf
9.	A shell script has provided with the simple command ‘openssl’ inorder to generate self-signed certificate
10.	Image is build with command ‘Docker build -t tyke .’ (-t refer to tag name for the image)
11.	A container has created with command ‘docker run -it -p 8880:80 -p 8443:443’ (-it refers to interactive and -p refers to port)
12.	Paste Public IP from AWS with localhost:8880 which opens the web page with ‘tyke.io rocks IoT’
13.	https://localhost:8443 with certificate

Image can be build in localhost and run the container

