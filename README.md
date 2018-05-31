# Ulordrig 挖矿程序 docker 镜像 


作者：daoying007 <daoying007@gmail.com>

作者Ulord地址：`UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW` 欢迎打赏

github地址：https://github.com/daoying007/ulordrig-docker

Docker Hub 地址：https://hub.docker.com/r/daoying007/ulordrig/


## 一、安装Docker

1. [Docker安装方法点击这里](https://yeasy.gitbooks.io/docker_practice/content/install/ubuntu.html)

2. [Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice/)


## 二、方式一：直接使用已编译的镜像


1. 使用 Docker Hub 镜像（国内速度略慢）：
```
docker run -d -e ADDRESS=UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW -e POOL_ADDRESS=u1pool.com:18888 -e THREADS=3 -e PASS=x -e MINER_NAME=daoying007Docker --name ulordrig daoying007/ulordrig
```

2. 使用 阿里云提供的容器镜像（国内速度较快）：
```
docker run -d -e ADDRESS=UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW -e POOL_ADDRESS=u1pool.com:18888 -e THREADS=3 -e PASS=x -e MINER_NAME=daoying007Docker --name ulordrig registry.cn-hangzhou.aliyuncs.com/daoying007/ulordrig
```


## 三、方式一：手动编译镜像

### 1. 编译镜像

进入Dockerfile文件所在目录，编译镜像：

```
docker build -t ulordrig-docker:latest .
```


### 2. 运行容器


```
docker run -d -e ADDRESS=UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW -e POOL_ADDRESS=u1pool.com:18888 -e THREADS=3 -e PASS=x -e MINER_NAME=daoying007Docker --name ulordrig ulordrig:latest
```


## 四、查看日志

查看运行日志：
```
docker exec -it ulordrig tail -f /var/log/ulordrig.log
```

## 五、注意点

1. 环境变量 `ADDRESS` 为Ulord钱包地址，如：`UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW`。

2. 环境变量 `POOL_ADDRESS` 矿池地址，如：`u1pool.com:18888`。

3. 环境变量 `MINER_NAME` 为矿机名，只是方便识别是哪个矿机的算力，可随意填，直接用默认 `daoying007` 也可。注意：只能包含字母和数字，不能包含 `-` `_` 之类的符号。

4. 环境变量 `THREADS` 为启动进程数，一般同CPU核数即可，如：`4`。

5. 环境变量 `PASS` 默认 `x` 即可。