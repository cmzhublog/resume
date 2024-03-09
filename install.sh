docker rm -f resume
docker run -d -p 8001:80 --name resume dockerhub.cmzhu.cn:5000/cmzhu/resume:v1 
