#!/bin/bash

activator "start -Dhttp.address=${OPENSHIFT_SCALA_IP} -Dhttp.port=${OPENSHIFT_SCALA_PORT}"
