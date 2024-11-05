# 先删除之前的容器和镜像文件
if [ "$(docker ps -a | grep xfg-dev-tech-app)" ]; then
docker stop xfg-dev-tech-app
docker rm xfg-dev-tech-app
fi
if [ "$(docker images -q jacka7732/big-market-front-app)" ]; then
docker rmi jacka7732/big-market-front-app
fi


# 重新生成
cd /var/jenkins_home/workspace/hwz-bigMarketFront/big-market
docker build -t  jacka7732/big-market-front-app:1.0 .
docker run -itd -p 3000:3000 -p 8091:8091 --name xfg-dev-tech-app jacka7732/big-market-front-app:1.0
