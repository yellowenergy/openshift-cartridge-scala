#!/bin/bash

activator run -Dhttp.address=${OPENSHIFT_SCALA_IP} -Dhttp.port=${OPENSHIFT_SCALA_PORT}
