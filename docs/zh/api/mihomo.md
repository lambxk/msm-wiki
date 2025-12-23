# Mihomo 管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mihomo/status` | 获取状态 | viewer |
| GET | `/api/v1/mihomo/overview` | 概览 | viewer |
| POST | `/api/v1/mihomo/start` | 启动 | operator |
| POST | `/api/v1/mihomo/stop` | 停止 | operator |
| POST | `/api/v1/mihomo/restart` | 重启 | operator |
| POST | `/api/v1/mihomo/install` | 安装/更新 | admin |
| GET | `/api/v1/mihomo/versions` | 版本列表 | viewer |
| POST | `/api/v1/mihomo/version` | 切换版本 | operator |
| GET | `/api/v1/mihomo/configs` | 配置列表 | operator |
| POST | `/api/v1/mihomo/config` | 切换配置 | operator |
| PUT | `/api/v1/mihomo/config/:name` | 更新配置 | operator |
| POST | `/api/v1/mihomo/config/:name/rollback` | 回滚配置 | operator |
| GET | `/api/v1/mihomo/uis` | UI 列表 | operator |
| POST | `/api/v1/mihomo/ui` | 切换 UI | operator |
| GET | `/api/v1/mihomo/proxies` | 代理列表 | viewer |
| PUT | `/api/v1/mihomo/proxies/:group` | 切换代理 | operator |
| GET | `/api/v1/mihomo/proxies/:name/delay` | 测速 | viewer |
| GET | `/api/v1/mihomo/controller/configs` | 获取控制器配置 | viewer |
| PATCH | `/api/v1/mihomo/controller/configs` | 更新控制器配置 | operator |
| GET | `/api/v1/mihomo/controller/providers/proxies` | 代理提供商 | viewer |
| GET | `/api/v1/mihomo/controller/providers/rules` | 规则提供商 | viewer |
| GET | `/api/v1/mihomo/controller/providers/proxies/:name/healthcheck` | 健康检查 | operator |
| PUT | `/api/v1/mihomo/controller/providers/proxies/:name` | 更新提供商 | operator |
| GET | `/api/v1/mihomo/traffic` | 流量统计 | viewer |
| GET | `/api/v1/mihomo/rules` | 规则列表 | viewer |
| GET | `/api/v1/mihomo/connections` | 连接列表 | viewer |
| DELETE | `/api/v1/mihomo/connections` | 关闭全部连接 | operator |
| DELETE | `/api/v1/mihomo/connections/:id` | 关闭连接 | operator |
