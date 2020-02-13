# Objectives

* Write a game via TDD
* Create a gem automating - fetching libgdx, building
* Build and deploy HTML5 app
* Make an exe file that can be run by a user
* Build an android app

# Making a desktop distribution

How to create a standalone executable jar file? 

https://github.com/jruby/jruby/wiki/StandaloneJarsAndClasses#standalone-executable-jar-files 

```
vasyl@xps956:~/code/jruby-libgdx$ cp /usr/share/rvm/rubies/jruby-9.2.6.0/lib/jruby.jar ./bin/myapp.jar # initial copy of jRuby
vasyl@xps956:~/code/jruby-libgdx/bin$ jar ufe myapp.jar org.jruby.JarBootstrapMain jar-bootstrap.rb ../lib/ # specify the entry script and add directory with sources
vasyl@xps956:~/code/jruby-libgdx/bin$ java -jar myapp.jar # Run
Starting MyGame
[FPSLogger] fps: 0
[FPSLogger] fps: 60

# Works! Managed to launch it on Windows too!
```

## Next

### How to pack assets?

I suppose, just add `../assets/` into the build command. That should be it.

### How to pack Gems?


### How to make stand-alone executable that includes java?

Why: So users don't have to install java.
How: I have jar file, which I could pack with jre and distribute. http://launch4j.sourceforge.net/docs.html
