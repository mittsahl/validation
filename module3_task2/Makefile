PROCESS_ID = $(shell pgrep awesome-api)
POSTNAME = "$(POST_NAME).md"
POSTTITLE = $(POST_TITLE)

lint:		## Runs code through checker
	-golangci-lint run
	-markdownlint ./content/posts/*
	-markdown-link-check ./content/posts/*
	-markdownlint DEPLOY.md
	-markdownlint README.md
go-build:	## Build go api
	@go build
hugo-build:	## Builds hugo site
	@hugo
build:		## Builds hugo website and api
	@make go-build
	@make hugo-build
run:		## Runs application in background 
	-make lint
	-make build
	-make test
	-make validate
	@./awesome-api >./awesome.log 2>&1 &
stop:		## Stops api
	@kill $(PROCESS_ID)
check:		## Checks markdown files and dead links
	@markdownlint ./content/posts/*
	@markdown-link-check ./content/posts/*
unit-tests:	## Runs unit tests on application
	@go test -v -short -coverprofile=coverage-units.out
integration-tests:  ## Runs integration tests on application
	@go test -tags=integration ./main_intetgration_test.go ./main.go -v -coverprofile=coverage-intergrations.out
test:		## Runs unit tests and integration tests on application
	@make unit-tests
	@make integration-tests
validate:	## validates formatting of html
	-w3c_validator.py ./dist/index.html
post:		## Makes a new post on hugo site
	@hugo new posts/$(POSTNAME)
	@sed -i 's/title.*/title: \"$(POSTTITLE)\"/g' $(PWD)/content/posts/$(POSTNAME)
clean:		## Deletes all files in the /dist directory
	-make stop
	-rm -rf ./dist/
	-rm awesome*
	-rm *.out
	-rm -rf awesome-website
package:	## Zips awesome executable and /dist directory
	@mkdir awesome-website
	mv ./dist ./awesome-website
	mv awesome-api ./awesome-website
	zip -r awesome-website.zip awesome-website
help:		## Displays help information for make file 
	@echo "build: Builds hugo website and api\nrun: runs api in background\nstop: kills applicationpost: Makes new post on site. Usage: make POST_NAME=[name of post here] and POST_TITLE=[title of post here] post\nclean: Removes files in /dist directory, error logs, and binary executable\nvalidate: valdiates html code in ./dist/index.html\ncheck: checks to see if there are any dead link in /content/posts/ markdown files\npackage: moves awesome api and /dist directory inyo directory called awesome-website and zips the directory\nhelp: Show this help usage"
