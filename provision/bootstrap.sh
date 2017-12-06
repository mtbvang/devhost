#!/bin/bash

apt-get update
apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install -y -qq build-essential curl git libssl-dev libffi-dev python-dev
