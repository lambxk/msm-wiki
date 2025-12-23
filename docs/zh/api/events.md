# 事件流（SSE）

MSM 使用 SSE 提供实时事件流。

## 接口列表

| 方法 | 路径 | 说明 |
| --- | --- | --- |
| GET | `/api/v1/events` | 统一事件流 |
| GET | `/api/v1/events/monitor` | 监控事件 |
| GET | `/api/v1/events/proxy` | 代理事件 |
| GET | `/api/v1/events/mosdns` | MosDNS 事件 |
| GET | `/api/v1/events/mihomo` | Mihomo 事件 |
| GET | `/api/v1/events/logs/:service` | 服务日志流 |

## 说明

- 返回类型为 `text/event-stream`
- 适合在前端使用 `EventSource` 订阅
