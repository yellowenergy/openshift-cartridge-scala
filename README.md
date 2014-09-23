# OpenShift Cartridge for deploy Reactive Applications

With this cartridge you could deploy over [Openshift PaaS](https://www.openshift.com/) Scala, Spray, Play and Akka applications... Definitely you are be able to deploy any SBT based Applications.

## Use it

Openshift environment:

```bash
rhc app create demoreactiveapp \
http://cartreflect-claytondev.rhcloud.com/reflect?github=47deg/openshift-cartridge-scala
```

That's all! You only must wait for the deploy is completed ;)

## Note

Deployment can be sometimes a slowly process. Be patient with that. You could deployment process with next command:

```bash
 ssh id_to_replace@demoreactiveapp-subdomain.rhcloud.com "tail -f scala/logs/scala.log"
 ```

## Deploy process

On automatic `git push`, `sbt compile` will be called, then the script `start.sh` at the root of your repo will be called.

In the template project, `start.sh` script run:

```bash
activator run
```
    
Another example could be:

```bash
sbt run com.example.Boot.main
```

Make sure `start.sh` is an executable file: `chmod +x start.sh` 

In your application listen on the environment variable `$OPENSHIFT_SCALA_IP:$OPENSHIFT_SCALA_PORT`

    interface = System.getenv("OPENSHIFT_SCALA_IP")
    port = System.getenv("OPENSHIFT_SCALA_PORT").toInt

This cartridge embed a quick start application based on Spray [Original Repo](https://github.com/spray/spray-template). Learn more at [spray.io](http://www.spray.io). However, you could use any framework as long as sbt (or sbt wrapper like activator) is used for compilation.
