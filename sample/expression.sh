#!/bin/bash

read expression

result=$(echo "scale=3; $expression" | bc -l)


echo "$rounded_result"
