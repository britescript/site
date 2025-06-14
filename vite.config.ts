import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { britescript } from '@britescript/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    britescript({
      jsx: true,
      jsxFactory: 'React.createElement',
      jsxFragment: 'React.Fragment',
      verbose: true,
      development: true,
      sourceMaps: false // Disable source maps to reduce caching
    }),
    react()
  ],
  resolve: {
    extensions: ['.mjs', '.js', '.mts', '.ts', '.jsx', '.tsx', '.json', '.bsx', '.bs']
  },
  optimizeDeps: {
    include: ['react', 'react-dom']
  },
  esbuild: {
    loader: 'tsx',
    include: /\.(tsx?|jsx?|bsx?)$/
  },
  server: {
    hmr: true
  },
  build: {
    rollupOptions: {
      cache: false
    }
  }
})
