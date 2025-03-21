#!/bin/bash
echo "Please enter your sudo password:"
sudo -v
docker-compose down -v
sudo rm -rf volumes/db/data/
