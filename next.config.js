/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: false,
  // Habilita servir archivos fuera del alcance "normal"
  async rewrites() {
    return [
      {
        source: '/.well-known/nostr.json',
        destination: '/public/.well-known/nostr.json'
      }
    ];
  }
}

module.exports = nextConfig
