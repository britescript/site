import { defineConfig } from 'vitepress'
import { shikiConfig } from './shiki'

export default defineConfig({
  title: 'Britescript',
  description: 'Modern language that compiles to TypeScript',
  
  ignoreDeadLinks: true,
  
  markdown: {
    // Map britescript to TypeScript for syntax highlighting
    languageAlias: {
      'britescript': 'typescript',
      'brite': 'typescript',
      'bs': 'typescript'
    }
  },
  
  head: [
    ['link', { rel: 'icon', href: '/favicon.ico' }],
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'og:type', content: 'website' }],
    ['meta', { name: 'og:title', content: 'Britescript' }],
    ['meta', { name: 'og:description', content: 'Modern language that compiles to TypeScript' }],
  ],

  themeConfig: {
    logo: '/logo.svg',
    
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Docs', link: '/docs/' },
      { text: 'CLI', link: '/cli/' },
      { text: 'Vite Plugin', link: '/vite-config/' },
      { text: 'VS Code', link: '/vscode-extension/' },
      { text: 'GitHub', link: 'https://github.com/britescript/britescript' }
    ],

    sidebar: {
      '/docs/': [
        {
          text: 'Introduction',
          items: [
            { text: 'What is Britescript?', link: '/docs/' },
            { text: 'Getting Started', link: '/docs/getting-started' },
            { text: 'Installation', link: '/docs/installation' },
          ]
        },
        {
          text: 'Core Concepts',
          items: [
            { text: 'Structs', link: '/docs/concepts/structs' },
            { text: 'Traits', link: '/docs/concepts/traits' },
            { text: 'Implementations', link: '/docs/concepts/implementations' },
            { text: 'Atoms', link: '/docs/concepts/atoms' },
            { text: 'Pattern Matching', link: '/docs/concepts/pattern-matching' },
            { text: 'Pipe Expressions', link: '/docs/concepts/pipe-expressions' },
          ]
        },
        {
          text: 'Advanced',
          items: [
            { text: 'TypeScript Integration', link: '/docs/advanced/typescript-integration' },
            { text: 'JSX Support', link: '/docs/advanced/jsx-support' },
            { text: 'React Integration', link: '/docs/advanced/react-integration' },
          ]
        }
      ],
      '/cli/': [
        {
          text: 'CLI',
          items: [
            { text: 'Overview', link: '/cli/' },
            { text: 'Installation', link: '/cli/installation' },
            { text: 'Commands', link: '/cli/commands' },
            { text: 'Project Setup', link: '/cli/project-setup' },
            { text: 'Configuration', link: '/cli/configuration' },
          ]
        }
      ],
      '/vite-config/': [
        {
          text: 'Vite Plugin',
          items: [
            { text: 'Overview', link: '/vite-config/' },
            { text: 'Installation', link: '/vite-config/installation' },
            { text: 'Configuration', link: '/vite-config/configuration' },
            { text: 'React Integration', link: '/vite-config/react-integration' },
            { text: 'Examples', link: '/vite-config/examples' },
          ]
        }
      ],
      '/vscode-extension/': [
        {
          text: 'VS Code Extension',
          items: [
            { text: 'Overview', link: '/vscode-extension/' },
            { text: 'Installation', link: '/vscode-extension/installation' },
            { text: 'Features', link: '/vscode-extension/features' },
            { text: 'Commands', link: '/vscode-extension/commands' },
            { text: 'Settings', link: '/vscode-extension/settings' },
            { text: 'Themes', link: '/vscode-extension/themes' },
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/britescript/britescript' }
    ],

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2023-present Britescript'
    },

    search: {
      provider: 'local'
    }
  }
})