# API 概览

本页基于 `/Users/doumao/code/github/msm` 当前路由定义整理，API 统一以 `/api/v1` 为前缀。

## 基础信息

### 基础地址

```
http://your-server:7777/api/v1
```

### 认证方式

- 登录接口为公开接口
- 其余接口需要在 Header 中携带 JWT Token

```http
Authorization: Bearer <your-jwt-token>
```

### 权限等级

- **viewer**：只读查询
- **operator**：可进行配置与运维操作
- **admin**：管理员权限

## 公开接口

- `GET /api/v1/version`
- `GET /api/v1/update/status`
- `GET /api/v1/setup/check`
- `GET /api/v1/setup/system-info`
- `GET /api/v1/setup/network-interfaces`
- `GET /api/v1/setup/privilege`
- `POST /api/v1/setup/initialize`
- `POST /api/v1/setup/activate`
- `GET /api/v1/setup/download/:component`
- `GET /api/v1/setup/config`

> 说明：`/setup/config` 的 `PUT` 与 `/setup/reset` 需要管理员权限。

## 接口分类

- [认证与会话](/zh/api/auth)
- [初始化与安装](/zh/api/setup)
- [服务管理](/zh/api/services)
- [配置管理](/zh/api/config)
- [历史记录](/zh/api/history)
- [日志管理](/zh/api/logs)
- [系统监控](/zh/api/monitor)
- [用户管理](/zh/api/users)
- [个人资料](/zh/api/profile)
- [系统设置](/zh/api/settings)
- [系统诊断](/zh/api/system)
- [更新管理](/zh/api/update)
- [网络信息](/zh/api/network)
- [审计记录](/zh/api/audit)
- [MosDNS 管理](/zh/api/mosdns)
- [Sing-box 管理](/zh/api/singbox)
- [Mihomo 管理](/zh/api/mihomo)
- [事件流（SSE）](/zh/api/events)
