import { h } from 'vue'
import DefaultTheme from 'vitepress/theme'
import './custom.css'

export default {
  extends: DefaultTheme,
  Layout: () => {
    return h(DefaultTheme.Layout, null, {
      // Custom layout slots can be added here if needed
    })
  },
  enhanceApp({ app, router, siteData }) {
    // Register global components or custom directives here
  }
}