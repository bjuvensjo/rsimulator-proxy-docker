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
