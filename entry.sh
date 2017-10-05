#!/bin/bash

mkdir $IMAGE_HOME/configuration
mv -n $JETTY_BASE/resources/* $IMAGE_HOME/configuration/
rm -f $JETTY_BASE/resources/*
ln -s $IMAGE_HOME/configuration/URIMapper.txt $JETTY_BASE/resources/URIMapper.txt 
ln -s $IMAGE_HOME/configuration/logback.groovy $JETTY_BASE/resources/logback.groovy 
ln -s $IMAGE_HOME/configuration/recorder.properties $JETTY_BASE/resources/recorder.properties 

cd $JETTY_BASE; java -jar $JETTY_HOME/start.jar
