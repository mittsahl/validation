POSTNAME = "$(POST_NAME).md"
POSTTITLE = $(POST_TITLE)
build:		## Builds hugo website
	@hugo
check:		## Checks markdown files and dead links
	@markdownlint ./content/posts/*
	@markdown-link-check ./content/posts/*
validate:	## validates formatting of html
	-w3c_validator.py ./dist/index.html
post:		## Makes a new post on hugo site
	@hugo new posts/$(POSTNAME)
	@sed -i 's/title.*/title: \"$(POSTTITLE)\"/g' $(PWD)/content/posts/$(POSTNAME)
clean:		## Deletes all files in the /dist directory
	@rm -rf ./dist/
help:		## Displays help information for make file 
	@echo "build: Builds hugo website\npost: Makes new post on site. Usage: make POST_NAME=[name of post here] and POST_TITLE=[title of post here] post\nclean: Removes files in /dist directory\nvalidate: valdiates html code in ./dist/index.html\ncheck: checks to see if there are any dead link in /content/posts/ markdown files\nhelp: Show this help usage"
