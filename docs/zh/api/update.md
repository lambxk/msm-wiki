# 更新管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/update/status` | 获取更新状态 | 公开 |
| POST | `/api/v1/update/check` | 检查更新 | admin |
| POST | `/api/v1/update/download` | 下载更新 | admin |
| POST | `/api/v1/update/install` | 安装更新 | admin |
| POST | `/api/v1/update/cancel` | 取消下载 | admin |
| GET | `/api/v1/update/config` | 获取更新配置 | admin |
| PUT | `/api/v1/update/config` | 更新更新配置 | admin |
