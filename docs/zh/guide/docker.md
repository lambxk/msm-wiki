# Docker 安装

MSM 提供官方 Docker 镜像，适合容器化部署。

## 快速开始

### 拉取镜像

```bash
docker pull msmbox/msm:latest
```

### 运行容器（推荐）

```bash
docker run -d \
  --name msm \
  --privileged \
  --device /dev/net/tun \
  --sysctl net.ipv4.ip_forward=1 \
  --network host \
  -v /opt/msm:/opt/msm \
  msmbox/msm:latest
```

访问管理界面：`http://localhost:7777`

::: warning 注意
目前 Docker 部署仅支持 `--network host`（不支持 `-p/ports` 端口映射），并需要特权模式（`--privileged`）和 TUN 设备访问权限以支持透明代理、TUN 模式等高级网络功能。
:::

## Docker Compose

```yaml
version: '3.8'

services:
  msm:
    image: msmbox/msm:latest
    container_name: msm
    restart: unless-stopped
    network_mode: host
    privileged: true
    devices:
      - /dev/net/tun
    sysctls:
      - net.ipv4.ip_forward=1
    volumes:
      - ./msm-data:/opt/msm
    environment:
      - TZ=Asia/Shanghai
      - MSM_PORT=7777
```

## 环境变量

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `MSM_PORT` | `7777` | Web 管理界面端口 |
| `MSM_CONFIG_DIR` | `/opt/msm` | 配置文件目录 |
| `JWT_SECRET` | - | JWT 密钥（建议设置） |
| `TZ` | `Asia/Shanghai` | 时区设置 |

## 端口说明

| 端口 | 协议 | 用途 |
| --- | --- | --- |
| 7777 | TCP | Web 管理界面 |
| 53 | UDP/TCP | DNS 服务（MosDNS） |
| 1053 | UDP | DNS 备用端口 |
| 7890 | TCP | HTTP 代理 |
| 7891 | TCP | SOCKS5 代理 |
| 7892 | TCP | 混合代理端口 |
| 6666 | TCP | 管理端口 |

## 支持的架构

此镜像支持以下平台架构：

- `linux/amd64` - x86_64（Intel/AMD 64位）
- `linux/arm64` - ARM64（树莓派 4、Apple Silicon 等）
- `linux/arm/v7` - ARMv7（树莓派 3 等）
- `linux/arm/v6` - ARMv6（树莓派 1/Zero 等）
- `linux/386` - x86 32位

Docker 会自动选择适合您平台的镜像。

## 数据持久化

建议挂载数据卷以持久化配置：

```bash
docker run -d \
  --name msm \
  --privileged \
  --device /dev/net/tun \
  --sysctl net.ipv4.ip_forward=1 \
  --network host \
  -v /your/data/path:/opt/msm \
  msmbox/msm:latest
```

## 安全建议

1. 设置 JWT 密钥：

```bash
-e JWT_SECRET="$(openssl rand -base64 32)"
```

2. 限制网络访问：Host 模式下无法通过端口映射限制访问，请在宿主机上通过防火墙限制 `7777` 端口访问（仅允许可信网段/来源）。
3. 特权模式说明：
   - 容器以 root 用户运行以支持透明代理、TUN 设备等高级网络功能
   - 如不需要这些功能，可移除 `--privileged` 和 `--device /dev/net/tun` 参数
   - 建议在可信环境中运行，或使用网络隔离

## 版本标签

- `latest` - 最新稳定版本（每日自动构建）
- `0.7.2` - 具体版本号

更多版本请查看 Tags 页面。

## 健康检查

容器内置健康检查，每 30 秒检查一次服务状态：

```bash
docker ps --format "table {{.Names}}\t{{.Status}}"
```

## 重要说明

- 容器以 root 权限运行，并需要特权模式以支持透明代理、TUN 设备等高级网络功能
- Docker 部署目前仅支持 Host 网络模式（`--network host` / `network_mode: host`），不支持桥接模式（端口映射）
- 所有网络功能（iptables、路由配置等）均由 Golang 实现，无需外部依赖
- 自动映射 `/dev/net/tun` 设备以支持 TUN 模式
- 建议在可信网络环境中运行，或配置适当的网络隔离措施
