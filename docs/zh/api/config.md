# 配置管理

配置管理基于配置目录（默认 `<config_dir>/configs`）。

## 接口列表

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/config/tree` | 获取文件树 | operator |
| GET | `/api/v1/config/file` | 获取文件内容 | operator |
| PUT | `/api/v1/config/file` | 更新文件内容 | operator |
| POST | `/api/v1/config/file` | 新建文件 | operator |
| DELETE | `/api/v1/config/file` | 删除文件 | operator |
| POST | `/api/v1/config/validate` | 校验配置 | operator |
| GET | `/api/v1/config/download` | 下载文件 | operator |
| POST | `/api/v1/config/upload` | 上传文件 | operator |
| POST | `/api/v1/config/directory` | 创建目录 | operator |
| POST | `/api/v1/config/rename` | 重命名 | operator |
| POST | `/api/v1/config/copy` | 复制文件 | operator |
