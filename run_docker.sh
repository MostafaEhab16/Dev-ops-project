#build docker images 
docker build -t mostafa-hello.

#Run the image 
docker run -t -i -p 127.0.0.1:8080:8080 mostafa-hello
