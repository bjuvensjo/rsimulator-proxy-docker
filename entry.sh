#!/bin/bash

mkdir $RSIMULATOR_HOME/configuration
mv -n $JETTY_BASE/resources/* $RSIMULATOR_HOME/configuration/
rm -f $JETTY_BASE/resources/*
ln -s $RSIMULATOR_HOME/configuration/URIMapper.txt $JETTY_BASE/resources/URIMapper.txt 
ln -s $RSIMULATOR_HOME/configuration/logback.groovy $JETTY_BASE/resources/logback.groovy 
ln -s $RSIMULATOR_HOME/configuration/recorder.properties $JETTY_BASE/resources/recorder.properties 

cd $JETTY_BASE; java -jar $JETTY_HOME/start.jar
