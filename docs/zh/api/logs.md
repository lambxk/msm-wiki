# 日志管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/logs/:service` | 获取日志 | viewer |
| GET | `/api/v1/logs/:service/download` | 下载日志 | viewer |
| DELETE | `/api/v1/logs/:service` | 清空日志 | operator |
| GET | `/api/v1/logs/:service/stats` | 日志统计 | viewer |
