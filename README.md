
A docker image to easily test php applications with apache/mysql/smtp configuration. It is created using
[baseimage](https://github.com/phusion/baseimage-docker) because we need a fully working OS in order to make everything
work.

To launch:

    docker run -d --name=${name} -p ${port}:80 -v ${www_folder}:/var/www nicolasvan/phpdocker:1.0.1
    
Where:
    
    * `${name}` is the name you want to assign to your container.
    * `${www_folder}` is the absolute path to the folder containing your php files
    * `${port}` is the port you want to use on your machine.

To have a bash in your container:

    docker exec -t -i ${name} bash
    
You can also install PhpMyAdmin if you want by typing this and answering a few questions (I didn't manage to script the install process of PhpMyAdmin yet):

    apt-get install phpmyadmin
    service apache2 restart
    
PhpMyAdmin will be reachable using `http://localhost:${port}/phpmyadmin`.

MySQL info:

* MySQL user: root
* MySQL password: root
* MySQL default database: defaultdb
