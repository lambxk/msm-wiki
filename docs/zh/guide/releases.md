# 📦 版本发布

用于查看 MSM 各版本的更新内容和升级建议。

---

## 🚀 最新稳定版本


> 当前稳定版本：`v0.7.12`  
> 发布时间：2026-02-03 16:11  
> - 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/0.7.12>  
> - 下载方式：同一发布页内提供各平台二进制与安装包

### ✨ 新增（Added）
- 新增系统设置API Token管理
- 新增 Assistant API 与 API Token 鉴权
- 新增 DNS/Mihomo 详情到 assistant inspect
- 新增规则集列表添加全选功能
- 新增代理页面标签页支持URL参数
- 新增代理节点名称显示模式设置
- 新增 MosDNS 查询趋势图表 localStorage 缓存
- 新增 IPv6 自动管理和日志容量设置功能
- 新增 Mihomo 配置编辑页

### 🔧 变更（Changed）
- 更新版本语义化比较
- 更新 MosDNS 规则请求增加 limit=10000
- 优化 assistant/inspect 批量查询与缓存
- 优化 DNS 配置文本域字段布局
- 优化代理节点配置界面
- 优化规则编辑弹窗UI
- 优化规则集编辑弹窗
- 优化策略组编辑弹窗
- 优化代理节点页面UI
- 优化规则仓库页面UI
- 优化规则配置页面UI
- 优化 Mihomo 配置编辑页面UI

### 🐛 修复（Fixed）
- 修复 TypeScript 编译错误
- 修复代理切换成功提示显示不正确
- 修复 MosDNS 频繁保存导致配置丢失
- 修复 MosDNS 缓存统计模式展示
- 修复订阅管理展示并过滤未知 provider
- 修复 DNS 配置开启时验证 Nameserver 不能为空
- 修复策略组表单类型定义中添加缺失的 enabled 字段
- 修复添加多个代理节点时只保存最后一个
- 修复 YAML 解析时移除不允许的控制字符
- 修复多种界面显示和交互问题

### 📝 备注（Notes）
- 确保升级后 mosdns 启动
- 支持分享链接自动解析为代理配置
- 增强配置文件验证功能

::: details 📋 构建信息
- **源提交**: [`00c5c93`](https://github.com/msm9527/msm/commit/00c5c93ad2bf8426ef0365551c1fa3e3b05fc9f6)
- **提交信息**: 清理：迁移遗留方案包 / Chore: archive leftover package
- **提交作者**: doumao
- **提交时间**: 2026-02-03 16:11:42 +0800
:::

---

## 📚 历史版本

> 下面仅列出最近几个版本的主要变更，完整变更记录以 GitHub Release 为准。

### v0.7.4（2026-01-05 21:16） <Badge type="info" text="稳定版" />

- 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/0.7.4>

**新增 / 优化**
- Mihomo 规则管理增强  
  - 规则页支持按配置文件分组排序，方便快速定位  
  - 规则 / Provider 支持“可选重启生效”  
  - 默认 `interval` 等参数调整为更合理的值
- Setup 流程优化  
  - 保存配置时增加下载进度提示  
  - 运行期可切换代理核心，缺失核心自动下载
- 项目管理与下载优化  
  - 新增 Issue 模板与 VPS 预设（含 Mihomo）  
  - CLI / 下载链路默认优先使用内置加速源，界面展示下载进度

**问题修复**
- 修复 Mihomo 规则编辑器初始化报错、弹窗越界、空 `{}` YAML 导致损坏等问题
- 修复前端启停代理、日志级别解析、Toast 长文本、导航高亮等多处 UI / 交互问题
- 修复部分版本号、路径、配置读取错位，尤其是 Setup 与缓存相关逻辑

**注意事项**
- Tauri 桌面链路已基本稳定，但在 macOS 上仍建议重点验证 `launchctl` 工作目录与权限场景

---

### v0.7.3（2026-01-01 13:29）

- 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/0.7.3>

**新增 / 优化**
- Connections 页面重做  
  - 采用弹窗模式，支持保持展开状态，更紧凑的布局  
  - 测速与展开可并存，便于排查连接质量
- 代理链展示优化  
  - 切换操作不再强制折叠，补充更多测速信息  
  - 规则页节点卡片新增图标、双列瀑布流布局
- Setup 优化  
  - 初始化流程与版本号管理进行了多处微调

**问题修复**
- 修复 IPv6 / DNS 开关在保存和读取旧配置时的不一致问题
- 修复 Mihomo 页面若干弹窗居中、溢出与 YAML 处理错误
- 修复白屏、布局跳动等零碎 UI 问题

**注意事项**
- 桌面端与 SSE 改造仍处于快速演进阶段，升级后建议重点观察 SSE 长连接稳定性

---

### v0.7.2（2025-12-31 20:52）

- 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/0.7.2>

**核心内容**
- 桌面端服务管理  
  - 桌面端服务管理与托盘初版  
  - 支持自动安装 / 提权、首次运行门禁、状态面板等
- UI 与链路优化  
  - MosDNS / Mihomo 管理界面大幅改版  
  - 梳理 SSE 相对路径、CORS、静态资源与代理概览链路
- 问题修复  
  - 修复大量 macOS DMG、权限、服务检测相关问题  
  - 修复 Connections 刷新 / 测速 / 展开等问题

---

## 🔄 升级建议

::: warning 升级前准备
1. 升级前建议先备份配置目录和重要数据，避免遗漏迁移
2. 桌面端（Tauri）用户：升级后请确认 `launchctl` / 托盘服务状态，以及本地 API 是否可访问
3. Mihomo 规则 / Provider 编辑器自 0.7.3 起快速演进，升级前建议备份现有 YAML，升级后复核生成结果
:::

### 📖 如何升级

详细步骤请参考：[更新升级指南](/zh/guide/update)。

### 🔗 版本兼容性（0.7.x 系列）

- ✅ 0.7.x 系列版本之间可以直接升级
- 🔄 配置文件在升级过程中会自动迁移和合并
- 💾 建议定期备份配置目录，尤其在跨大版本前

---

## 💬 获取帮助

- 📘 [常见问题](/zh/faq/)：排查常见使用问题
- 🔧 [故障排查](/zh/faq/troubleshooting.html)：定位复杂故障
- 🐛 [GitHub Issues](https://github.com/msm9527/msm-wiki/issues)：报告 Bug 或提交功能需求
- 💬 [GitHub Discussions](https://github.com/msm9527/msm-wiki/discussions)：交流使用经验与方案
