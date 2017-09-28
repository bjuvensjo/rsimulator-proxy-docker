#!/bin/bash

mkdir $RSIMULATOR_HOME/configuration
mv -n $JETTY_HOME/resources/* $RSIMULATOR_HOME/configuration/
rm -f $JETTY_HOME/resources/*
ln -s $RSIMULATOR_HOME/configuration/URIMapper.txt $JETTY_HOME/resources/URIMapper.txt 
ln -s $RSIMULATOR_HOME/configuration/logback.groovy $JETTY_HOME/resources/logback.groovy 
ln -s $RSIMULATOR_HOME/configuration/recorder.properties $JETTY_HOME/resources/recorder.properties 

cd $JETTY_HOME; java -DrootPath=$RSIMULATOR_HOME -DuseRootRelativePath=true -jar start.jar
