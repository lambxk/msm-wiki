---
layout: home

hero:
  name: "MSM"
  text: "统一管理平台"
  tagline: 一站式管理 MosDNS、SingBox、Mihomo 的可视化平台
  image:
    src: /logo/logo-square.svg
    alt: MSM Logo
  actions:
    - theme: brand
      text: 快速开始
      link: /zh/guide/getting-started
    - theme: alt
      text: 查看文档
      link: /zh/introduction/what-is-msm
    - theme: alt
      text: GitHub
      link: https://github.com/yourusername/msm

features:
  - icon: 🚀
    title: 一键部署
    details: 支持单二进制部署，无需复杂配置，开箱即用
  - icon: 🎨
    title: 现代化界面
    details: 基于 React + TailwindCSS 构建，美观流畅的用户体验
  - icon: 🔐
    title: 权限管理
    details: 完善的用户权限体系，支持多角色管理
  - icon: ⚡
    title: 实时监控
    details: WebSocket 实时推送服务状态和日志信息
  - icon: 📝
    title: 配置管理
    details: 在线编辑配置，支持历史版本回滚
  - icon: 🔄
    title: 多内核支持
    details: 支持切换不同版本的内核和配置
  - icon: 🌐
    title: 双语支持
    details: 完整的中英文界面，国际化支持
  - icon: 🛡️
    title: 安全可靠
    details: JWT 认证、HTTPS 支持、操作审计
---

## 什么是 MSM？

MSM (Mosdns Singbox Mihomo Manager) 是一个统一管理 **MosDNS**、**SingBox**、**Mihomo** 的可视化平台。通过 Web 界面一键安装、启动、停止、卸载和配置三大核心网络服务，以现代化的方式取代传统脚本式管理。

## 核心特性

- **统一管理**: 在一个平台管理所有服务
- **可视化操作**: 直观的 Web 界面，无需命令行
- **配置编辑**: 内置 Monaco 编辑器，支持语法高亮
- **历史回滚**: 自动保存配置历史，一键回滚
- **实时监控**: 实时查看服务状态和日志
- **权限控制**: 多级权限管理，安全可靠

## 快速开始

### 单二进制部署

```bash
# 下载最新版本
wget https://github.com/yourusername/msm/releases/latest/download/msm-linux-amd64

# 添加执行权限
chmod +x msm-linux-amd64

# 设置 JWT 密钥
export JWT_SECRET="your-secret-key-here"

# 运行
./msm-linux-amd64
```

访问 `http://localhost:7777` 即可使用。

### Docker 部署

```bash
docker run -d \
  --name msm \
  -p 7777:7777 \
  -e JWT_SECRET="your-secret-key" \
  -v /opt/msm/data:/app/data \
  yourusername/msm:latest
```

## 技术栈

### 后端
- **Golang** - 高性能后端框架
- **Gin** - HTTP API 框架
- **GORM** - ORM 数据库操作
- **SQLite** - 轻量级数据库

### 前端
- **React 18** - 现代化前端框架
- **TypeScript** - 类型安全
- **Vite** - 快速构建工具
- **TailwindCSS** - 实用优先的 CSS 框架
- **shadcn/ui** - 高质量 UI 组件库

## 社区

- [GitHub Issues](https://github.com/yourusername/msm/issues) - 报告问题
- [GitHub Discussions](https://github.com/yourusername/msm/discussions) - 讨论交流
- [贡献指南](/zh/development/contributing) - 参与贡献

## 许可证

[MIT License](https://github.com/yourusername/msm/blob/main/LICENSE)
