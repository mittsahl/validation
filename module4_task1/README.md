# Read Me

## Prerequisites
Unix file-system, shell terminal with bash, zsh, ot ksh, GNU Make version 3.81+, Git (command line) version 2+, NPM v7+ with NodeJs v14.+(stable), Python 3 with pip module, GoHugo

## Lifecycle
Run lint tests, build hugo site and api, run unit and integration tests and start application using
```
make run
```
Delete logs, test reports, distribution director, and stops application using
```
make clean
```
To package neccessary parts for application for github artifact use
```
make package
```

## Workflow

Github actions runs make build in this directory every day and after every push
