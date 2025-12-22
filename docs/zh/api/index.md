# API 概览

MSM 提供完整的 RESTful API 和 WebSocket 接口，方便第三方集成和自动化操作。

## 基础信息

### API 地址

```
http://your-server:7777/api
```

### 认证方式

所有 API 请求（除登录接口外）都需要在 Header 中携带 JWT Token：

```http
Authorization: Bearer <your-jwt-token>
```

### 请求格式

- Content-Type: `application/json`
- 字符编码: `UTF-8`

### 响应格式

所有 API 响应统一使用以下格式：

```json
{
  "code": 0,
  "message": "success",
  "data": {}
}
```

**字段说明：**

- `code`: 状态码，0 表示成功，非 0 表示错误
- `message`: 响应消息
- `data`: 响应数据

### 错误码

| 错误码 | 说明 |
|--------|------|
| 0 | 成功 |
| 1000 | 未知错误 |
| 1001 | 服务未找到 |
| 1002 | 服务已运行 |
| 1003 | 服务未运行 |
| 1004 | 配置验证失败 |
| 1005 | 安装失败 |
| 2001 | 认证失败 |
| 2002 | 令牌过期 |
| 2003 | 权限不足 |
| 2004 | 用户已锁定 |
| 2005 | 用户已禁用 |
| 2006 | 密码错误次数过多 |
| 3001 | 参数错误 |
| 3002 | 文件不存在 |
| 3003 | 用户名已存在 |
| 3004 | 用户不存在 |

## API 分类

### 认证相关

- [POST /api/auth/login](/zh/api/auth#登录) - 用户登录
- [POST /api/auth/logout](/zh/api/auth#登出) - 用户登出
- [POST /api/auth/refresh](/zh/api/auth#刷新令牌) - 刷新令牌
- [GET /api/auth/me](/zh/api/auth#获取当前用户) - 获取当前用户信息

### 用户管理

- [GET /api/users](/zh/api/users#获取用户列表) - 获取用户列表
- [GET /api/users/:id](/zh/api/users#获取用户详情) - 获取用户详情
- [POST /api/users](/zh/api/users#创建用户) - 创建用户
- [PUT /api/users/:id](/zh/api/users#更新用户) - 更新用户信息
- [DELETE /api/users/:id](/zh/api/users#删除用户) - 删除用户

### 服务管理

- [GET /api/service/list](/zh/api/service#获取服务列表) - 获取所有服务列表
- [GET /api/service/:name/status](/zh/api/service#获取服务状态) - 获取服务状态
- [POST /api/service/:name/install](/zh/api/service#安装服务) - 安装服务
- [DELETE /api/service/:name/uninstall](/zh/api/service#卸载服务) - 卸载服务
- [POST /api/service/:name/start](/zh/api/service#启动服务) - 启动服务
- [POST /api/service/:name/stop](/zh/api/service#停止服务) - 停止服务
- [POST /api/service/:name/restart](/zh/api/service#重启服务) - 重启服务
- [GET /api/service/:name/logs](/zh/api/service#获取日志) - 获取日志

### 配置管理

- [GET /api/config/:service](/zh/api/config#获取配置) - 获取当前配置
- [POST /api/config/:service](/zh/api/config#保存配置) - 保存配置
- [POST /api/config/:service/validate](/zh/api/config#验证配置) - 验证配置
- [GET /api/config/:service/templates](/zh/api/config#获取模板) - 获取配置模板

### 历史记录

- [GET /api/history/:service](/zh/api/history#获取历史列表) - 获取历史记录列表
- [GET /api/history/:service/:id](/zh/api/history#获取快照详情) - 获取指定快照
- [POST /api/history/:service/:id/rollback](/zh/api/history#回滚配置) - 回滚到指定版本
- [GET /api/history/:service/diff](/zh/api/history#对比版本) - 对比两个版本
- [DELETE /api/history/:service/:id](/zh/api/history#删除快照) - 删除快照

### 系统管理

- [GET /api/system/info](/zh/api/system#系统信息) - 获取系统信息
- [GET /api/system/resources](/zh/api/system#资源使用) - 获取资源使用情况
- [GET /api/system/settings](/zh/api/system#获取设置) - 获取系统设置
- [PUT /api/system/settings](/zh/api/system#更新设置) - 更新系统设置

### WebSocket 接口

- [/ws/logs/:service](/zh/api/websocket#实时日志) - 实时日志流
- [/ws/status](/zh/api/websocket#状态更新) - 实时状态更新
- [/ws/tasks/:taskId](/zh/api/websocket#任务进度) - 任务进度推送

## 快速开始

### 1. 获取 Token

```bash
curl -X POST http://localhost:7777/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "admin123"
  }'
```

响应：

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "id": 1,
      "username": "admin",
      "role": "admin",
      "displayName": "系统管理员"
    }
  }
}
```

### 2. 使用 Token 调用 API

```bash
curl -X GET http://localhost:7777/api/service/list \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

### 3. 刷新 Token

```bash
curl -X POST http://localhost:7777/api/auth/refresh \
  -H "Content-Type: application/json" \
  -d '{
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }'
```

## SDK 和工具

### cURL 示例

```bash
# 设置变量
API_URL="http://localhost:7777/api"
TOKEN="your-jwt-token"

# 获取服务列表
curl -X GET "$API_URL/service/list" \
  -H "Authorization: Bearer $TOKEN"

# 启动服务
curl -X POST "$API_URL/service/mosdns/start" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json"

# 保存配置
curl -X POST "$API_URL/config/mosdns" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "content": "log:\n  level: info\n..."
  }'
```

### Python 示例

```python
import requests

class MSMClient:
    def __init__(self, base_url, username, password):
        self.base_url = base_url
        self.token = None
        self.login(username, password)

    def login(self, username, password):
        response = requests.post(
            f"{self.base_url}/auth/login",
            json={"username": username, "password": password}
        )
        data = response.json()
        if data["code"] == 0:
            self.token = data["data"]["token"]
        else:
            raise Exception(f"Login failed: {data['message']}")

    def get_headers(self):
        return {"Authorization": f"Bearer {self.token}"}

    def get_services(self):
        response = requests.get(
            f"{self.base_url}/service/list",
            headers=self.get_headers()
        )
        return response.json()

    def start_service(self, service_name):
        response = requests.post(
            f"{self.base_url}/service/{service_name}/start",
            headers=self.get_headers()
        )
        return response.json()

# 使用示例
client = MSMClient("http://localhost:7777/api", "admin", "admin123")
services = client.get_services()
print(services)
```

### JavaScript 示例

```javascript
class MSMClient {
  constructor(baseUrl) {
    this.baseUrl = baseUrl;
    this.token = null;
  }

  async login(username, password) {
    const response = await fetch(`${this.baseUrl}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username, password })
    });
    const data = await response.json();
    if (data.code === 0) {
      this.token = data.data.token;
    } else {
      throw new Error(`Login failed: ${data.message}`);
    }
  }

  getHeaders() {
    return {
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    };
  }

  async getServices() {
    const response = await fetch(`${this.baseUrl}/service/list`, {
      headers: this.getHeaders()
    });
    return await response.json();
  }

  async startService(serviceName) {
    const response = await fetch(`${this.baseUrl}/service/${serviceName}/start`, {
      method: 'POST',
      headers: this.getHeaders()
    });
    return await response.json();
  }
}

// 使用示例
const client = new MSMClient('http://localhost:7777/api');
await client.login('admin', 'admin123');
const services = await client.getServices();
console.log(services);
```

## 速率限制

为了保护服务器资源，API 实施了速率限制：

- **全局限制**: 100 请求/分钟/IP
- **登录接口**: 5 请求/分钟/IP
- **敏感操作**: 10 请求/分钟/用户

超过限制将返回 429 状态码。

## 最佳实践

### 1. Token 管理

- 将 Token 安全存储
- 定期刷新 Token
- Token 过期后自动重新登录

### 2. 错误处理

- 检查响应的 code 字段
- 根据错误码进行相应处理
- 记录错误日志便于排查

### 3. 并发控制

- 避免同时发起大量请求
- 使用队列管理请求
- 实现请求重试机制

### 4. 安全建议

- 使用 HTTPS 传输
- 不要在客户端硬编码密码
- 定期更换 JWT 密钥

## 下一步

- [认证接口](/zh/api/auth) - 详细的认证 API 文档
- [服务管理接口](/zh/api/service) - 服务管理 API 文档
- [WebSocket 接口](/zh/api/websocket) - WebSocket 使用指南
