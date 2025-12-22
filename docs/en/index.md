---
layout: home

hero:
  name: "MSM"
  text: "Unified Management Platform"
  tagline: One-stop visual platform for managing MosDNS, SingBox, and Mihomo
  image:
    src: /logo/logo-square.svg
    alt: MSM Logo
  actions:
    - theme: brand
      text: Get Started
      link: /en/guide/getting-started
    - theme: alt
      text: View Documentation
      link: /en/introduction/what-is-msm
    - theme: alt
      text: GitHub
      link: https://github.com/yourusername/msm

features:
  - icon: 🚀
    title: One-Click Deployment
    details: Single binary deployment with no complex configuration required
  - icon: 🎨
    title: Modern Interface
    details: Built with React + TailwindCSS for a beautiful and smooth user experience
  - icon: 🔐
    title: Permission Management
    details: Complete user permission system with multi-role management
  - icon: ⚡
    title: Real-time Monitoring
    details: WebSocket real-time push of service status and log information
  - icon: 📝
    title: Configuration Management
    details: Online configuration editing with history version rollback support
  - icon: 🔄
    title: Multi-Kernel Support
    details: Support for switching between different kernel versions and configurations
  - icon: 🌐
    title: Bilingual Support
    details: Complete Chinese and English interface with internationalization support
  - icon: 🛡️
    title: Secure and Reliable
    details: JWT authentication, HTTPS support, and operation auditing
---

## What is MSM?

MSM (Mosdns Singbox Mihomo Manager) is a unified visual platform for managing **MosDNS**, **SingBox**, and **Mihomo**. Install, start, stop, uninstall, and configure three core network services with one click through a Web interface, replacing traditional script-based management with a modern approach.

## Core Features

- **Unified Management**: Manage all services on one platform
- **Visual Operations**: Intuitive Web interface, no command line needed
- **Configuration Editing**: Built-in Monaco editor with syntax highlighting
- **History Rollback**: Automatically save configuration history, one-click rollback
- **Real-time Monitoring**: Real-time view of service status and logs
- **Permission Control**: Multi-level permission management, secure and reliable

## Quick Start

### Single Binary Deployment

```bash
# Download latest version
wget https://github.com/yourusername/msm/releases/latest/download/msm-linux-amd64

# Add execute permission
chmod +x msm-linux-amd64

# Set JWT secret
export JWT_SECRET="your-secret-key-here"

# Run
./msm-linux-amd64
```

Visit `http://localhost:7777` to use.

### Docker Deployment

```bash
docker run -d \
  --name msm \
  -p 7777:7777 \
  -e JWT_SECRET="your-secret-key" \
  -v /opt/msm/data:/app/data \
  yourusername/msm:latest
```

## Tech Stack

### Backend
- **Golang** - High-performance backend framework
- **Gin** - HTTP API framework
- **GORM** - ORM database operations
- **SQLite** - Lightweight database

### Frontend
- **React 18** - Modern frontend framework
- **TypeScript** - Type safety
- **Vite** - Fast build tool
- **TailwindCSS** - Utility-first CSS framework
- **shadcn/ui** - High-quality UI component library

## Community

- [GitHub Issues](https://github.com/yourusername/msm/issues) - Report issues
- [GitHub Discussions](https://github.com/yourusername/msm/discussions) - Discussion and exchange
- [Contributing Guide](/en/development/contributing) - Participate in contributions

## License

[MIT License](https://github.com/yourusername/msm/blob/main/LICENSE)
