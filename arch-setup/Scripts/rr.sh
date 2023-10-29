#!/bin/bash
~/Apps/rustrover/$(ls -1 ~/Apps/rustrover/ | rg -v gz | sort -Vr | head -n1)/bin/rustrover.sh $*
