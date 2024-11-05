# 先删除之前的容器和镜像文件
if [ "$(docker ps -a | grep big-Market-Front)" ]; then
docker stop big-Market-Front
docker rm big-Market-Front
fi
if [ "$(docker images -q jacka7732/big-market-front-app)" ]; then
docker rmi jacka7732/big-market-front-app
fi


# 重新生成
cd /var/jenkins_home/workspace/hwz-bigMarketFront/big-market
docker build -t  jacka7732/big-market-front-app:1.0 .
docker run -itd -p 3000:3000 -p 8091:8091 --name big-Market-Front jacka7732/big-market-front-app:1.0
