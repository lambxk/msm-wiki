# 用户管理

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/users` | 用户列表 | admin |
| GET | `/api/v1/users/stats` | 用户统计 | admin |
| GET | `/api/v1/users/:id` | 用户详情 | admin |
| POST | `/api/v1/users` | 创建用户 | admin |
| PUT | `/api/v1/users/:id` | 更新用户 | admin |
| DELETE | `/api/v1/users/:id` | 删除用户 | admin |
| POST | `/api/v1/users/:id/reset-password` | 重置密码 | admin（严格限速） |
| POST | `/api/v1/users/:id/toggle-active` | 启用/禁用用户 | admin（严格限速） |
