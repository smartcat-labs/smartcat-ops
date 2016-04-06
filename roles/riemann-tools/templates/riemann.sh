#!/bin/bash

riemann-health --host {{ riemann_tools_target }} &
riemann-diskstats --host {{ riemann_tools_target }} &
riemann-net --host {{ riemann_tools_target }} &
