# 历史记录

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/history` | 获取历史列表 | operator |
| GET | `/api/v1/history/:id` | 获取单条记录 | operator |
| POST | `/api/v1/history` | 创建历史记录 | operator |
| POST | `/api/v1/history/:id/rollback` | 回滚到指定版本 | operator |
| POST | `/api/v1/history/:id/star` | 标记为稳定版本 | operator |
| DELETE | `/api/v1/history/:id` | 删除记录 | operator |
| GET | `/api/v1/history/compare` | 对比版本 | operator |
