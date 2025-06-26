import { defineConfig } from 'vitepress'
import fs from 'fs'
import path from 'path'

// Load the britescript grammar
const britescriptGrammar = JSON.parse(
  fs.readFileSync(
    path.resolve(__dirname, './theme/languages/britescript.tmLanguage.json'),
    'utf-8'
  )
)

export const shikiConfig = {
  theme: {
    light: 'github-light',
    dark: 'github-dark',
  },
  langs: [
    {
      id: 'britescript',
      scopeName: 'source.britescript',
      grammar: britescriptGrammar,
      aliases: ['brite', 'bs']
    }
  ]
}