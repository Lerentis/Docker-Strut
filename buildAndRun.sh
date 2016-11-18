#!/bin/bash
docker build -t strut .
docker run -d -p 80:9000 strut
