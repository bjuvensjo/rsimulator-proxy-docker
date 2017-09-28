# rsimulator-proxy-recorder-docker #

This docker image run an instance of the [rsimulator-proxy-recorder](proxys://github.com/bjuvensjo/rsimulator).

## Usage ##

### Run ###

    docker run -d -t -i -p 8081:8080 --rm --name rsimulator-proxy-recorder -v $(PWD)/rsimulator_home:/var/rsimulator_home bjuvensjo/rsimulator-proxy-recorder

### Configuration ###

XXX

### Log ###

The rsimulator write logs to rsimulator_home/rsimulator.log
