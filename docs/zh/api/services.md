# 服务管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/services` | 获取服务列表 | 登录用户 |
| GET | `/api/v1/services/proxy` | 获取代理服务列表 | 登录用户 |
| GET | `/api/v1/services/:name` | 获取服务详情 | 登录用户 |
| GET | `/api/v1/services/:name/exists` | 检查服务是否存在 | 登录用户 |
| POST | `/api/v1/services/:name/start` | 启动服务 | operator |
| POST | `/api/v1/services/:name/stop` | 停止服务 | operator |
| POST | `/api/v1/services/:name/restart` | 重启服务 | operator |
| GET | `/api/v1/services/:name/logs` | 查看服务日志 | viewer |
| PUT | `/api/v1/services/:name/config` | 更新服务配置 | operator |
| GET | `/api/v1/proxy/summary` | 代理核心概要 | 登录用户 |
