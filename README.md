# rsimulator-proxy-recorder-docker #

The docker image run an instance of the [rsimulator-proxy-recorder](https://github.com/bjuvensjo/rsimulator-proxy-recorder-docker).

## Usage ##

### Run ###

    docker run -d -t -i -p 8082:8080 --rm --name rsimulator-proxy-recorder -v $(pwd)/rsimulator_home:/var/image_home bjuvensjo/rsimulator-proxy-recorder

### Configuration ###

In the rsimulator_home/configuration directory, there are three configuration files:

#### logback.groovy ####

Configures logging.

Example content:

    import ch.qos.logback.classic.encoder.PatternLayoutEncoder
    import ch.qos.logback.core.ConsoleAppender
    import ch.qos.logback.core.FileAppender
    
    import static ch.qos.logback.classic.Level.DEBUG
    import static ch.qos.logback.classic.Level.INFO
    
    def logPpattern = "%d{HH:mm:ss.SSS} %-6relative %-10.8thread %-5level %-10logger{0} %msg%n"
    
    def image_home = System.getenv().get("IMAGE_HOME")
    appender("FILE", FileAppender) {
        file = "${image_home}/rsimulator.log"
        immediateFlush = true
        encoder(PatternLayoutEncoder) {
            pattern = logPpattern
        }
        append = false
    }
    root(DEBUG, ["FILE"])

### recorder.properties ###

Configures recording, i.e. on/off and output directory.

Example content:

    recorder.record=true
    recorder.directory=/var/image_home/recorded

#### URIMapper.txt ####

Configures proxying, with priority as in order specified.

Example content:

    api/(.*)=http://139.107.181.67:8081/api/${1}
    (.*)=http://139.107.181.67:8081/${1}

### Log ###

The rsimulator write logs to rsimulator_home/rsimulator.log
