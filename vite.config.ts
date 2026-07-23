import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  // GitHub project pages are served from the repository's subdirectory.
  base: '/Crescent-Luna/',
  plugins: [react()],
})
