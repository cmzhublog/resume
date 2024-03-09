FROM docker.io/dockette/nodejs:v12 as base

## install the packages
RUN apk add vim git python3 

## clone the registry and install it 
RUN git clone https://github.com/cmzhublog/HackMyResume.git 
COPY resume.json /resume.json
RUN  cd HackMyResume \
    && npm install hackmyresume -g \
    && hackmyresume new resume.json \
    && hackmyresume build /resume.json TO /out/resume.all 


## 部署阶段
FROM nginx:alpine3.18-perl as nginx
COPY --from=base /out/resume.html  /usr/share/nginx/html/index.html
