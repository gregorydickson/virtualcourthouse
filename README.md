Development environment notes:

1. Install MySQL
2. Install Grails 2.3.5 (can use GVM)
3. Clone from GIT


The application is setup to connect to a local MySQL database "p1", username/password "land/0gzr4YjMKrsb2Ix"
MySQL must be running and the database must be created with the user "land" assigned all permissions to the schema.

Spring Grails 2.3.5
Hibernate 3.6.10.7
Foundation by Zurb version 5.0.3
mysql:mysql-connector-java:5.1.27
tomcat:7.0.50
JDK 1.7_55



On Mac OS X using jdk 1.7 build 1.7.0_60 (beta). Grails will throw an exception:
objc[13294]: Class JavaLaunchHelper is implemented in both /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/bin/java and /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/jre/lib/libinstrument.dylib

This is because of a jdk bug on OS X, will update when 1.7.0_60 is final


