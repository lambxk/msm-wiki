# 快速开始

本指南将帮助你快速部署和使用 MSM。

## 系统要求

### 最低配置

- **操作系统**: Linux (Ubuntu 20.04+ / Debian 11+ / CentOS 8+)
- **CPU**: 1 核心
- **内存**: 512MB
- **磁盘**: 2GB 可用空间

### 推荐配置

- **操作系统**: Linux (Ubuntu 22.04 / Debian 12)
- **CPU**: 2 核心以上
- **内存**: 2GB 以上
- **磁盘**: 10GB 以上可用空间
- **网络**: 公网 IP（用于 HTTPS 访问）

## 安装方式

MSM 提供多种安装方式，选择最适合你的方式。

### 方式一：单二进制部署（推荐）

这是最简单的部署方式，适合快速体验和个人使用。

#### 1. 下载程序

```bash
# 下载最新版本（Linux amd64）
wget https://github.com/yourusername/msm/releases/latest/download/msm-linux-amd64

# 或使用 curl
curl -LO https://github.com/yourusername/msm/releases/latest/download/msm-linux-amd64

# 添加执行权限
chmod +x msm-linux-amd64

# 重命名（可选）
mv msm-linux-amd64 msm
```

#### 2. 配置环境变量

```bash
# 设置 JWT 密钥（必须）
export JWT_SECRET="your-secret-key-here"

# 可选配置
export MSM_PORT=7777              # 服务端口，默认 7777
export MSM_DATA_DIR=/opt/msm/data # 数据目录，默认 ./data
```

::: tip 提示
JWT_SECRET 用于生成认证令牌，请使用强密码。可以使用以下命令生成随机密钥：
```bash
openssl rand -base64 32
```
:::

#### 3. 运行程序

```bash
# 前台运行（测试用）
./msm

# 后台运行
nohup ./msm > msm.log 2>&1 &

# 查看日志
tail -f msm.log
```

#### 4. 访问界面

打开浏览器访问：`http://your-server-ip:7777`

默认管理员账号：
- 用户名: `admin`
- 密码: `admin123`

::: warning 安全提示
首次登录后请立即修改默认密码！
:::

### 方式二：Docker 部署

使用 Docker 可以实现快速部署和隔离运行。

#### 1. 安装 Docker

```bash
# Ubuntu/Debian
curl -fsSL https://get.docker.com | bash

# 启动 Docker
systemctl start docker
systemctl enable docker
```

#### 2. 运行容器

```bash
# 创建数据目录
mkdir -p /opt/msm/data

# 运行容器
docker run -d \
  --name msm \
  --restart unless-stopped \
  -p 7777:7777 \
  -e JWT_SECRET="your-secret-key-here" \
  -v /opt/msm/data:/app/data \
  yourusername/msm:latest

# 查看日志
docker logs -f msm
```

#### 3. 使用 Docker Compose

创建 `docker-compose.yml`:

```yaml
version: '3.8'

services:
  msm:
    image: yourusername/msm:latest
    container_name: msm
    restart: unless-stopped
    ports:
      - "7777:7777"
    environment:
      - JWT_SECRET=your-secret-key-here
      - MSM_PORT=7777
    volumes:
      - ./data:/app/data
    networks:
      - msm-network

networks:
  msm-network:
    driver: bridge
```

启动服务：

```bash
docker-compose up -d
```

### 方式三：从源码构建

适合开发者和需要自定义的用户。

#### 1. 安装依赖

```bash
# 安装 Go (1.21+)
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# 安装 Node.js (20+)
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
```

#### 2. 克隆代码

```bash
git clone https://github.com/yourusername/msm.git
cd msm
```

#### 3. 构建项目

```bash
# 使用构建脚本
./build.sh

# 或手动构建
# 构建前端
cd frontend
npm install
npm run build

# 构建后端
cd ../backend
go build -o bin/msm ./cmd/server
```

#### 4. 运行

```bash
cd backend
export JWT_SECRET="your-secret-key"
./bin/msm
```

## 配置 Systemd 服务

为了让 MSM 开机自启动和后台运行，建议配置为 Systemd 服务。

### 1. 创建服务文件

```bash
sudo nano /etc/systemd/system/msm.service
```

### 2. 添加配置

```ini
[Unit]
Description=MSM - Mosdns Singbox Mihomo Manager
Documentation=https://github.com/yourusername/msm
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/msm
ExecStart=/opt/msm/msm
Restart=on-failure
RestartSec=5s
Environment="JWT_SECRET=your-secret-key-here"
Environment="MSM_PORT=7777"
Environment="MSM_DATA_DIR=/opt/msm/data"

# 安全配置
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true
ReadWritePaths=/opt/msm/data

[Install]
WantedBy=multi-user.target
```

### 3. 启动服务

```bash
# 重载 systemd 配置
sudo systemctl daemon-reload

# 启动服务
sudo systemctl start msm

# 设置开机自启
sudo systemctl enable msm

# 查看状态
sudo systemctl status msm

# 查看日志
sudo journalctl -u msm -f
```

## 配置 Nginx 反向代理

使用 Nginx 可以实现 HTTPS 访问和更好的性能。

### 1. 安装 Nginx

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install nginx

# 启动 Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

### 2. 创建配置文件

```bash
sudo nano /etc/nginx/sites-available/msm
```

### 3. 添加配置

```nginx
server {
    listen 80;
    server_name msm.example.com;

    # 重定向到 HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name msm.example.com;

    # SSL 证书配置
    ssl_certificate /etc/nginx/ssl/msm.crt;
    ssl_certificate_key /etc/nginx/ssl/msm.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    # 前端静态文件（如果使用单二进制部署，可以省略此部分）
    location / {
        proxy_pass http://127.0.0.1:7777;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # API 代理
    location /api/ {
        proxy_pass http://127.0.0.1:7777;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # WebSocket 代理
    location /ws/ {
        proxy_pass http://127.0.0.1:7777;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 86400;
    }
}
```

### 4. 启用配置

```bash
# 创建软链接
sudo ln -s /etc/nginx/sites-available/msm /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重载 Nginx
sudo systemctl reload nginx
```

## 首次使用

### 1. 登录系统

访问 `http://your-server-ip:7777` 或 `https://msm.example.com`

使用默认账号登录：
- 用户名: `admin`
- 密码: `admin123`

### 2. 修改密码

登录后，点击右上角头像 → 设置 → 修改密码

### 3. 创建用户

如果需要多用户使用，可以在"用户管理"页面创建新用户并分配角色。

### 4. 安装服务

在对应的服务管理页面（MosDNS / SingBox / Mihomo）点击"安装"按钮，选择版本进行安装。

### 5. 配置服务

安装完成后，在配置编辑页面编辑配置文件，保存后启动服务。

## 常见问题

### 端口被占用

如果 7777 端口被占用，可以修改端口：

```bash
export MSM_PORT=8888
./msm
```

### 无法访问

检查防火墙设置：

```bash
# Ubuntu/Debian
sudo ufw allow 7777

# CentOS/RHEL
sudo firewall-cmd --permanent --add-port=7777/tcp
sudo firewall-cmd --reload
```

### 服务无法启动

查看日志排查问题：

```bash
# Systemd 服务
sudo journalctl -u msm -n 50

# Docker 容器
docker logs msm

# 直接运行
tail -f msm.log
```

## 下一步

- [基础配置](/zh/guide/basic-config) - 配置系统参数
- [首次使用](/zh/guide/first-use) - 详细使用教程
- [用户管理](/zh/guide/user-management) - 管理用户和权限
