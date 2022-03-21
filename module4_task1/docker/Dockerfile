# Start from base image
FROM golang:1.15.8-buster

#Copy files from current directory
COPY ./ ./

# update package lists
RUN apt-get update

# install Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}" 

# Check brew 
RUN which brew

# Install hugo
RUN brew install hugo

# Check hugo
RUN which hugo

#Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.44.2

#Check golang lint
RUN golangci-lint --version

#Install npm and node js
RUN echo y | apt install npm nodejs

# Check npm
RUN which npm

#Install markdownlint
RUN npm install -g markdownlint-cli

#Add markdownlint to path
ENV PATH="/go/node_modules:${PATH}"

#Check markdownlint
RUN which markdownlint

#Install markdown-link-check
RUN npm install markdown-link-check

#Add makrdown-link-check to path
ENV PATH="/go/node_modules/markdown-link-check:${PATH}"

#Check markdown-link-check
RUN which markdown-link-check

