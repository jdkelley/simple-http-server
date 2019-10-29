# simple-http-server

I get asked, "how can I serve the files I have locally?" A ready answer to this is to use Python's [SimpleHTTPServer][1] (now with Python 3, this is [http.server][1]). This question, however, is often from individuals who will have Docker installed but don't necessarily want to dig into the details of specific python versions or writing a Dockerfile. The goal of this project is to give a single command with no extra dependencies that will serve the directory you point it at. 

***WARNING***: DO NOT run this in production. This is purely a convenience tool.

## Using

To serve files, stand the server up with this docker command. Make sure you map (as a volume with `/serve`) the directory you wish to serve:

```sh
docker run --rm \
    -v <directory-to-serve>:/serve \
    -p 80:8000 \
    jdkelley/simple-http-server:latest
```

To serve your current directory, use:

```sh
docker run --rm \
    -v $(pwd):/serve \
    -p 80:8000 \
    jdkelley/simple-http-server:latest
```

I find it useful to add a bash function to my profile to avoid typing that all out:

```sh
simple-http-server() {
    docker run --rm \
        -v $(pwd):/serve \
        -p 80:8000 \
        jdkelley/simple-http-server:latest
}
```

And then use it with `simple-http-server`. You can find an example of the function I use in [example/bash_functions.sh][5]. 

## Building from source

```sh
docker build -t http-server:latest .
```

To run this generated image and serve your current directory, run `docker run $(pwd):/serve -p 80:8000 http-server:latest`.

## Deployed

This is deployed on [GitHub Package Registry][2] and [Docker Hub][3].

The source can be found on [GitHub.][4]

[//]: # "LINKS"

[1]: https://docs.python.org/3.7/library/http.server.html#module-http.server     "http.server"
[2]: https://github.com/jdkelley/simple-http-server/packages/37410 "jdkelley/simple-http-server GitHub Packages"
[3]: https://hub.docker.com/r/jdkelley/simple-http-server "jdkelley/simple-http-server on Docker Hub"
[4]: https://github.com/jdkelley/simple-http-server "jdkelley/simple-http-server on GitHub" 
[5]: example/bash_functions.sh "Example bash function to push in profile"
