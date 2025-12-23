# Sing-box 管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/singbox/status` | 获取状态 | viewer |
| POST | `/api/v1/singbox/start` | 启动 | operator |
| POST | `/api/v1/singbox/stop` | 停止 | operator |
| POST | `/api/v1/singbox/restart` | 重启 | operator |
| POST | `/api/v1/singbox/install` | 安装/更新 | admin |
| GET | `/api/v1/singbox/versions` | 版本列表 | viewer |
| POST | `/api/v1/singbox/version` | 切换版本 | operator |
| GET | `/api/v1/singbox/configs` | 配置列表 | operator |
| POST | `/api/v1/singbox/config` | 切换配置 | operator |
| PUT | `/api/v1/singbox/config/:name` | 更新配置 | operator |
| POST | `/api/v1/singbox/config/:name/rollback` | 回滚配置 | operator |
| POST | `/api/v1/singbox/validate` | 配置校验 | operator |
