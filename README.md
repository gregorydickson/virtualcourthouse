Development environment notes:

On Mac OS X using jdk 1.7 build 1.7.0_60 (beta). This will throw an exception:
objc[13294]: Class JavaLaunchHelper is implemented in both /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/bin/java and /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/jre/lib/libinstrument.dylib

This is because of a jdk bug on OS X, will update when 1.7.0_60 is final

Spring Grails 2.3.5
Hibernate 3.6.10.7
Foundation by Zurb version 5.0.3
mysql:mysql-connector-java:5.1.27
tomcat:7.0.50
