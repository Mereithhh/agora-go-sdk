# aogra rtc sdk

包了一层，原始 sdk 地址：

> [Agora-Golang-Server-SDK](https://github.com/AgoraIO-Extensions/Agora-Golang-Server-SDK)

## 开发

### 1.更新系统动态链接库

```shell
bash ld.sh
```

### 2.使用

```shell
go get github.com/Mereithhh/agora-go-sdk/agoraservice
```

## 构建（dockerfile）
**推荐使用预构建的镜像，节约时间**

把这个仓库里的 `agoraservice/agora_sdk` 下的全部以 `so` 结尾的文件，复制到项目下的 `agora_sdk` 文件夹，再给项目的 `dockerfile` 加上下面的就行了。
```dockerfile
# 安装c++依赖
RUN apt-get update && apt-get install -y \
  libc++-dev \
  libc++abi-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# 复制并配置动态链接库
COPY ./agora_sdk/* /usr/local/lib/
RUN ldconfig
```

## 建议
可以把 so 文件复制到自己的 oss/cdn 上，写一个脚本跑一下就加载了，这样可以不用把动态链接库放到项目里造成污染。