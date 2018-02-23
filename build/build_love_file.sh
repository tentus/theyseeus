#!/bin/bash

NAME="build/theyseeus-$(date +"%Y.%m.%d").love"

cd ../
zip ${NAME} * -qrx build/\* *.md *.tmx *.tsx
ls ${NAME} -s
