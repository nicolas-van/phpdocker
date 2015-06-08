#!/bin/bash

version=`cat version`
docker build -t nicolasvan/phpdocker:$version .
