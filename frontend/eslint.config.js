import js from '@eslint/js'
import standard from 'eslint-config-standard'
import pluginImport from 'eslint-plugin-import'
import pluginN from 'eslint-plugin-n'
import pluginPromise from 'eslint-plugin-promise'
import react from 'eslint-plugin-react'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import globals from 'globals'

export default [
  js.configs.recommended,

  {
    ignores: ['dist'],
    settings: { react: { version: '18.3' } },
    files: ['**/*.{js,jsx}'],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
      parserOptions: {
        ecmaVersion: 'latest',
        ecmaFeatures: { jsx: true },
        sourceType: 'module'
      }
    }
  },

  {
    plugins: {
      react,
      n: pluginN,
      import: pluginImport,
      promise: pluginPromise,
      'react-hooks': reactHooks,
      'react-refresh': reactRefresh
    },

    rules: {
      ...standard.rules,
      ...react.configs.recommended.rules,
      ...react.configs['jsx-runtime'].rules,
      ...reactHooks.configs.recommended.rules,
      'react/jsx-no-target-blank': 'off',
      'react/prop-types': 'off',
      'react-refresh/only-export-components': ['warn', { allowConstantExport: true }]
    }
  }
]
