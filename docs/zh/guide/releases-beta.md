# 🧪 Beta 版发布

用于查看 MSM `dev` 分支的每日构建发布记录。Beta 版可能包含未完全验证的功能，请勿直接用于生产环境。

---

## 🧪 最新 Beta 版本


> 当前 Beta 版本：`beta-0.9.9`  
> 发布时间：2026-02-10 16:56  
> - 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/beta-0.9.9>  
> - 下载方式：同一发布页内提供各平台二进制与安装包

### ✨ 新增（Added）
- 增加背景修改功能
- 增加客户端未激活遥测上报与机器码兼容
- 添加域名嗅探配置界面
- 添加数据库迁移脚本：为背景图片添加settings字段
- 实现壁纸效果与主题模式绑定功能
- 实现方案 C：Tab 紧凑型布局
- 新增亮度/饱和度/遮罩浓度参数

### 🔧 变更（Changed）
- 限制背景壁纸功能为 Pro 用户专属
- 压缩优化域名嗅探配置模块布局
- 标记全局客户端指纹字段为已弃用
- 默认配置修改
- 重新设计滑动条组件
- 优化背景效果参数名称和说明
- 完善背景设置保存逻辑
- 实现背景壁纸数量限制
- 添加数据库迁移说明文档
- 删除旧的BackgroundSettings组件
- 重构外观设置页面
- 重构背景设置模块布局和效果调节UI

### 🐛 修复（Fixed）
- 修复刷新页面后背景消失的问题
- 修复背景壁纸未覆盖导航栏的问题
- 修复背景图片滚动时菜单栏下方空白问题
- 优化背景效果：修复文字不可读问题

### ⚠️ 废弃（Deprecated）
- 标记全局客户端指纹字段为已弃用

::: details 📋 构建信息
- **发布通道**: beta（Beta 版）
- **源提交**: [`abb26fb`](https://github.com/msm9527/msm/commit/abb26fb76ba02d10aafcacd6b572657f408a000e)
- **提交信息**: 限制背景壁纸功能为 Pro 用户专属
- **提交作者**: msm
- **提交时间**: 2026-02-10 16:56:13 +0800
:::

---

## 📚 历史 Beta 版本

> 下面仅展示最新一次 beta 每日构建信息。完整历史请以 GitHub Releases 中 `beta-*` 标签为准。

---

## ⚠️ 使用说明

1. Beta 版标签格式：`beta-x.x.x`
2. Docker 标签格式：`msmbox/msm:beta-x.x.x` 与 `msmbox/msm:beta-latest`
3. 若需稳定环境，请使用[稳定版发布](/zh/guide/releases)

## 一键安装

```bash
# 使用 curl（sudo）
curl -fsSL https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta.sh | sudo bash
# root 用户
curl -fsSL https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta.sh | bash

# 或使用 wget（sudo）
wget -qO- https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta.sh | sudo bash
# root 用户
wget -qO- https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta.sh | bash
```

::: tip 国内加速（可选）
如果直连 GitHub 较慢，可使用社区加速镜像：

```bash
# curl（sudo）
curl -fsSL https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta.sh | sudo bash
# root 用户
curl -fsSL https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta.sh | bash

# wget（sudo）
wget -qO- https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta.sh | sudo bash
# root 用户
wget -qO- https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta.sh | bash

# 或直接使用国内专用脚本（自动走镜像下载二进制）
curl -fsSL https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta_cn.sh | sudo bash
# root 用户
curl -fsSL https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta_cn.sh | bash
# wget（sudo）
wget -qO- https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta_cn.sh | sudo bash
# root 用户
wget -qO- https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install_beta_cn.sh | bash
```

> 系统自带工具小贴士：Debian/Ubuntu/Alpine 最小镜像通常预装 `wget` 而不一定有 `curl`；CentOS/RHEL/Fedora 常见预装 `curl`；macOS 预装 `curl`。缺少对应工具时可先用包管理器安装（如 `apt-get install curl` 或 `yum install wget`）。
:::
