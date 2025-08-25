/** @type {import('next').NextConfig} */
const nextConfig = {
  // Tell Next.js that the source code is in the 'src' folder
  srcDir: 'src',

  // Enable React strict mode
  reactStrictMode: true,

  // Optional: Enable SWC compiler for faster builds
  swcMinify: true,

  // Optional: If you want images from external domains
  images: {
    domains: [], // add domains if needed
  },
};

module.exports = nextConfig;
