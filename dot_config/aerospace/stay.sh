#!/bin/bash

export PREVIOS_WORKSPACE=$(aerospace list-workspaces --focused)
aerospace close
aerospace workspace $PREVIOS_WORKSPACE
