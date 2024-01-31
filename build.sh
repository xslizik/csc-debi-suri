#!/bin/bash

create-sandbox .\csc-debi-suri.yml
rm -rf ./sandbox/provisioning
cp -r ./provisioning ./sandbox/provisioning
cd ./sandbox
manage-sandbox build -vvv