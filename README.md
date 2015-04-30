
A docker image to easily test php applications with apache/mysql/smtp configuration. It is created using
[baseimage](https://github.com/phusion/baseimage-docker) because we need a fully working OS in order to make everything
work.

To launch:

    docker run -d --name=${name} -p 5000:80 -v ${www_folder}:/var/www nicolasvan/phpdocker

To have a bash in your container:

    docker exec -t -i ${name} bash

MySQL info:

* MySQL user: root
* MySQL password: root
* MySQL default database: defaultdb
