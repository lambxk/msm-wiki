# 🧪 Beta 版发布

用于查看 MSM `dev` 分支的每日构建发布记录。Beta 版可能包含未完全验证的功能，请勿直接用于生产环境。

---

## 🧪 最新 Beta 版本


> 当前 Beta 版本：`beta-0.9.7`  
> 发布时间：2026-02-09 00:53  
> - 发布页：<https://github.com/msm9527/msm-wiki/releases/tag/beta-0.9.7>  
> - 下载方式：同一发布页内提供各平台二进制与安装包

### 🔧 变更（Changed）
- machine_code统一为UUID格式兼容旧缓存

### 📝 备注（Notes）
- 更新后需清理旧缓存以确保兼容性

::: details 📋 构建信息
- **发布通道**: beta（Beta 版）
- **源提交**: [`b930003`](https://github.com/msm9527/msm/commit/b930003ee1655b0d534cb8550a09f650c4382253)
- **提交信息**: 统一machine_code为UUID格式并兼容旧缓存
- **提交作者**: msm
- **提交时间**: 2026-02-09 00:53:31 +0800
:::

---

## 📚 历史 Beta 版本

> 下面仅展示最新一次 beta 每日构建信息。完整历史请以 GitHub Releases 中 `beta-*` 标签为准。

---

## ⚠️ 使用说明

1. Beta 版标签格式：`beta-x.x.x`
2. Docker 标签格式：`msmbox/msm:beta-x.x.x` 与 `msmbox/msm:beta-latest`
3. 若需稳定环境，请使用[稳定版发布](/zh/guide/releases)
4. Beta 一键安装：`curl -fsSL https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta.sh | sudo bash`
5. Beta 国内镜像安装：`curl -fsSL https://raw.githubusercontent.com/msm9527/msm-wiki/main/install_beta_cn.sh | sudo bash`
