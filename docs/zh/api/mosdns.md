# MosDNS 管理

## 基础与统计

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/stats` | 统计信息 | 登录用户 |
| GET | `/api/v1/mosdns/cache/detailed` | 缓存详情 | 登录用户 |
| GET | `/api/v1/mosdns/metrics/raw` | 原始指标 | 登录用户 |
| GET | `/api/v1/mosdns/audit/stats` | 审计统计 | 登录用户 |
| GET | `/api/v1/mosdns/audit/ranks` | 审计排行 | 登录用户 |
| GET | `/api/v1/mosdns/rule-sets` | 规则集列表 | 登录用户 |
| GET | `/api/v1/mosdns/query-meta` | 查询元信息 | 登录用户 |
| GET | `/api/v1/mosdns/query-logs` | 查询日志 | 登录用户 |
| GET | `/api/v1/mosdns/clients` | 客户端列表 | 登录用户 |
| GET | `/api/v1/mosdns/version` | 当前版本 | 登录用户 |

## 客户端管理（管理员）

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| POST | `/api/v1/mosdns/clients` | 创建客户端 | admin |
| POST | `/api/v1/mosdns/clients/scan` | 扫描客户端 | admin |
| POST | `/api/v1/mosdns/clients/scan/reset` | 重置扫描 | admin |
| GET | `/api/v1/mosdns/clients/scan/:id` | 查询扫描任务 | admin |
| PATCH | `/api/v1/mosdns/clients/:mac` | 更新客户端 | admin |
| DELETE | `/api/v1/mosdns/clients/:mac` | 删除客户端 | admin |
| POST | `/api/v1/mosdns/client-proxy-mode` | 设置客户端代理模式 | admin |

## 系统控制

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/system/cache` | 缓存概览 | 登录用户 |
| POST | `/api/v1/mosdns/system/cache/clear` | 清理缓存 | 登录用户 |
| GET | `/api/v1/mosdns/system/log-capacity` | 日志容量 | 登录用户 |
| POST | `/api/v1/mosdns/system/log-capacity` | 设置日志容量 | 登录用户 |
| GET | `/api/v1/mosdns/system/routing` | 路由任务状态 | 登录用户 |
| POST | `/api/v1/mosdns/system/routing/start` | 启动路由任务 | 登录用户 |
| POST | `/api/v1/mosdns/system/routing/save` | 保存路由规则 | 登录用户 |
| POST | `/api/v1/mosdns/system/routing/clear` | 清除路由规则 | 登录用户 |
| GET | `/api/v1/mosdns/system/routing/scheduler` | 获取调度配置 | 登录用户 |
| POST | `/api/v1/mosdns/system/routing/scheduler` | 更新调度配置 | 登录用户 |
| GET | `/api/v1/mosdns/system/overrides` | 获取 overrides | 登录用户 |
| POST | `/api/v1/mosdns/system/overrides` | 保存 overrides | 登录用户 |
| GET | `/api/v1/mosdns/system/forward-settings` | 获取转发设置 | 登录用户 |
| POST | `/api/v1/mosdns/system/forward-settings` | 更新转发设置 | 登录用户 |
| GET | `/api/v1/mosdns/system/feature-switches` | 获取开关 | 登录用户 |
| POST | `/api/v1/mosdns/system/feature-switches` | 设置开关 | 登录用户 |
| GET | `/api/v1/mosdns/system/switches` | 获取开关值 | 登录用户 |
| POST | `/api/v1/mosdns/system/switches` | 设置开关值 | 登录用户 |
| GET | `/api/v1/mosdns/system/domains/:type` | 获取域名列表 | 登录用户 |
| GET | `/api/v1/mosdns/system/client-ip-list` | 获取客户端 IP 列表 | 登录用户 |
| POST | `/api/v1/mosdns/system/client-ip-list` | 设置客户端 IP 列表 | admin |

## 版本与配置

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/versions` | 版本列表 | 登录用户 |
| POST | `/api/v1/mosdns/version` | 切换版本 | 登录用户 |
| POST | `/api/v1/mosdns/install` | 安装/更新 | admin |
| GET | `/api/v1/mosdns/config/files` | 配置文件列表 | 登录用户 |
| GET | `/api/v1/mosdns/config/file` | 获取配置内容 | 登录用户 |
| PUT | `/api/v1/mosdns/config/file` | 更新配置内容 | 登录用户 |
| GET | `/api/v1/mosdns/config/download` | 下载配置包 | 登录用户 |
| POST | `/api/v1/mosdns/config/upload` | 上传配置包 | 登录用户 |

## 规则管理

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/rules/categories` | 规则分类 | 登录用户 |
| GET | `/api/v1/mosdns/rules/:type` | 获取规则 | 登录用户 |
| POST | `/api/v1/mosdns/rules/:type` | 添加规则 | 登录用户 |
| PUT | `/api/v1/mosdns/rules/:type` | 更新规则 | 登录用户 |
| DELETE | `/api/v1/mosdns/rules/:type` | 删除规则 | 登录用户 |
| POST | `/api/v1/mosdns/rules/:type/batch` | 批量添加 | 登录用户 |
| DELETE | `/api/v1/mosdns/rules/:type/all` | 清空规则 | 登录用户 |
| GET | `/api/v1/mosdns/rules/:type/export` | 导出规则 | 登录用户 |
| POST | `/api/v1/mosdns/rules/:type/import` | 导入规则 | 登录用户 |

## 广告拦截（AdGuard）

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/adguard/rules` | 获取规则 | 登录用户 |
| POST | `/api/v1/mosdns/adguard/rules` | 添加规则 | operator |
| PUT | `/api/v1/mosdns/adguard/rules/:id` | 更新规则 | operator |
| DELETE | `/api/v1/mosdns/adguard/rules/:id` | 删除规则 | operator |
| POST | `/api/v1/mosdns/adguard/update` | 触发更新 | operator |

## 在线分流规则（Geosite）

| 方法 | 路径 | 说明 | 权限 |
| --- | --- | --- | --- |
| GET | `/api/v1/mosdns/geosite/rules` | 获取规则 | 登录用户 |
| PUT | `/api/v1/mosdns/geosite/rules/:type/:name` | 更新规则 | operator |
| POST | `/api/v1/mosdns/geosite/rules/:type/:name/update` | 更新单条规则 | operator |
| DELETE | `/api/v1/mosdns/geosite/rules/:type/:name` | 删除规则 | operator |
