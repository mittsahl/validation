POSTNAME = "$(POST_NAME).md"
POSTTITLE = $(POST_TITLE)
build:
	@hugo
post:
	@hugo new posts/$(POSTNAME)
	@sed -i 's/title.*/title: \"$(POSTTITLE)\"/g' $(PWD)/content/posts/$(POSTNAME)
clean:
	@rm -rf ./dist/*
