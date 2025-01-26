# survey-maker
Docker container to automate creating cave surveys using Therion and LaTeX

## usage

Download or create the image
```sh
docker buildx build -t survey-maker .
```

Process the survey using the makefile in the project
```sh
docker run --rm -it -v <path/to/project>:/survey survey-maker <make-file>
```

## requirements

docker
docker-buildx-plugin

https://docs.docker.com/engine/install/ubuntu/