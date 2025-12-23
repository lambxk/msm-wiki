# 初始化与安装

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/setup/check` | 检查是否已初始化 | 公开 |
| GET | `/api/v1/setup/system-info` | 获取系统信息 | 公开 |
| GET | `/api/v1/setup/network-interfaces` | 获取网卡列表 | 公开 |
| GET | `/api/v1/setup/privilege` | 权限检查 | 公开 |
| POST | `/api/v1/setup/initialize` | 初始化系统 | 公开 |
| POST | `/api/v1/setup/activate` | 应用需要重启的设置 | 公开 |
| GET | `/api/v1/setup/download/:component` | 下载组件（SSE） | 公开 |
| GET | `/api/v1/setup/config` | 获取初始化配置 | 公开 |
| PUT | `/api/v1/setup/config` | 更新初始化配置 | admin |
| POST | `/api/v1/setup/reset` | 重置系统 | admin |

## 说明

- `/download/:component` 为 SSE 流式返回
- 重置接口会影响运行状态，请谨慎使用
