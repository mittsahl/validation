PROCESS_ID = $(shell pgrep awesome-api)

lint:           ## Runs code through the checker
	@golangci-lint run
build:		## Builds go application
	@make lint
	@go build
run:		## Runs application in the background with error logs written to awesome-api.log
	@./awesome-api >./awesome.log 2>&1 &
stop:		## Kills application process
	@kill $(PROCESS_ID)
clean:		## Removes binary of awesome-api and awesom.log
	@rm awesome-api awesome.log
test:		## Tests if api is working
	@curl http://localhost:9999
	@curl http://localhost:9999/health
unit-tests:	## Runs unit tests on application
	@go test -v -short -coverprofile=coverage-units.out
help:		## Prints instructions on how to use the make commands
	@echo "help: Prints instructions on how to use make commands in this repo\nbuild: builds binary exectuable in repo\nrun: runs application in background and writes logs to file awesome.log\nstop: kills application process\nclean: removes binary executable and logs\ntest: curls api program to check responses"
