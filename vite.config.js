import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    port: process.env.PORT || 5173,
    allowedHosts: [
      'localhost',
      '127.0.0.1',
      '1a67819e-2139-478b-be82-0bc29f260284-00-149lulyqb3m1q.janeway.replit.dev' // Replace with your actual Replit domain if different
    ],
    hmr: {
      host: '1a67819e-2139-478b-be82-0bc29f260284-00-149lulyqb3m1q.janeway.replit.dev',
      protocol: 'wss'
    }
  }
});