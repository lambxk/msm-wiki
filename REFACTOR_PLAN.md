# MSM Wiki 重构计划

## 项目现状分析

### 当前技术栈
- **框架**: VitePress 1.6.4
- **UI 库**: Vue 3.5.26
- **主题**: VitePress 默认主题(未自定义)
- **样式**: 无自定义 CSS

### 存在的问题
1. **视觉设计**
   - 使用默认主题,缺乏品牌特色
   - 留白过多,信息密度低
   - 色彩单调,缺乏视觉层次
   - 缺乏现代化设计元素

2. **布局问题**
   - 内容区域宽度利用率低
   - 侧边栏空间浪费
   - 首页特性展示过于简单
   - 代码块展示不够突出

3. **用户体验**
   - 导航层级不够清晰
   - 缺乏快速跳转功能
   - 搜索功能基础
   - 缺乏交互反馈

4. **内容组织**
   - 页面结构较为传统
   - 缺乏可视化元素
   - 技术文档展示单一
   - 缺乏示例代码高亮

## 重构目标

### 核心目标
1. **现代化设计** - 采用 2024-2025 年流行的设计风格
2. **高信息密度** - 在有限空间内展示更多有价值信息
3. **优秀的可读性** - 保持紧凑的同时确保内容易读
4. **品牌一致性** - 建立统一的视觉语言
5. **响应式设计** - 完美适配各种设备

### 设计原则
- **紧凑但不拥挤** - 减少无效留白,但保持呼吸感
- **层次分明** - 通过色彩、间距、字体建立清晰层次
- **信息优先** - 内容为王,装饰为辅
- **交互友好** - 流畅的动画和即时反馈

## 重构方案

### 一、主题系统重构

#### 1.1 自定义主题配置
```
docs/.vitepress/theme/
├── index.ts              # 主题入口
├── style/
│   ├── vars.css         # CSS 变量定义
│   ├── base.css         # 基础样式重置
│   ├── layout.css       # 布局样式
│   ├── components.css   # 组件样式
│   └── custom.css       # 自定义样式
├── components/
│   ├── Home/
│   │   ├── Hero.vue           # 首页英雄区
│   │   ├── Features.vue       # 特性展示
│   │   ├── QuickStart.vue     # 快速开始
│   │   └── Architecture.vue   # 架构图
│   ├── Layout/
│   │   ├── Sidebar.vue        # 侧边栏
│   │   ├── Navbar.vue         # 导航栏
│   │   └── Footer.vue         # 页脚
│   └── Content/
│       ├── CodeBlock.vue      # 代码块
│       ├── Callout.vue        # 提示框
│       ├── Tabs.vue           # 标签页
│       └── Steps.vue          # 步骤指引
└── composables/
    ├── useDark.ts       # 暗色模式
    └── useScroll.ts     # 滚动控制
```

#### 1.2 设计系统
**色彩方案**
```css
/* 主色调 - 科技蓝 */
--primary: #2563eb;
--primary-light: #3b82f6;
--primary-dark: #1e40af;

/* 辅助色 - 渐变 */
--gradient-start: #2563eb;
--gradient-end: #7c3aed;

/* 语义色 */
--success: #10b981;
--warning: #f59e0b;
--error: #ef4444;
--info: #06b6d4;

/* 中性色 - 高对比度 */
--text-primary: #0f172a;
--text-secondary: #475569;
--text-tertiary: #94a3b8;
--bg-primary: #ffffff;
--bg-secondary: #f8fafc;
--bg-tertiary: #f1f5f9;
--border: #e2e8f0;

/* 暗色模式 */
--dark-bg-primary: #0f172a;
--dark-bg-secondary: #1e293b;
--dark-bg-tertiary: #334155;
--dark-text-primary: #f1f5f9;
--dark-text-secondary: #cbd5e1;
--dark-border: #334155;
```

**字体系统**
```css
/* 字体家族 */
--font-family-base: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif;
--font-family-mono: 'JetBrains Mono', 'Fira Code', Consolas, Monaco, monospace;

/* 字体大小 - 紧凑型 */
--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 0.9375rem; /* 15px - 基础字号略小 */
--text-lg: 1.0625rem;  /* 17px */
--text-xl: 1.25rem;    /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 1.875rem;  /* 30px */
--text-4xl: 2.25rem;   /* 36px */

/* 行高 - 紧凑 */
--leading-tight: 1.25;
--leading-snug: 1.375;
--leading-normal: 1.5;
--leading-relaxed: 1.625;
```

**间距系统 - 紧凑型**
```css
--space-1: 0.25rem;   /* 4px */
--space-2: 0.5rem;    /* 8px */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-5: 1.25rem;   /* 20px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-10: 2.5rem;   /* 40px */
--space-12: 3rem;     /* 48px */
--space-16: 4rem;     /* 64px */
```

### 二、布局优化

#### 2.1 整体布局调整
```css
/* 内容区域宽度优化 */
.VPDoc .container {
  max-width: 1400px;  /* 增加最大宽度 */
}

.VPDoc .content {
  max-width: 900px;   /* 增加内容宽度 */
}

/* 侧边栏优化 */
.VPSidebar {
  width: 280px;       /* 增加侧边栏宽度 */
  padding: var(--space-4);
}

/* 减少垂直间距 */
.vp-doc h2 {
  margin-top: var(--space-8);
  margin-bottom: var(--space-4);
}

.vp-doc p {
  margin: var(--space-3) 0;
}
```

#### 2.2 首页重构
**新首页结构**
```vue
<template>
  <div class="home-page">
    <!-- 1. 英雄区 - 渐变背景 + 动画 -->
    <HeroSection />

    <!-- 2. 快速开始 - 三栏布局 -->
    <QuickStartSection />

    <!-- 3. 核心特性 - 网格布局 -->
    <FeaturesGrid />

    <!-- 4. 架构图 - 可视化展示 -->
    <ArchitectureDiagram />

    <!-- 5. 支持的路由器 - 卡片展示 -->
    <RouterSupport />

    <!-- 6. 使用统计 - 数据展示 -->
    <Statistics />

    <!-- 7. 社区 & 支持 -->
    <CommunitySection />
  </div>
</template>
```

### 三、组件开发

#### 3.1 核心组件列表

**1. 增强型代码块**
```vue
<!-- CodeBlock.vue -->
<template>
  <div class="enhanced-code-block">
    <div class="code-header">
      <span class="language">{{ language }}</span>
      <span class="filename" v-if="filename">{{ filename }}</span>
      <button class="copy-btn">复制</button>
    </div>
    <div class="code-content">
      <slot />
    </div>
  </div>
</template>
```

**2. 标签页组件**
```vue
<!-- Tabs.vue -->
<template>
  <div class="tabs-container">
    <div class="tabs-header">
      <button
        v-for="tab in tabs"
        :key="tab.key"
        :class="{ active: activeTab === tab.key }"
        @click="activeTab = tab.key"
      >
        {{ tab.label }}
      </button>
    </div>
    <div class="tabs-content">
      <slot :name="activeTab" />
    </div>
  </div>
</template>
```

**3. 步骤指引**
```vue
<!-- Steps.vue -->
<template>
  <div class="steps-container">
    <div
      v-for="(step, index) in steps"
      :key="index"
      class="step-item"
    >
      <div class="step-number">{{ index + 1 }}</div>
      <div class="step-content">
        <h3>{{ step.title }}</h3>
        <p>{{ step.description }}</p>
      </div>
    </div>
  </div>
</template>
```

**4. 提示框增强**
```vue
<!-- Callout.vue -->
<template>
  <div :class="['callout', type]">
    <div class="callout-icon">
      <component :is="icon" />
    </div>
    <div class="callout-content">
      <div class="callout-title" v-if="title">{{ title }}</div>
      <slot />
    </div>
  </div>
</template>
```

**5. 架构图组件**
```vue
<!-- ArchitectureDiagram.vue -->
<template>
  <div class="architecture-diagram">
    <svg viewBox="0 0 800 600">
      <!-- 使用 SVG 绘制架构图 -->
    </svg>
  </div>
</template>
```

#### 3.2 组件样式特点
- **卡片化设计** - 所有内容块使用卡片容器
- **微交互** - hover、focus 状态的细腻动画
- **阴影层次** - 使用多层阴影营造深度
- **圆角统一** - 统一使用 8px 圆角
- **边框细节** - 1px 边框 + 内阴影

### 四、页面优化

#### 4.1 文档页面优化
**优化点**
1. **目录导航增强**
   - 固定在右侧
   - 高亮当前章节
   - 显示阅读进度

2. **代码块优化**
   - 添加行号
   - 支持高亮特定行
   - 一键复制
   - 语言标识

3. **内容密度提升**
   - 减少段落间距
   - 优化列表样式
   - 紧凑型表格

4. **交互增强**
   - 平滑滚动
   - 锚点跳转动画
   - 返回顶部按钮

#### 4.2 路由器配置页面优化
**改进方案**
1. **标签页切换** - 不同路由器系统使用标签页
2. **配置步骤** - 使用步骤组件展示
3. **命令高亮** - 特殊样式突出命令
4. **截图展示** - 添加配置截图

### 五、样式系统

#### 5.1 全局样式优化
```css
/* 紧凑型布局 */
:root {
  /* 减少容器内边距 */
  --vp-layout-max-width: 1400px;

  /* 减少垂直间距 */
  --vp-space-section: 48px;
  --vp-space-block: 24px;

  /* 优化字体大小 */
  --vp-font-size-base: 15px;
  --vp-line-height-base: 1.5;
}

/* 内容区域优化 */
.vp-doc {
  padding: var(--space-6) var(--space-8);
}

/* 标题间距优化 */
.vp-doc h1 { margin: var(--space-8) 0 var(--space-4); }
.vp-doc h2 { margin: var(--space-8) 0 var(--space-4); }
.vp-doc h3 { margin: var(--space-6) 0 var(--space-3); }

/* 段落间距 */
.vp-doc p { margin: var(--space-3) 0; }

/* 列表优化 */
.vp-doc ul, .vp-doc ol {
  margin: var(--space-3) 0;
  padding-left: var(--space-6);
}

.vp-doc li {
  margin: var(--space-2) 0;
}
```

#### 5.2 代码块样式
```css
.vp-code-group {
  margin: var(--space-4) 0;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.vp-code-group .tabs {
  background: var(--bg-secondary);
  padding: var(--space-2) var(--space-4);
  border-bottom: 1px solid var(--border);
}

div[class*='language-'] {
  margin: 0;
  border-radius: 0;
}

div[class*='language-'] pre {
  padding: var(--space-4);
  line-height: 1.5;
  font-size: 14px;
}
```

#### 5.3 卡片样式系统
```css
.card {
  background: var(--bg-primary);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: var(--space-5);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
  transition: all 0.2s ease;
}

.card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.card-header {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  margin-bottom: var(--space-4);
}

.card-title {
  font-size: var(--text-lg);
  font-weight: 600;
  color: var(--text-primary);
}

.card-content {
  font-size: var(--text-sm);
  color: var(--text-secondary);
  line-height: var(--leading-normal);
}
```

### 六、响应式设计

#### 6.1 断点系统
```css
/* 移动端优先 */
@media (min-width: 640px) { /* sm */ }
@media (min-width: 768px) { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
@media (min-width: 1536px) { /* 2xl */ }
```

#### 6.2 移动端优化
- 侧边栏抽屉式
- 导航栏折叠
- 代码块横向滚动
- 触摸友好的按钮尺寸

### 七、性能优化

#### 7.1 优化措施
1. **图片优化**
   - 使用 WebP 格式
   - 懒加载
   - 响应式图片

2. **代码分割**
   - 组件按需加载
   - 路由懒加载

3. **CSS 优化**
   - 移除未使用的样式
   - CSS 压缩

4. **字体优化**
   - 字体子集化
   - 字体预加载

### 八、实施计划

#### 阶段一：基础架构 (第 1-2 天)
- [ ] 创建自定义主题目录结构
- [ ] 配置 CSS 变量系统
- [ ] 实现基础布局组件
- [ ] 设置暗色模式

#### 阶段二：组件开发 (第 3-4 天)
- [ ] 开发增强型代码块
- [ ] 开发标签页组件
- [ ] 开发步骤指引组件
- [ ] 开发提示框组件
- [ ] 开发架构图组件

#### 阶段三：首页重构 (第 5 天)
- [ ] 重构英雄区
- [ ] 重构特性展示
- [ ] 添加架构图
- [ ] 添加快速开始区域

#### 阶段四：文档页面优化 (第 6-7 天)
- [ ] 优化安装页面
- [ ] 优化路由器集成页面
- [ ] 优化使用指南页面
- [ ] 优化 FAQ 页面

#### 阶段五：样式精修 (第 8 天)
- [ ] 调整间距系统
- [ ] 优化色彩对比度
- [ ] 添加微交互动画
- [ ] 响应式适配

#### 阶段六：测试与优化 (第 9-10 天)
- [ ] 跨浏览器测试
- [ ] 移动端测试
- [ ] 性能优化
- [ ] 无障碍优化

### 九、技术选型

#### 9.1 保留技术
- VitePress 1.6.4 (核心框架)
- Vue 3.5.26 (组件开发)

#### 9.2 新增依赖
```json
{
  "@vueuse/core": "^10.7.0",        // Vue 组合式 API 工具
  "gsap": "^3.12.0",                 // 动画库
  "lucide-vue-next": "^0.300.0"     // 图标库
}
```

### 十、设计参考

#### 10.1 参考网站
- Tailwind CSS 文档 - 紧凑型布局
- Nuxt 文档 - 现代化设计
- Astro 文档 - 信息密度
- Vercel 文档 - 视觉效果

#### 10.2 设计风格
- **极简主义** - 去除不必要的装饰
- **功能优先** - 每个元素都有明确目的
- **高对比度** - 确保可读性
- **微妙动画** - 提升交互体验

### 十一、成功指标

#### 11.1 视觉指标
- [ ] 信息密度提升 30%
- [ ] 页面留白减少 25%
- [ ] 视觉层次清晰度提升

#### 11.2 性能指标
- [ ] 首屏加载时间 < 2s
- [ ] Lighthouse 性能分数 > 90
- [ ] 移动端体验良好

#### 11.3 用户体验指标
- [ ] 导航效率提升
- [ ] 内容查找速度提升
- [ ] 整体满意度提升

## 总结

这个重构计划将把 MSM Wiki 从一个基础的 VitePress 文档站点,升级为一个现代化、高信息密度、视觉精美的技术文档平台。通过自定义主题、优化布局、开发专用组件和精细化样式调整,我们将创建一个既美观又实用的文档体验。

重构的核心理念是:**在保持可读性的前提下,最大化信息密度,通过精心设计的视觉层次和交互细节,让用户能够快速找到所需信息。**
