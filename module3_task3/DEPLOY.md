# Deploy

## Archive
Go to actions and click on Module Three Task Two workflow and scroll to bottom of page to download zipped artifact file

## Commands
Use
```
make build
```
to build the application
Use
```
make clean
```
To stop application and clean all logs and compiled file
To change where the logs are written go into make file and edit flag
```
-coverprofile=
```
And put name of desired file to write to for unit test and integration test logs
To verify that the aplication is running use
```
curl https://localhost:9999/health
```
And if the application is running you will receive a response that says ALIVE

