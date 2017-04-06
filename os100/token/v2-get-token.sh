#!/bin/bash

curl -si -X POST -H "Content-Type: application/json" -d @$1 http://127.0.0.1:5000/v2.0/tokens

