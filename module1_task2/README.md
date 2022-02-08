# Read Me

## Prerequisites

Unix file-system, shell terminal with bash, zsh, ot ksh, GNU Make version 3.81+,
Git (command line) version 2+, Go programming language,  GoHugo version 0.80+, Docker

## Lifecycle

After installing all the prequisites, create a directory using command
```
hugo new site [directory name here]
```
Move to this newly created directory and run
```
git init
```
Create a new site using:
```
make build
```

Download a theme, unzip the file and move to the themes directory. Run this line:
```
echo theme = \"[theme name here]\" >> config.toml
```

Add a new post using:
```
make POST_NAME = [post name here] POST_TITLE = "[post title here]"
```
The new site will be created in the /dist directory. To clean this directory use the commmand:
```
make clean
```

For help on the make file commands use:
```
make help
```



