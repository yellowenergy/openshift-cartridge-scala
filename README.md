# OpenShift Cartridge to deploy Reactive Applications

With this cartridge you can easily deploy Scala, Spray, Play and Akka applications, or any SBT based applications, on the [Openshift PaaS](https://www.openshift.com/).

## Usage

Openshift environment:

```bash
rhc app create demoreactiveapp \
http://cartreflect-claytondev.rhcloud.com/reflect?github=yellowenergy/openshift-cartridge-scala
```

That's all! Now all that is left is to wait for the deployment to complete ;)

## Note

Deployment can sometimes be a rather slow process. Be patient with it and check on the deployment process with following command:

```bash
 ssh id_to_replace@demoreactiveapp-$yournamespace.rhcloud.com "tail -f scala/logs/scala.log"
 ```

## Deployment process

After each `git push`, `sbt compile` will be automatically called, followed by the `start.sh` script at the root of your repo.

In the template project, run `start.sh` script:

```bash
activator run
```
    
Another example:

```bash
sbt run com.example.Boot.main
```

Make sure `start.sh` has the correct permissions to execute: `chmod +x start.sh` 

In your application listen on the environment variable `$OPENSHIFT_SCALA_IP:$OPENSHIFT_SCALA_PORT`

    interface = System.getenv("OPENSHIFT_SCALA_IP")
    port = System.getenv("OPENSHIFT_SCALA_PORT").toInt

This cartridge will embed a quick start application based on Spray [Original Repo](https://github.com/spray/spray-template). Learn more at [spray.io](http://www.spray.io). However, you could use any framework as long as SBT (or an SBT wrapper like activator) is used for compilation.
