#!/usr/bin/env bash

# This script will install docker on host.
curl https://get.docker.com/ | sudo sh >/dev/null 2>&1

sudo systemctl enable docker >/dev/null 2>&1

sudo systemctl start docker >/dev/null 2>&1
