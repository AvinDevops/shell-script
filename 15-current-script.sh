#!/bin/bash

COURSE="Devops from current script"

echo "Before calling other script, course value: $COURSE"
echo "PID of the current script: $$"

#./16-other-script.sh

source ./16-other-script.sh

echo "After calling other script, course value: $COURSE"