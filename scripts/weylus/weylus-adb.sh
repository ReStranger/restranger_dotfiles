#!/usr/bin/env bash
adb devices
adb reverse tcp:1701 tcp:1701
adb reverse tcp:9001 tcp:9001
