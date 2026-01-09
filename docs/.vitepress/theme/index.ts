import { h } from 'vue'
import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'

// 导入自定义样式
import './style/vars.css'
import './style/custom.css'
import './style/advanced.css'
import './style/icons.css'
import './style/svg-icons.css'

export default {
  extends: DefaultTheme,
  Layout: () => {
    return h(DefaultTheme.Layout, null, {
      // 可以在这里插入自定义组件
    })
  },
  enhanceApp({ app, router, siteData }) {
    // 可以在这里注册全局组件
  }
} satisfies Theme
