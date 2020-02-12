# Objectives

* Make an exe file that can be run by a user
* Build an HTML5 app

# Log

#### Tried to make an executable jar file with warble. The file is generated, but I can't run it: 

```
vasyl@xps956:~/code/jruby-libgdx$ warble
No executable matching config.jar_name found, using bin/main
rm -f jruby-libgdx.jar
Creating jruby-libgdx.jar
vasyl@xps956:~/code/jruby-libgdx$ java -jar jruby-libgdx.jar 
AL lib: (EE) alc_cleanup: 1 device not closed
```

#### Trying compiling with gradle

```
vasyl@xps956:~/code/jruby-libgdx$ jrubyc bin/main 
locate jruby.jar
# pick the relevant: /usr/share/rvm/rubies/jruby-9.2.6.0/lib/jruby.jar 
java -cp .:/usr/share/rvm/rubies/jruby-9.2.6.0/lib/jruby.jar bin.main
# Works!
```

##### How to build?

https://libgdx.badlogicgames.com/documentation/gettingstarted/Setting%20Up.html

