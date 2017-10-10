#!/bin/bash
set -ev

VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.2.1:exec)

# Deploy a snapshot version only for master branch and jdk8
if [[ "$TRAVIS_JDK_VERSION" == "oraclejdk8" ]]; then 
  make;
else
  make linux64 && mvn test;
fi;
